
module tb_tx_phyrst_ctl (
	clock,
	pll_locked,
	pll_powerdown,
	pll_select,
	reset,
	tx_analogreset,
	tx_cal_busy,
	tx_digitalreset,
	tx_ready);	

	input		clock;
	input	[0:0]	pll_locked;
	output	[0:0]	pll_powerdown;
	input	[0:0]	pll_select;
	input		reset;
	output	[1:0]	tx_analogreset;
	input	[1:0]	tx_cal_busy;
	output	[1:0]	tx_digitalreset;
	output	[1:0]	tx_ready;
endmodule
