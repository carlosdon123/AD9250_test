// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


`timescale 1 ps / 1 ps

module control_unit #(
   parameter LINK       = 1, // Number of links, multi 112 core has LINK=2 while single 222 core has LINK=1 
   parameter L          = 2, // Number of lanes, multi 112 core has L=1 while single 222 core has L=2
   parameter M          = 2, // Number of converters per converter device
   parameter F          = 2  // Number of octets per frame
)
( 
   input                  clk, // mgmt_clk freq 100MHz
   input                  rst_n,
//   input  [LINK*L-1:0]    tx_ready,
   input  [LINK*L-1:0]    rx_ready, 
   input 			trans_done,
   input			reset_jesd204b_en,			//上位机发送的复位请求
   
   output           avs_rst_n,
   output           frame_rst_n,
   output           link_rst_n,
   output 			xcvr_rst_n,
   
   input            spi_trdy,
   input            spi_rrdy,   
   input	[7:0]   spi_rxdata,
   output           spi_read_n,
   output           spi_write_n,
   output           spi_select,     
   output	[2:0]   spi_addr,
   output 	[23:0]	spi_txdata
								);

														
														
   
   //   
   // Registers and wires declaration   
   //   
   reg          frame_rst;
   reg          link_rst;
   reg          avs_rst;
   reg  [3:0]   current_state;
   reg  [3:0]   next_state;
   reg          inc_rom_addr_ptr;
   reg          clr_rom_addr_ptr;
   reg          set_rom_clken;
   reg          set_delay_cnt;  
   reg          dec_delay_cnt;
   reg          set_spi_write;
   reg          set_spi_read;  
   reg          set_poll_status; 
   reg          set_first_read;  
   reg          set_reset;
   reg			clr_xcvr_reset;  
   reg          clr_avs_reset;
   reg          clr_core_reset;
   reg  [5:0]   rom_addr_ptr;
   reg          rom_clken;
   reg  [4:0]   delay_cnt;
   reg          spi_write_r;
   reg          spi_read_r;   
   reg  [2:0]   spi_addr_r;
   reg          spi_select_r;
   reg  [23:0]  spi_txdata_r;
   reg          init_reset;
   reg          set_init_reset;  
   reg 			xcvr_rst;

   wire [23:0]  rom_data_out;
   wire [23:0]  rom0_data_out;
   wire         last_rom_addr;
	

  // Transceiver initialization successful indication   
   //assign wire_tx_ready_and = &tx_ready;
   assign wire_rx_ready_and = &rx_ready;
   
   // Waitrequest signals from multiple JESD204B instances  
//   assign wire_tx_waitrequest_and = &jesd204_tx_avs_waitrequest;
//   assign wire_rx_waitrequest_and = &jesd204_rx_avs_waitrequest;
	
   //   
   // FSM states declaration   
   //   
   localparam INIT           = 0;
   localparam INIT_RESET	 = 1;
   localparam READ_ROM       = 2;
   localparam WRITE_SPI      = 3; 
   localparam SET_RESET      = 4;
   localparam CLR_XCVR_RESET = 5;
   localparam CLR_AVS_RESET  = 6;
   localparam CLR_CORE_RESET = 7;
   localparam IDLE           = 8;
   
   //   
   // FSM
   //     
   always @ (posedge clk or negedge rst_n)
   begin
      if (~rst_n) begin
         current_state <= INIT;		  
      end else begin
         current_state <= next_state;		
      end
   end

 
   // ROM last address
   assign last_rom_addr = &rom_data_out;    //按位相与 rom末地址存储数据全为1
			     

   // Next state logic	
   always @ (current_state or wire_rx_ready_and or spi_trdy or delay_cnt or
             last_rom_addr or init_reset or trans_done)
   begin 
      next_state           = current_state;
      inc_rom_addr_ptr     = 1'b0;
      clr_rom_addr_ptr     = 1'b0;
      set_rom_clken        = 1'b0;
      set_delay_cnt        = 1'b0;  
      dec_delay_cnt        = 1'b0;     
      set_spi_write        = 1'b0;
      set_spi_read         = 1'b0; 
      set_poll_status      = 1'b0;
      set_first_read       = 1'b0;      
      set_reset            = 1'b0;
      clr_avs_reset        = 1'b0;
      clr_xcvr_reset	   = 1'b0;
	  clr_core_reset       = 1'b0;
      set_init_reset       = 1'b0; 
      
      case (current_state)
         // Initial state upon power up
         // Clear the ROM address pointer  	 

         INIT: begin			//上电初始化
            if(~init_reset)  	
				next_state = INIT_RESET;		//初始化复位未完成
            else begin
               clr_rom_addr_ptr = 1'b1;
               next_state = READ_ROM;
            end
         end		
	
         INIT_RESET: begin
            set_reset = 1'b1;
            set_init_reset = 1'b1;
            next_state = INIT;
         end
	
         // Read from the ROM 
         // Assert clock enable and wait for few (2 is enough) cycles
         // for valid ROM data out for current address pointer
         // Clear the SPI master RRDY signal by asserting a read signal	
         READ_ROM: 
		 begin
			set_rom_clken = 1'b1;
            dec_delay_cnt = 1'b1;
            set_spi_read = 1'b1;
            
            if (delay_cnt==5'd17) 
				begin 
				  set_delay_cnt = 1'b1; 
				  set_spi_write = 1'b1;
				  next_state = WRITE_SPI;             
				end   
         end

         // If the SPI Master ready to transmit data,
         // trigger a write strobe and write the ROM data out to SPI Master
         // Increment the ROM address pointer and check if it has reached last 
         // address, if yes proceed to handle the reset sequence of the base core
         // else repeat the ROM reading.            
         WRITE_SPI: begin           
			if(trans_done)
				begin
					if(last_rom_addr) next_state = CLR_XCVR_RESET;    
					else begin
						inc_rom_addr_ptr = 1'b1;
						next_state = READ_ROM;
					end
				end
         end 
		
         // Clear the XCVR reset
         CLR_XCVR_RESET: begin
            clr_xcvr_reset = 1'b1;
            if (wire_rx_ready_and) begin
		         next_state = CLR_AVS_RESET;
            end
         end		
		
         // Clear the Avalon Slave (resides in the base core) reset	
         CLR_AVS_RESET: begin
            clr_avs_reset = 1'b1;
            dec_delay_cnt = 1'b1;
            if (delay_cnt==0) begin
               next_state = CLR_CORE_RESET;					
            end
         end

         // Clear the base core reset	
         CLR_CORE_RESET: begin
            clr_core_reset = 1'b1;
            next_state = IDLE;	            			
         end			
	
         // Do nothing		
         IDLE: 
		 begin
			set_delay_cnt = 1'b1;  //计数器清0
         end

         default: begin
            next_state = INIT;			
         end
      endcase
   end
      
   //   
   // Output register for ROM address pointer   
   //   
   always @ (posedge clk or negedge rst_n)
   begin
      if (~rst_n) begin  
         rom_addr_ptr <= 6'd0;
      end else begin
         if (clr_rom_addr_ptr) begin
            rom_addr_ptr <= 6'd0;
         end else if (inc_rom_addr_ptr) begin
            rom_addr_ptr <= rom_addr_ptr + 6'd1;
         end    
      end       
   end

   //   
   // Output register for ROM clock enable      
   //   
   always @ (posedge clk or negedge rst_n)
   begin
      if (~rst_n) begin  
         rom_clken <= 1'b0;
      end else begin
         if (set_rom_clken) begin
            rom_clken <= 1'b1;  
         end else begin
            rom_clken <= 1'b0;  
         end
      end       
   end

   //   
   // Output register for delay counter
   //   
   always @ (posedge clk or negedge rst_n)
      if (~rst_n) begin  
         delay_cnt <= 5'd20;
      end else begin
         if (set_delay_cnt) begin
            delay_cnt <= 5'd20;  
         end else if (dec_delay_cnt) begin
            delay_cnt <= delay_cnt - 5'd1;  
         end
      end       


   //   
   // Output register for init_reset
   // Set to 1 once power up reset is triggered
   //    
   always @ (posedge clk or negedge rst_n)
   begin
      if (~rst_n) begin  
         init_reset <= 1'b0;
      end else begin
         if (set_init_reset) begin
            init_reset <= 1'b1;
         end
      end       
   end
    
   //   
   // Output register for SPI Master control signals and data
   //   
   always @ (posedge clk or negedge rst_n)
      if (~rst_n) begin  
         spi_write_r  <= 1'b0;
         spi_read_r   <= 1'b0;	 
         spi_select_r <= 1'b0;
         spi_addr_r   <= 3'd0;
         spi_txdata_r <= 32'd0;
      end 
	  else begin
		 spi_txdata_r <= rom_data_out;
	  
         // Write signal	 
         if (set_spi_write) begin
            spi_write_r <= 1'b1;
         end else begin
            spi_write_r <= 1'b0;
         end

         // Read signal	 
//         if (set_spi_read) begin
//            spi_read_r <= 1'b1;
//         end else begin
//            spi_read_r <= 1'b0;  
//         end            	    
      end       

   assign rom_data_out = rom0_data_out;
                                                
   assign spi_txdata  = spi_txdata_r;
   assign spi_write_n = ~spi_write_r;
   assign spi_read_n  = ~spi_read_r;   
  

   //   
   // Output register for base core + transceiver resets   
   // 
   always @ (posedge clk or negedge rst_n)
   begin
      if (~rst_n) begin
         frame_rst <= 1'b0;
         link_rst <= 1'b0;
         avs_rst <= 1'b0;
      end else begin
         if (clr_core_reset) begin
            frame_rst <= 1'b0;
            link_rst <= 1'b0;
         end else if (clr_avs_reset) begin
            avs_rst <= 1'b0;
         end else if (clr_xcvr_reset) begin
            xcvr_rst <= 1'b0;  		 
		 end else if (set_reset) begin
            frame_rst <= 1'b1;
            link_rst <= 1'b1;	
            avs_rst <= 1'b1;
			xcvr_rst <= 1'b1;
         end			
      end	
   end
   
   assign frame_rst_n = ~frame_rst;
   assign link_rst_n  = ~link_rst;
   assign avs_rst_n   = ~avs_rst;
   assign xcvr_rst_n  = ~xcvr_rst;
   
	
	
	rom_port rom_port (
		.address(rom_addr_ptr),		//input	[5:0]	address;
		.clock(clk),				//input		clock;
		.clken(rom_clken),			//input		clken;
		.q(rom0_data_out)			//output	[23:0]	q;
							);	


	
	
     
endmodule

