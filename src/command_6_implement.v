module command_6_implement
#(
parameter
	CLK_FREQ=100*(10**6),
	TIMER_FREQ=25*(10**6),
	UB_CMD_CODE=8'd6,
	s0=10'h0_01,
	s1=10'h0_02,
	s2=10'h0_04,
	s3=10'h0_08,
	s4=10'h0_10,
	s5=10'h0_20,
	s6=10'h0_40,
	s7=10'h0_80,
	s8=10'h1_00,
	s9=10'h2_00
)
(
//clock and reset signals
input clk,
input reset_n,

//user bus signals
input ub_wr_en,
input ub_rd_en,
input [31:0] ub_wr_data,

output reg ub_rd_valid,
output reg [31:0] ub_rd_data,

//ad9642 signals
input ad9250_sdo,

output reg ad9250_direction,
output reg ad9250_clk,
output reg ad9250_csn,
output reg ad9250_sdi
							);



//state machine
reg [9:0] state,state_next;

//user bus signals
reg ub_rd_valid_next;
reg [31:0] ub_rd_data_next;

//ad9642 signals
reg ad9250_direction_next;
reg ad9250_clk_next;
reg ad9250_csn_next;
reg ad9250_sdi_next;

//user_timer signals
reg timer_en,timer_en_next;
wire timer_pause;

//register signals
reg [23:0] data_buffer,data_buffer_next;
reg [1:0] p,p_next;
reg [4:0] b,b_next;		//发送计数器
reg [15:0] d,d_next;

//timing logic
always @(posedge clk or negedge reset_n)
begin
	if(reset_n == 1'b0)
	begin
		state<=s0;

		ub_rd_valid<=1'b0;
		ub_rd_data<=32'd0;
		
		ad9250_direction<=1'b0;
		ad9250_clk<=1'b0;
		ad9250_csn<=1'b1;
		ad9250_sdi<=1'b0;
		
		timer_en<=1'b0;
		
		data_buffer<=24'd0;
		p<=2'd0;
		b<=5'd23;  
		d<=16'd0;
	end
	else
	begin
		state<=state_next;
		
		ub_rd_valid<=ub_rd_valid_next;
		ub_rd_data<=ub_rd_data_next;

		ad9250_direction<=ad9250_direction_next;
		ad9250_clk<=ad9250_clk_next;
		ad9250_csn<=ad9250_csn_next;
		ad9250_sdi<=ad9250_sdi_next;
		
		timer_en<=timer_en_next;
		
		data_buffer<=data_buffer_next;
		p<=p_next;
		b<=b_next;
		d<=d_next;
	end
end

//combination logic
always @(*)
begin
	state_next<=state;
	
	ub_rd_valid_next<=ub_rd_valid;
	ub_rd_data_next<=ub_rd_data;

	ad9250_direction_next<=ad9250_direction;
	ad9250_clk_next<=ad9250_clk;
	ad9250_csn_next<=ad9250_csn;
	ad9250_sdi_next<=ad9250_sdi;

	timer_en_next<=timer_en;
	
	data_buffer_next<=data_buffer;
	p_next<=p;
	b_next<=b;
	d_next<=d;
	
	
	case(state)
		s0:
		begin
			b_next<=5'd23;
			if({ub_wr_en,ub_wr_data[31:24]} == {1'b1,UB_CMD_CODE})  //读入数据为命令6
				state_next<=s1;
			else if(ub_wr_en == 1'b1)	//其他命令
				state_next<=s7;
			else
				state_next<=s0;	//等待接收命令
		end
		s1:
		begin
			data_buffer_next<=ub_wr_data[31:8];  //  TX_1  instruction[31:16] + data[15:8]
			state_next<=s2;
		end
		//写操作处理流程；
		s2:
		begin
			timer_en_next<=1'b1;
			
			ad9250_direction_next<=1'b1;
			ad9250_csn_next<=1'b0;
			ad9250_sdi_next<=data_buffer[b];		//发送数据 高位在前
			ad9250_clk_next<=1'b0;
			
			if({data_buffer[23],b[4:3]} == {1'b1,2'b00})  // R/W=1 且 高16位发送完成 
				ad9250_direction_next<=1'b0;	//sdio = input
			else
				ad9250_direction_next<=1'b1;	//sdio = output
			
			if({timer_pause,data_buffer[23],b[4:3]} == {1'b1,1'b1,2'b00})	
				state_next<=s8;
			else if(timer_pause == 1'b1)
				state_next<=s3;
			else
				state_next<=s2;
		end
		s3:
		begin
			ad9250_clk_next<=1'b1;
			
			if(timer_pause == 1'b1)
				b_next<=b-1'b1;
			else
				b_next<=b;
			
			if({timer_pause,b} == {1'b1,5'd0})  //24位数据发送完成
				state_next<=s4;
			else if(timer_pause == 1'b1)
				state_next<=s2;
			else
				state_next<=s3;
		end
		s4:
		begin
			ad9250_csn_next<=1'b0;
			ad9250_sdi_next<=1'b0;
			ad9250_clk_next<=1'b0;
			if(timer_pause == 1'b1)  //等待AD读取完成
				state_next<=s5;
			else
				state_next<=s4;
		end
		s5:
		begin
			timer_en_next<=1'b0;
			ad9250_direction_next<=1'b0;
			ad9250_csn_next<=1'b1;
			d_next<=d+1'b1;
			
			if(&{ub_rd_en,d} == 1'b1)
				state_next<=s6;
			else
				state_next<=s5;
		end
		s6:
		begin
			p_next<=p+1'b1;

			ub_rd_valid_next<=ub_rd_en;  //读有效
			case(p)
				2'd0: ub_rd_data_next<=32'd2;    //数据个数
				2'd1: ub_rd_data_next<={24'd0,UB_CMD_CODE};	//命令代码
				2'd2: ub_rd_data_next<={8'd0,data_buffer};	//数据
				default: ub_rd_data_next<=32'd0;
			endcase
			
			if(p == 2'd2)
				state_next<=s7;
			else
				state_next<=s6;
		end
		s7:
		begin
			p_next<=2'd0;
			ub_rd_valid_next<=1'b0;
			ub_rd_data_next<=32'd0;
			if({ub_wr_en,ub_rd_en} == 2'b00) 
				state_next<=s0;
			else
				state_next<=s7;
		end
		
		//读操作处理流程；
		s8:
		begin
			ad9250_clk_next<=1'b1;
			data_buffer_next[b] <= ad9250_sdo; //读取总线数据

			if(timer_pause == 1'b1)
				state_next<=s9;
			else
				state_next<=s8;
		end
		s9:
		begin
			ad9250_direction_next<=1'b0;
			ad9250_sdi_next<=1'b0;
			ad9250_clk_next<=1'b0;

			if(timer_pause == 1'b1)
				b_next<=b-1'b1;
			else
				b_next<=b;
				
			if({timer_pause,b} == {1'b1,5'd0})  //读取完成
				state_next<=s4;
			else if(timer_pause == 1'b1)		
				state_next<=s8;
			else
				state_next<=s9;
		end
		default:	state_next<=s0;
	endcase
end

self_prg_timer self_prg_timer_inst
(
	.clk(clk) ,	// input  clk_sig
	.reset_n(timer_en & reset_n) ,	// input  reset_n_sig
	.timer_cnt(CLK_FREQ/TIMER_FREQ-1'b1) ,	// input [31:0] timer_cnt_sig
	.timer_pause(timer_pause) 	// output  timer_pause_sig
);

endmodule