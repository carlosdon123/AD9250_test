
module tx_jesd204b (
	csr_cf,
	csr_cs,
	csr_f,
	csr_hd,
	csr_k,
	csr_l,
	csr_lane_powerdown,
	csr_m,
	csr_n,
	csr_np,
	csr_s,
	csr_tx_testmode,
	csr_tx_testpattern_a,
	csr_tx_testpattern_b,
	csr_tx_testpattern_c,
	csr_tx_testpattern_d,
	dev_sync_n,
	jesd204_tx_avs_chipselect,
	jesd204_tx_avs_address,
	jesd204_tx_avs_read,
	jesd204_tx_avs_readdata,
	jesd204_tx_avs_waitrequest,
	jesd204_tx_avs_write,
	jesd204_tx_avs_writedata,
	jesd204_tx_avs_clk,
	jesd204_tx_avs_rst_n,
	jesd204_tx_dlb_data,
	jesd204_tx_dlb_kchar_data,
	jesd204_tx_frame_error,
	jesd204_tx_frame_ready,
	jesd204_tx_int,
	jesd204_tx_link_data,
	jesd204_tx_link_valid,
	jesd204_tx_link_ready,
	mdev_sync_n,
	pll_locked,
	sync_n,
	sysref,
	tx_analogreset,
	tx_bonding_clocks_ch0,
	tx_bonding_clocks_ch1,
	tx_cal_busy,
	tx_digitalreset,
	tx_serial_data,
	txlink_clk,
	txlink_rst_n_reset_n,
	txphy_clk);	

	output	[4:0]	csr_cf;
	output	[1:0]	csr_cs;
	output	[7:0]	csr_f;
	output		csr_hd;
	output	[4:0]	csr_k;
	output	[4:0]	csr_l;
	output	[1:0]	csr_lane_powerdown;
	output	[7:0]	csr_m;
	output	[4:0]	csr_n;
	output	[4:0]	csr_np;
	output	[4:0]	csr_s;
	output	[3:0]	csr_tx_testmode;
	output	[31:0]	csr_tx_testpattern_a;
	output	[31:0]	csr_tx_testpattern_b;
	output	[31:0]	csr_tx_testpattern_c;
	output	[31:0]	csr_tx_testpattern_d;
	output		dev_sync_n;
	input		jesd204_tx_avs_chipselect;
	input	[7:0]	jesd204_tx_avs_address;
	input		jesd204_tx_avs_read;
	output	[31:0]	jesd204_tx_avs_readdata;
	output		jesd204_tx_avs_waitrequest;
	input		jesd204_tx_avs_write;
	input	[31:0]	jesd204_tx_avs_writedata;
	input		jesd204_tx_avs_clk;
	input		jesd204_tx_avs_rst_n;
	output	[63:0]	jesd204_tx_dlb_data;
	output	[7:0]	jesd204_tx_dlb_kchar_data;
	input		jesd204_tx_frame_error;
	output		jesd204_tx_frame_ready;
	output		jesd204_tx_int;
	input	[63:0]	jesd204_tx_link_data;
	input		jesd204_tx_link_valid;
	output		jesd204_tx_link_ready;
	input		mdev_sync_n;
	input	[1:0]	pll_locked;
	input		sync_n;
	input		sysref;
	input	[1:0]	tx_analogreset;
	input	[5:0]	tx_bonding_clocks_ch0;
	input	[5:0]	tx_bonding_clocks_ch1;
	output	[1:0]	tx_cal_busy;
	input	[1:0]	tx_digitalreset;
	output	[1:0]	tx_serial_data;
	input		txlink_clk;
	input		txlink_rst_n_reset_n;
	output	[1:0]	txphy_clk;
endmodule
