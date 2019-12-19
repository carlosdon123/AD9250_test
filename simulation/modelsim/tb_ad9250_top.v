// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "04/03/2018 11:16:59"
                                                                                
// Verilog Test Bench template for design : ad9250_top
// 
// Simulation tool : ModelSim-Altera (Verilog)
// 

`timescale 1 ns/ 1 fs

module ad9250_top_vlg_tst();

	reg device_clk = 1'b0;
	reg global_rst_n;
	reg mgmt_clk = 1'b0;
	reg miso;
	reg [1:0] rx_serial_data;
	
	// wires                                               
	wire mosi;
	wire rx_sync_n;
	wire sclk;
	wire ss_n;
	wire data_error;
	wire [13:0]	m0_data;
    wire [13:0] m1_data;
	wire sysref_out;
	
	localparam  DEV_CLK_HALF_CYCLE_PERIOD   = 5/2; //200MHz



// assign statements (if any)                          
ad9250_top i1 (
// port map - connection between master ports and signals/registers   
	.device_clk(device_clk),
	.global_rst_n(global_rst_n),
	.mgmt_clk(mgmt_clk),
	.miso(miso),
	.mosi(mosi),
	.rx_serial_data(rx_serial_data),
	.rx_sync_n(rx_sync_n),
	.sclk(sclk),
	.ss_n(ss_n),
	.m0_data(m0_data),
    .m1_data(m1_data),
	.sysref_out(sysref_out),
	.data_error(data_error)
								);

				
			
		
	
	wire pll_powerdown;
	wire [5:0] tx_bonding_clocks;
    wire [1:0] tx_analogreset;
	wire [1:0] tx_digitalreset;
	wire [1:0] tx_ready;
	wire [1:0] tx_cal_busy;
	wire [1:0] tx_serial_data;
	reg txlink_rst_n;
	reg tx_frame_rst_n;
	reg tx_avs_rst_n;
	reg sysref;
	
	wire sync_n;
	assign sync_n = rx_sync_n;
	//assign sync_n = 1'b0;
	
	
	initial	begin                                                                                             
		$display("Running testbench");    
		global_rst_n = 1'b1;
		#5;
		global_rst_n = 1'b0;	
		# 100;
		global_rst_n = 1'b1;
	end   
		
	// device clock Generation
	always #(DEV_CLK_HALF_CYCLE_PERIOD) device_clk <= ~device_clk;

	wire txlink_clk;
	wire frame_clk;
	
	core_pll tb_core_pll (
		.rst      (~global_rst_n),     		 	// reset.reset
		.refclk   (device_clk),   				// refclk.clk
		.locked   (core_pll_locked),   			// locked.export
		.outclk_0 (txlink_clk), 				// outclk0.clk
		.outclk_1 (frame_clk)  					// outclk1.clk
									);	


		
	


	// mgmt Clock (100MHz)
	always #(5) mgmt_clk <= ~mgmt_clk;

	
   
   initial begin
		
		sysref = 1'b0;
		txlink_rst_n = 1'b0;
		tx_avs_rst_n = 1'b0;
		tx_frame_rst_n = 1'b0;
		//@(posedge tx_ready) begin txlink_rst_n = 1'b1; tx_avs_rst_n = 1'b1; end
		#5055; 
		txlink_rst_n = 1'b1; 
		tx_avs_rst_n = 1'b1;
		tx_frame_rst_n = 1'b1;
		//#5060;
		#10;
		$display("-------Inject single Sysref Pulse ---------");
		
		
		@(posedge txlink_clk) sysref <=1'b1;

		@(posedge txlink_clk) sysref <=1'b0;
		
   end
	
	
	wire pll_locked;
	wire [1:0] pll_locked_bus;
	assign pll_locked_bus = {2{pll_locked}};
	
	//PHY contoller
   	tb_tx_phyrst_ctl tx_phyrst_ctl (
		.clock           (device_clk),       // input clock
		.reset           (~global_rst_n),    // input reset
		.pll_powerdown   (pll_powerdown),    // output pll_powerdown
		.tx_analogreset  (tx_analogreset),   // output [1:0] tx_analogreset
		.tx_digitalreset (tx_digitalreset),  // output [1:0] tx_digitalresett
		.tx_ready        (tx_ready),         // output [1:0] tx_ready
		.pll_locked      (pll_locked),   	 // input pll_locked
		.pll_select      (1'b0),      		 // input pll_select
		.tx_cal_busy     (tx_cal_busy)       // input [1:0] 
													);
	
	atx_pll tb_atx_pll (
		.pll_refclk0       (device_clk),
		.mcgb_rst          (pll_powerdown | ~global_rst_n),      //input  wire mcgb_rst, 
		.pll_powerdown     (pll_powerdown | ~global_rst_n),      //input  pll_powerdown
		
		.pll_cal_busy      (),     					 			 //output  pll_cal_busy
		.tx_serial_clk     (),     								 //tx_serial_clk.clk 
		.pll_locked        (pll_locked),        				 //output  pll_locked
		.tx_bonding_clocks (tx_bonding_clocks)  );				 //output wire [5:0] tx_bonding_clocks 
								
		

	wire jesd204_tx_frame_error;
	wire [63:0] tx_dlb_data;
	wire [7:0] tx_dlb_kchar;
	wire txlink_ready;
	reg [63:0] txlink_data;
	wire dev_sync_n;
	wire mdev_sync_n = dev_sync_n;
	
	wire jesd204_tx_frame_ready;
	wire jesd204_tx_link_valid;
	wire [63:0] jesd204_tx_link_data;
	
   	tx_jesd204b tx_jesd204b (
		.sysref                     (sysref_out),            //sysref.export

		
		.csr_f                      (),                     //csr_f.export
		.csr_k                      (),                     //csr_k.export
		.csr_l                      (),                     //csr_l.export
		.csr_m                      (),                     //csr_m.export
		.csr_n                      (),                     //csr_n.export
		.csr_s                      (),                     //csr_s.export
		.csr_cf                     (),                     //csr_cf.export
		.csr_cs                     (),                     //csr_cs.export
		.csr_hd                     (),                     //csr_hd.export
		.csr_np                     (),                     //csr_np.export
		.csr_lane_powerdown         (),       				//csr_lane_powerdown.export
		.csr_tx_testmode            (),       				//csr_tx_testmode.export
		.csr_tx_testpattern_a       (),       				//csr_tx_testpattern_a.export
		.csr_tx_testpattern_b       (),       				//csr_tx_testpattern_b.export
		.csr_tx_testpattern_c       (),       				//csr_tx_testpattern_c.export
		.csr_tx_testpattern_d       (),      				//csr_tx_testpattern_d.export

				
		.txlink_clk                 (txlink_clk),       //txlink_clk.clk
		.txlink_rst_n_reset_n       (txlink_rst_n),     //txlink_rst_n.reset_n
		
		.jesd204_tx_avs_clk         (mgmt_clk),         //jesd204_tx_avs_clk.clk
		.jesd204_tx_avs_rst_n       (tx_avs_rst_n),     //jesd204_tx_avs_rst_n.reset_n
		.jesd204_tx_avs_chipselect  (1'b1),  				//jesd204_tx_avs.chipselect
		.jesd204_tx_avs_address     (8'd0),     			//.address
		.jesd204_tx_avs_read        (1'b0),        			//.read
		.jesd204_tx_avs_readdata    (),    				//.readdata
		.jesd204_tx_avs_waitrequest (), 				//.waitrequest
		.jesd204_tx_avs_write       (1'b0),       			//.write
		.jesd204_tx_avs_writedata   (32'd0),   				//.writedata
		
		.jesd204_tx_link_data       (jesd204_tx_link_data),       //input [63:0]	jesd204_tx_link_data;
		.jesd204_tx_link_valid      (jesd204_tx_link_valid),      //input		jesd204_tx_link_valid
		.jesd204_tx_link_ready      (txlink_ready),      		  //output		jesd204_tx_link_ready
		.jesd204_tx_int             (tx_int),            		  //output		jesd204_tx_int;
		
		.sync_n                     (sync_n),                     //input	sync_n;
		.dev_sync_n                 (dev_sync_n),                 //output	dev_sync_n;
		.mdev_sync_n                (mdev_sync_n),                //input	mdev_sync_n;
		
		.jesd204_tx_frame_ready     (jesd204_tx_frame_ready),     //output jesd204_tx_frame_ready
		

		
		.jesd204_tx_frame_error     (jesd204_tx_frame_error),     //input jesd204_tx_frame_error
		.jesd204_tx_dlb_data        (tx_dlb_data),        //output	[63:0]	jesd204_tx_dlb_data
		.jesd204_tx_dlb_kchar_data  (tx_dlb_kchar),  	  //output	[63:0]	jesd204_tx_dlb_data
		
		.pll_locked                 (pll_locked_bus),     //input [1:0] pll_locked
		.txphy_clk                  (),            		  //output [1:0] txphy_clk.export
		
		.tx_serial_data             (tx_serial_data),         //output [1:0] tx_serial_data 
		.tx_analogreset             (tx_analogreset),         //input [1:0] tx_analogreset
		.tx_digitalreset            (tx_digitalreset),        //input [1:0] tx_digitalreset
		.tx_cal_busy                (tx_cal_busy),            //otuput [1:0] tx_cal_busy
		.tx_bonding_clocks_ch0      (tx_bonding_clocks),      //input [5:0]	tx_bonding_clocks_ch0
		.tx_bonding_clocks_ch1      (tx_bonding_clocks)       //input [5:0]	tx_bonding_clocks_ch1
														 );

	

	always @ (*) rx_serial_data = tx_serial_data;


		//-------------------------------------------------

		// Data generator 

		//-------------------------------------------------
		
		always @ (posedge txlink_clk or negedge txlink_rst_n)

		begin

		   if (!txlink_rst_n)

		   begin

			  txlink_data [63:0] <= 64'h00000000;

		   end

		   else 

		   begin

			  if (rx_sync_n && !txlink_ready)

			  begin

				 txlink_data [31:0]  <= 32'hEEEE1111;
				 txlink_data [63:32] <= 32'hEEEE1111;

			  end

			  if (txlink_ready)
			  begin

				txlink_data [31:0] <= txlink_data[31:0] + 1'b1;
				txlink_data [63:32] <= txlink_data[63:32] + 1'b1;
				
			  end 

		   end

		end

	parameter FRAMECLK_DIV = 2;
	parameter L = 2;
	parameter M = 2;
	parameter F = 2;
	parameter N = 14;
	parameter N_PRIME = 16;
	parameter S = 1;
	parameter CS = 0;
	parameter POLYNOMIAL_LENGTH = 7;
	parameter FEEDBACK_TAP = 6;
	
	parameter F1_FRAMECLK_DIV = 2;
	parameter F2_FRAMECLK_DIV = 2;
   //
   // Pattern Generator(s)
   //   

   wire assembler_din_ready;
   wire wire_tx_sample_valid_bus;
   wire [FRAMECLK_DIV*M*S*N-1 : 0] tx_sample_bus;
   wire [FRAMECLK_DIV*M*S*N-1 : 0] tx_sample_bus_tl;
   
   pattern_generator_top #(
		.FRAMECLK_DIV      (FRAMECLK_DIV),
		.M                 (M),
        .N                 (N),
        .S                 (S),				     
    	.POLYNOMIAL_LENGTH (POLYNOMIAL_LENGTH),
        .FEEDBACK_TAP      (FEEDBACK_TAP),
		.REVERSE_DATA      (0)
         ) u_gen (
            .clk               (frame_clk),				 	//input		clk
            .rst_n             (tx_frame_rst_n),		 	//input		rst_n
			.csr_tx_testmode   (4'b1001),   			 	//input		csr_tx_testmode
			.csr_m             (8'd1),						//input		[7:0] csr_m
            .csr_s             (8'd0),						//input		[4:0] csr_s    
            .error_inject      (1'b0), 						//input		error_inject
			.ready             (assembler_din_ready),		//input		ready				
            .valid             (wire_tx_sample_valid_bus),	//output	valid
            .avst_dataout      (tx_sample_bus)				//output	[(FRAMECLK_DIV*M*N*S)-1:0] avst_dataout   
												);
	

	wire assembler_din_valid;
	wire [FRAMECLK_DIV*M*S*N-1 : 0] assembler_din;
	
	assign assembler_din_valid = wire_tx_sample_valid_bus;	//hard coded for now
    assign assembler_din = tx_sample_bus;		  

 
   //
   // Tx Transport Layer 
   // 
   	
   altera_jesd204_transport_tx_top #(
		.L(L), 
		.F(F),
		.N(N),
		.N_PRIME(N_PRIME),
		.CS(CS),
		.F1_FRAMECLK_DIV (F1_FRAMECLK_DIV),
		.F2_FRAMECLK_DIV (F2_FRAMECLK_DIV),					
		.RECONFIG_EN     (1)   
            ) u_tx_transport (
			   .txlink_rst_n                (txlink_rst_n),				//input	 txlink_rst_n
               .txframe_rst_n               (tx_frame_rst_n),			//input  txframe_rst_n
               .txframe_clk                 (frame_clk),				//input  txframe_clk
               .txlink_clk                  (txlink_clk),				//input  txlink_clk
               .jesd204_tx_datain           (assembler_din),			//input  [DATA_BUS_WIDTH-1:0] jesd204_tx_datain
			   .jesd204_tx_controlin        (1'b0),     				//input  [CONTROL_BUS_WIDTH-1:0] jesd204_tx_controlin for CS=0, connection to this port is not needed
               .jesd204_tx_data_valid       (assembler_din_valid),		//input  jesd204_tx_data_valid
               .jesd204_tx_link_early_ready (jesd204_tx_frame_ready),	//input  jesd204_tx_link_early_ready
               .csr_l                       (5'd1),						//input  [4:0]  csr_l
               .csr_f                       (8'd1),						//input  [7:0]  csr_f
               .csr_n                       (5'd13),					//input  [4:0]  csr_n
               .jesd204_tx_data_ready       (assembler_din_ready),		//output jesd204_tx_data_ready
               .jesd204_tx_link_error       (jesd204_tx_frame_error), 	//output jesd204_tx_link_error
               .jesd204_tx_link_datain      (jesd204_tx_link_data),		//output [(L*32)-1:0]  jesd204_tx_link_datain 	      
               .jesd204_tx_link_data_valid  (jesd204_tx_link_valid)		//output jesd204_tx_link_data_valid 
																	); 
 
 
		
		
		
endmodule

