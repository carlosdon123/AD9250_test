
module rom_port (
	address,
	clock,
	clken,
	q);	

	input	[5:0]	address;
	input		clock;
	input		clken;
	output	[23:0]	q;
endmodule
