
module spi_master #(
	parameter CLK_DIV = 6,				 //分频系数
	parameter H_CLK_DIV = CLK_DIV/2	 //分频系数一半
)
(
	input  rst_n,
	input  clk,
	input  wr_en,
	input  rd_en,
	input  [23:0] spi_txdata,
	
	input  miso, 
	output reg ss,
	output reg sck,
	output reg mosi,
	output reg io_sel,
	output reg trans_done,
	output reg read_done,
	output reg [7:0] spi_rxdata	
								  );
							  
   
   
   
   //   
   // FSM states declaration   
   // 
    localparam IDLE = 2'b00;		
	localparam WRITE_DATA = 2'b10; 
	localparam READ_DATA  = 2'b11;
	
	reg [1:0] current_state;
	reg [1:0] next_state;

//state transistion
always@(negedge clk or negedge rst_n) begin
	if(rst_n==0) 
	   current_state<=IDLE;
	else 
	   current_state<=next_state;
    end

reg transmitting;
reg reading;
reg ss_r;

always @(current_state or wr_en or rd_en or trans_done or read_done) begin
	next_state = current_state;
	case(current_state)
		IDLE:begin
			transmitting = 0;
			reading = 0;
			ss_r = 1;
			if(wr_en) next_state = WRITE_DATA;
			else if(rd_en) next_state = READ_DATA;
			else next_state = IDLE;
		end
		WRITE_DATA:begin
			if(trans_done) 
				begin
					transmitting = 0;
					next_state = IDLE;
				end
			else begin ss_r = 0; transmitting = 1; end
		end
		READ_DATA:begin
			if(read_done) 
				begin
					reading = 0;
					next_state = IDLE;
				end
			else begin ss_r = 0 ; reading = 1; end
		
		end	
		default: next_state=IDLE;
    endcase
end

	always @ (posedge clk or negedge rst_n)
		if(!rst_n)
			begin
			 ss <= 1'b1;
			end
		else ss <= ss_r;

	
	reg [3:0] cnt;
	
	assign neg_sck = cnt == (H_CLK_DIV-1);
	assign pos_sck = cnt == (CLK_DIV - 1);
	
	always@(posedge clk or negedge rst_n)
	  if(!rst_n) 
		begin 
			cnt=0; 
			sck=1; 
		end
	  else if(transmitting || reading) 
		begin
			if(cnt < H_CLK_DIV-1) 
				begin
					sck <= 1; 
					cnt <= cnt+1; 
				end
			else if(cnt < CLK_DIV - 1)
				begin
					sck <= 0; 
					cnt <= cnt+1; 			
				end
			else begin cnt <= 0; sck <= 1; end
		end
	  else cnt <= 0;



reg [4:0] cnt_bit;
reg [15:0] spi_raddr = {1'b1,2'b00,13'h04};

always @ (posedge clk or negedge rst_n)
	if( rst_n == 0) 
		begin
			mosi <= 1'b0;
			io_sel <= 1'b0;
			trans_done <= 1'b0;
			cnt_bit <= 0;
			spi_rxdata <= 0;
		end
	else begin
		if(transmitting) //发送数据
			begin
			 io_sel <= 1'b1;
			 
			 if(cnt_bit < 24) begin
				if(neg_sck)
					begin
						cnt_bit <= cnt_bit +1'b1;
						mosi <= spi_txdata[cnt_bit];
					end
				end
			 else if(pos_sck)
				begin
					cnt_bit <= 0;
					trans_done <= 1'b1;
				end
			end
		else if(reading)
			begin
				if(cnt_bit < 16)
					begin
						io_sel <= 1'b1;
				 
						if(neg_sck)
							begin
								cnt_bit <= cnt_bit + 1'b1;
								mosi <= spi_raddr[cnt_bit];
							end			 
					end
				else if(cnt_bit < 24)
					begin
						io_sel <= 1'b0;
					
						if(pos_sck)
							begin
								cnt_bit <= cnt_bit + 1'b1;
								spi_rxdata[cnt_bit-16] <= miso;
							end
					end
				else begin
					cnt_bit <= 0;
					read_done <= 1'b1;
				end
			end
		else begin
			io_sel <= 1'b0;
			cnt_bit <= 0;
			trans_done <= 1'b0;
			read_done <= 1'b0;
		end
	end

endmodule
