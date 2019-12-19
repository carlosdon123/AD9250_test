
module jesd204b (
	pll_ref_clk,
	rxlink_clk,
	rxlink_rst_n_reset_n,
	jesd204_rx_avs_clk,
	jesd204_rx_avs_rst_n,
	jesd204_rx_avs_chipselect,
	jesd204_rx_avs_address,
	jesd204_rx_avs_read,
	jesd204_rx_avs_readdata,
	jesd204_rx_avs_waitrequest,
	jesd204_rx_avs_write,
	jesd204_rx_avs_writedata,
	jesd204_rx_link_data,
	jesd204_rx_link_valid,
	jesd204_rx_link_ready,
	jesd204_rx_dlb_data,
	jesd204_rx_dlb_data_valid,
	jesd204_rx_dlb_kchar_data,
	jesd204_rx_dlb_errdetect,
	jesd204_rx_dlb_disperr,
	alldev_lane_aligned,
	sysref,
	jesd204_rx_frame_error,
	jesd204_rx_int,
	csr_rx_testmode,
	dev_lane_aligned,
	dev_sync_n,
	sof,
	somf,
	csr_f,
	csr_k,
	csr_l,
	csr_m,
	csr_n,
	csr_s,
	csr_cf,
	csr_cs,
	csr_hd,
	csr_np,
	csr_lane_powerdown,
	rxphy_clk,
	rx_serial_data,
	rx_analogreset,
	rx_digitalreset,
	rx_islockedtodata,
	rx_cal_busy);	

	;


	;
	;
	input		;
	;
	input		jesd204_rx_avs_read;
	;

	;
	;
	;
	;
	;
	;
	;
	;
	;
	;
	;
	;
	;
	;
	;
	;
	output	[3:0]	sof;
	output	[3:0]	somf;
	output	[7:0]	csr_f;
	output	[4:0]	csr_k;
	output	[4:0]	csr_l;
	output	[7:0]	csr_m;
	output	[4:0]	csr_n;
	output	[4:0]	csr_s;
	output	[4:0]	csr_cf;
	output	[1:0]	csr_cs;
	output		csr_hd;
	output	[4:0]	csr_np;
	output	[1:0]	csr_lane_powerdown;
	output	[1:0]	rxphy_clk;
	input	[1:0]	rx_serial_data;
	input	[1:0]	rx_analogreset;
	input	[1:0]	rx_digitalreset;
	output	[1:0]	rx_islockedtodata;
	output	[1:0]	rx_cal_busy;
endmodule
