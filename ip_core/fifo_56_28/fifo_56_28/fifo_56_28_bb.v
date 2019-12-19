
module fifo_56_28 (
	data,
	wrreq,
	rdreq,
	wrclk,
	rdclk,
	q,
	rdempty);	

	input	[55:0]	data;
	input		wrreq;
	input		rdreq;
	input		wrclk;
	input		rdclk;
	output	[27:0]	q;
	output		rdempty;
endmodule
