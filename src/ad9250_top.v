

module ad9250_top(

	input	device_clk,		//器件时钟200MHz
	input	mgmt_clk,		//100MHz管理时钟
	input	global_rst_n,	//全局复位信号
	
	// SPI Specific Signals 
	input	miso,
	output	mosi,
	output 	sclk,
	output  ss_n,

   // Serial In/Out & Control
   //input	[1:0]	rx_seriallpbken,     
   input	[1:0]	rx_serial_data,
   
   output 			rx_sync_n,
   output 			sysref_out,
   output [13:0]	m0_data,
   output [13:0] 	m1_data,
   output 			data_error
						
								);




	parameter L                = 2;  // Number of lanes per converter device
    parameter M                = 2;  // Number of converters per converter device
    parameter F                = 2;  // Number of octets per frame
    parameter S                = 1;  // Number of transmitter samples per converter per frame
    parameter N                = 14; // Number of converter bits per converter
	parameter K				   = 16;
	parameter N_PRIME          = 16; // Number of transmitted bits per sample 
    parameter CS               = 0;  // Number of control bits per conversion sample				 
    parameter F1_FRAMECLK_DIV  = 2;  // Frame clk divider for transport layer when F=1. Valid value = 1 or 4. Default parameter used in all F value scenarios.
  	parameter F2_FRAMECLK_DIV  = 2;  // Frame clk divider for transport layer when F=2. Valid value = 1 or 2. For F=4 & 8, this parameter is not used.
    parameter FRAMECLK_DIV     = (F==1)? F1_FRAMECLK_DIV : (F==2)? F2_FRAMECLK_DIV : 1;
	parameter POLYNOMIAL_LENGTH = 7;
	parameter FEEDBACK_TAP = 6;


								
	
	wire rxlink_clk;
	wire frame_clk;
	wire core_pll_locked;
	
	wire [1:0] rx_analogreset;
	wire [1:0] rx_cal_busy;
	wire [1:0] rx_digitalreset;
	wire [1:0] rx_islockedtodata;
	wire jesd204_rx_frame_error;
	wire jesd204_rx_link_ready;
	
	wire rxlink_rst_n;
	wire rx_frame_rst_n;
	wire rx_avs_rst_n;
	wire xcvr_rst_n;
	wire [63:0] jesd204_rx_link_data;
	wire jesd204_rx_link_valid;
	
	wire dev_lane_aligned;
	wire alldev_lane_aligned;
	
	assign alldev_lane_aligned = dev_lane_aligned;
	assign xcvr_ctrl_rst_n = xcvr_rst_n & global_rst_n & core_pll_locked;
	
	
	wire ad_clk;
	
	core_pll core_pll (
		.rst      (~global_rst_n),     		 	// reset.reset
		.refclk   (device_clk),   				// refclk.clk
		.locked   (core_pll_locked),   			// locked.export
		.outclk_0 (rxlink_clk), 				// outclk0.clk
		.outclk_1 (frame_clk),  				// outclk1.clk
		.outclk_2 (ad_clk)						//ad_clk
									);	

									
	wire [L-1:0] rx_ready;								
	phyrst_controller xcvr_rst_controller (
		.clock              (mgmt_clk),           // clock.clk
		.reset              (~xcvr_ctrl_rst_n),   // reset.reset  高电平有效
		.rx_analogreset     (rx_analogreset),     // rx_analogreset.rx_analogreset
		.rx_cal_busy        (rx_cal_busy),        // input [1:0] rx_cal_busy
		.rx_digitalreset    (rx_digitalreset),    // rx_digitalreset.rx_digitalreset
		.rx_is_lockedtodata (rx_islockedtodata),  // rx_is_lockedtodata.rx_is_lockedtodata
		.rx_ready           (rx_ready)            // rx_ready.rx_ready
	);									
																		

																	
	
   //    
   // Reset synchronizers for base core reset (link clock domain)
   //  
   wire link_rst_n;
	altera_reset_controller #(
		.NUM_RESET_INPUTS        (1),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2)
										) 
	u_rx_link_rst_sync (
      .reset_in0  (link_rst_n), 
      .clk        (rxlink_clk),                                
      .reset_out  (rxlink_rst_n)
										);

   //   
   // Reset synchronizers for transport layer reset (frame clock domain)
   //   
   wire frame_rst_n;
   altera_reset_controller #(
      .NUM_RESET_INPUTS        (1),
      .OUTPUT_RESET_SYNC_EDGES ("deassert"),
      .SYNC_DEPTH              (2)
   ) u_rx_frame_rst_sync (
      .reset_in0  (frame_rst_n), 
      .clk        (frame_clk),                                
      .reset_out  (rx_frame_rst_n)
   );										


	wire avs_rst_n;
	altera_reset_controller #(
		.NUM_RESET_INPUTS        (1),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2)
										) 
	u_rx_link_avst_rst_sync (
      .reset_in0  (avs_rst_n), 
      .clk        (mgmt_clk),                                
      .reset_out  (rx_avs_rst_n)
										);


	reg [7:0]  rx_avs_address = 8'h00;																			
	reg [31:0] rx_avs_writedata = 32'h00000000;
	wire rx_sysref = sysref_out;
	
	// JESD204B RX Core											
	jesd204b jesd204b_rx (
		
		//clock & reset
		.pll_ref_clk                (device_clk),         	 //input pll_ref_clk
		.rxlink_clk                 (rxlink_clk),         	 //input rxlink_clk
		.rxlink_rst_n_reset_n       (rxlink_rst_n),       	 //input rxlink_rst_n
		.rxphy_clk                  (),                   	 //rxphy_clk.export
		.rx_analogreset             (rx_analogreset),        //input rx_analogreset
		.rx_digitalreset            (rx_digitalreset),       //input rx_digitalreset
		.rx_islockedtodata          (rx_islockedtodata),     //input rx_islockedtodata
		.rx_cal_busy                (rx_cal_busy),           //rx_cal_busy.rx_cal_busy

		//Transceiver Interface
		.rx_serial_data             (rx_serial_data),       //rx_serial_data.rx_serial_data
		
		//Avalon-MM
		.jesd204_rx_avs_clk         (mgmt_clk),         				//input	jesd204_rx_avs_clk		
		.jesd204_rx_avs_rst_n       (rx_avs_rst_n),      				//input	jesd204_rx_avs_rst_n	
		.jesd204_rx_avs_chipselect  (1'b1), 							//input jesd204_rx_avs_chipselect
		.jesd204_rx_avs_address     ({2'b00,rx_avs_address[7:2]}),     	//input	[7:0]	jesd204_rx_avs_address
		.jesd204_rx_avs_read        (1'b0),        						//input read
		.jesd204_rx_avs_readdata    (),   								//output	[31:0]	jesd204_rx_avs_readdata
		.jesd204_rx_avs_waitrequest (),									//output waitrequest
		.jesd204_rx_avs_write       (1'b0),       						//input write
		.jesd204_rx_avs_writedata   (rx_avs_writedata),   				//input	[31:0]	jesd204_rx_avs_writedata
		
		//Avalon-ST
		.jesd204_rx_link_data       (jesd204_rx_link_data),      //output [63:0] jesd204_rx_link_data
		.jesd204_rx_link_valid      (jesd204_rx_link_valid),     //output jesd204_rx_link_valid
		.jesd204_rx_link_ready      (jesd204_rx_link_ready),     //input  jesd204_rx_link_ready
		.jesd204_rx_frame_error     (jesd204_rx_frame_error),  	 //input  jesd204_rx_frame_error
		
		//Debug or Testing
		.jesd204_rx_dlb_data        (64'd0),      //input	[63:0]	jesd204_rx_dlb_data
		.jesd204_rx_dlb_data_valid  (2'd0),  	  //input	[1:0]	jesd204_rx_dlb_data_valid
		.jesd204_rx_dlb_kchar_data  (8'd0),  	  //input	[7:0]	jesd204_rx_dlb_kchar_data
		.jesd204_rx_dlb_errdetect   (8'd0),   	  //input	[7:0]	jesd204_rx_dlb_errdetect
		.jesd204_rx_dlb_disperr     (8'd0),    	  //input	[7:0]	jesd204_rx_dlb_disperr
		
		//JESD204b interface
		.sysref                     (rx_sysref),  			  //input	sysref
		.dev_sync_n                 (rx_sync_n),              //output	dev_sync_n
		.sof                        (),                       //sof.export
		.somf                       (),                       //somf.export		
		.dev_lane_aligned           (dev_lane_aligned),       //output	dev_lane_aligned		
		.alldev_lane_aligned        (alldev_lane_aligned),    //input	alldev_lane_aligned		
		
		//CSR control status and register
		.csr_rx_testmode            (),            			 //output	[3:0]	csr_rx_testmode
		.csr_f                      (),                      //                     csr_f.export
		.csr_k                      (),                      //                     csr_k.export
		.csr_l                      (),                      //                     csr_l.export
		.csr_m                      (),                      //                     csr_m.export
		.csr_n                      (),                      //                     csr_n.export
		.csr_s                      (),                      //                     csr_s.export
		.csr_cf                     (),                      //                    csr_cf.export
		.csr_cs                     (),                      //                    csr_cs.export
		.csr_hd                     (),                      //                    csr_hd.export
		.csr_np                     (),                      //                    csr_np.export
		.csr_lane_powerdown         (),         			 //output [1:0] csr_lane_powerdown.export
		
		//out of band
		.jesd204_rx_int             (rx_int)             //output jesd204_rx_int

							);

										
							
   //
   // Rx Transort Layer 
   // 

    
   wire [55:0] deassembler_dout;
   wire deassembler_dout_valid_bus;
   wire deassembler_dout_ready;
   
   altera_jesd204_transport_rx_top #(
		.L               (L),
		.F               (F),
		.N               (N),
		.CS              (CS),
		.N_PRIME         (N_PRIME),      
		.F1_FRAMECLK_DIV (F1_FRAMECLK_DIV),
		.F2_FRAMECLK_DIV (F2_FRAMECLK_DIV),
		.RECONFIG_EN     (1)	
	) u_rx_transport (
        .rxlink_rst_n               (rx_link_rst_n),
        .rxframe_rst_n              (rx_frame_rst_n),
        .rxframe_clk                (frame_clk),
        .rxlink_clk                 (rxlink_clk),
        .jesd204_rx_link_datain     (jesd204_rx_link_data),				//input [63:0] jesd204_rx_link_datain			      
        .jesd204_rx_link_data_valid (jesd204_rx_link_valid),			//input jesd204_rx_link_data_valid
        .jesd204_rx_data_ready      (deassembler_dout_ready),			//input jesd204_rx_data_ready
        .csr_l                      (5'd1),
        .csr_f                      (8'd1),
        .csr_n                      (5'd13),
        .jesd204_rx_dataout         (deassembler_dout),					//output [55:0] jesd204_rx_dataout
		.jesd204_rx_controlout      (),                           		//for CS=0, connection to this port is not needed
        .jesd204_rx_link_error      (jesd204_rx_frame_error),			//output jesd204_rx_link_error
        .jesd204_rx_data_valid      (deassembler_dout_valid_bus),		//output jesd204_rx_data_valid 
        .jesd204_rx_link_data_ready (jesd204_rx_link_ready)				//output jesd204_rx_link_data_ready			    
															);				     						
							
   // 
   // Pattern Checker(s)
   //
   wire [55:0] rx_sample_bus;
   
         pattern_checker_top #(
			.FRAMECLK_DIV      (FRAMECLK_DIV),
			.M                 (M),
            .N                 (N),
            .S                 (S),				     
            .POLYNOMIAL_LENGTH (POLYNOMIAL_LENGTH),
            .FEEDBACK_TAP      (FEEDBACK_TAP),
			.ERR_THRESHOLD     (1),
			.REVERSE_DATA      (0)			     
         ) u_chk (
            .clk              (frame_clk),
            .rst_n            (rx_frame_rst_n),
			.csr_rx_testmode  (4'b1001),          //hard code for data rate reconfig testing
			.csr_m            (8'd1),
            .csr_s            (5'd1),
			.ready            (checker_ready),			// output ready
			.valid            (rx_sample_valid_bus),	// input  valid		
            .avst_datain      (rx_sample_bus),			// input  [FRAMECLK_DIV*M*N*S-1:0] avst_datain
            .err_out          (data_error)				// output err_out
												);

	assign rx_sample_bus = deassembler_dout;
	assign deassembler_dout_ready = checker_ready;
	assign rx_sample_valid_bus = deassembler_dout_valid_bus;						



	 //
	 //
	 wire [27:0] ad_data_out;
	 wire rdempty;
	 
	 fifo_56_28 fifo_56_28 (
		.data(deassembler_dout),				//input	 [55:0]	data
		.wrreq(deassembler_dout_valid_bus),		//input	 wrreq
		.rdreq(rdreq),							//input	 rdreq
		.wrclk(frame_clk),						//input	 wrclk
		.rdclk(ad_clk),							//input	 rdclk
		.q(ad_data_out),						//output [27:0]	q
		.rdempty(rdempty)						//output rdempty
							);	

				
	assign 	rdreq = (!rdempty)? 1'b1 : 1'b0;
	
	reg fifo_data_valid;
	always @ (posedge ad_clk or negedge global_rst_n)
		if(!global_rst_n)
			begin
				fifo_data_valid <= 1'b0;
			end
		else begin
			fifo_data_valid <= rdreq;
		end
		
	reg [13:0] m0_data_reg;
	reg [13:0] m1_data_reg;
	always @ (posedge ad_clk or negedge global_rst_n)
		if(!global_rst_n)
			begin
				m0_data_reg <= 0;
				m1_data_reg <= 0;
			end
		else if(fifo_data_valid) 
			begin
				m0_data_reg = ad_data_out[13:0];
				m1_data_reg = ad_data_out[27:14];
			end
			
		
	assign m0_data = m0_data_reg;
	assign m1_data = m1_data_reg;


	gen_multi_sysref  #(
	   .F(F),
	   .K(K)
	) gen_multi_sysref(
	   .clock(rxlink_clk),				//input clock
	   .rst_n(rxlink_rst_n),			//input rst_n
	   .rx_dev_sync_n(rx_sync_n),		//input rx_dev_sync_n
	   .sysref(sysref_out)				//output sysref
							);

	wire spi_trdy;   //transmite ready
	wire spi_rrdy;	 //receive ready
	wire [7:0] spi_rxdata; 	 //read data from ad
	wire spi_read_n;	    	//读请求
	wire spi_write_n;	    	//写请求
	wire spi_select;			//spi 设备片选
	wire spi_addr;				//spi 地址
	wire [31:0] spi_txdata;		//send to ad9250
	wire trans_done;
	
	
	control_unit  #(
	   .LINK(1), 
	   .L(L),
	   .M(M), 
	   .F(F)  
	) control_unit ( 
	   .clk(mgmt_clk), 							//input clk   mgmt_clk freq 100MHz
	   .rst_n(global_rst_n),					//input rst_n
	   .rx_ready(rx_ready),						//input [LINK*L-1:0] rx_ready
	   .avs_rst_n(avs_rst_n),					//output avs_rst_n
	   .frame_rst_n(frame_rst_n),				//output frame_rst_n
	   .link_rst_n(link_rst_n),					//output link_rst_n
	   .xcvr_rst_n(xcvr_rst_n),					//output xcvr_rst_n
	   .trans_done(trans_done), 				//input trans_done
	   .spi_rxdata(),							//input	[31:0]  spi_rxdata
	   .spi_read_n(spi_read_n),					//output spi_read_n
	   .spi_write_n(spi_write_n),				//output spi_write_n 
	   .spi_txdata(spi_txdata)					//output [31:0]	spi_txdata
								 );							


	
	spi_master spi_master (
		.rst_n(global_rst_n),		//input  rst_n,
		.clk(mgmt_clk),				//input clk
		.spi_txdata(spi_txdata),	//input spi_txdata
		.wr_en(~spi_write_n),
		.rd_en(~spi_read_n),
		
		
		.miso(miso), 				//input  miso
		.ss(ss_n),					//output ss
		.sck(sck),					//input  sck
		.mosi(mosi),				//output mosi
		.io_sel(),					//output io_sel
		.trans_done(trans_done),	//output trans_done
		.read_done(),				//output read_done
		.spi_rxdata(spi_rxdata)		//output [7:0] spi_rxdata
									);
							  				
			
		
	



	
endmodule
							