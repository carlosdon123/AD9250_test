	component jesd204b is
		port (
			pll_ref_clk                : in  std_logic                     := 'X';             -- clk
			rxlink_clk                 : in  std_logic                     := 'X';             -- clk
			rxlink_rst_n_reset_n       : in  std_logic                     := 'X';             -- reset_n
			jesd204_rx_avs_clk         : in  std_logic                     := 'X';             -- clk
			jesd204_rx_avs_rst_n       : in  std_logic                     := 'X';             -- reset_n
			jesd204_rx_avs_chipselect  : in  std_logic                     := 'X';             -- chipselect
			jesd204_rx_avs_address     : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			jesd204_rx_avs_read        : in  std_logic                     := 'X';             -- read
			jesd204_rx_avs_readdata    : out std_logic_vector(31 downto 0);                    -- readdata
			jesd204_rx_avs_waitrequest : out std_logic;                                        -- waitrequest
			jesd204_rx_avs_write       : in  std_logic                     := 'X';             -- write
			jesd204_rx_avs_writedata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			jesd204_rx_link_data       : out std_logic_vector(63 downto 0);                    -- data
			jesd204_rx_link_valid      : out std_logic;                                        -- valid
			jesd204_rx_link_ready      : in  std_logic                     := 'X';             -- ready
			jesd204_rx_dlb_data        : in  std_logic_vector(63 downto 0) := (others => 'X'); -- export
			jesd204_rx_dlb_data_valid  : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			jesd204_rx_dlb_kchar_data  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			jesd204_rx_dlb_errdetect   : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			jesd204_rx_dlb_disperr     : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			alldev_lane_aligned        : in  std_logic                     := 'X';             -- export
			sysref                     : in  std_logic                     := 'X';             -- export
			jesd204_rx_frame_error     : in  std_logic                     := 'X';             -- export
			jesd204_rx_int             : out std_logic;                                        -- irq
			csr_rx_testmode            : out std_logic_vector(3 downto 0);                     -- export
			dev_lane_aligned           : out std_logic;                                        -- export
			dev_sync_n                 : out std_logic;                                        -- export
			sof                        : out std_logic_vector(3 downto 0);                     -- export
			somf                       : out std_logic_vector(3 downto 0);                     -- export
			csr_f                      : out std_logic_vector(7 downto 0);                     -- export
			csr_k                      : out std_logic_vector(4 downto 0);                     -- export
			csr_l                      : out std_logic_vector(4 downto 0);                     -- export
			csr_m                      : out std_logic_vector(7 downto 0);                     -- export
			csr_n                      : out std_logic_vector(4 downto 0);                     -- export
			csr_s                      : out std_logic_vector(4 downto 0);                     -- export
			csr_cf                     : out std_logic_vector(4 downto 0);                     -- export
			csr_cs                     : out std_logic_vector(1 downto 0);                     -- export
			csr_hd                     : out std_logic;                                        -- export
			csr_np                     : out std_logic_vector(4 downto 0);                     -- export
			csr_lane_powerdown         : out std_logic_vector(1 downto 0);                     -- export
			rxphy_clk                  : out std_logic_vector(1 downto 0);                     -- export
			rx_serial_data             : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rx_serial_data
			rx_analogreset             : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rx_analogreset
			rx_digitalreset            : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rx_digitalreset
			rx_islockedtodata          : out std_logic_vector(1 downto 0);                     -- rx_is_lockedtodata
			rx_cal_busy                : out std_logic_vector(1 downto 0)                      -- rx_cal_busy
		);
	end component jesd204b;

	u0 : component jesd204b
		port map (
			pll_ref_clk                => CONNECTED_TO_pll_ref_clk,                --               pll_ref_clk.clk
			rxlink_clk                 => CONNECTED_TO_rxlink_clk,                 --                rxlink_clk.clk
			rxlink_rst_n_reset_n       => CONNECTED_TO_rxlink_rst_n_reset_n,       --              rxlink_rst_n.reset_n
			jesd204_rx_avs_clk         => CONNECTED_TO_jesd204_rx_avs_clk,         --        jesd204_rx_avs_clk.clk
			jesd204_rx_avs_rst_n       => CONNECTED_TO_jesd204_rx_avs_rst_n,       --      jesd204_rx_avs_rst_n.reset_n
			jesd204_rx_avs_chipselect  => CONNECTED_TO_jesd204_rx_avs_chipselect,  --            jesd204_rx_avs.chipselect
			jesd204_rx_avs_address     => CONNECTED_TO_jesd204_rx_avs_address,     --                          .address
			jesd204_rx_avs_read        => CONNECTED_TO_jesd204_rx_avs_read,        --                          .read
			jesd204_rx_avs_readdata    => CONNECTED_TO_jesd204_rx_avs_readdata,    --                          .readdata
			jesd204_rx_avs_waitrequest => CONNECTED_TO_jesd204_rx_avs_waitrequest, --                          .waitrequest
			jesd204_rx_avs_write       => CONNECTED_TO_jesd204_rx_avs_write,       --                          .write
			jesd204_rx_avs_writedata   => CONNECTED_TO_jesd204_rx_avs_writedata,   --                          .writedata
			jesd204_rx_link_data       => CONNECTED_TO_jesd204_rx_link_data,       --           jesd204_rx_link.data
			jesd204_rx_link_valid      => CONNECTED_TO_jesd204_rx_link_valid,      --                          .valid
			jesd204_rx_link_ready      => CONNECTED_TO_jesd204_rx_link_ready,      --                          .ready
			jesd204_rx_dlb_data        => CONNECTED_TO_jesd204_rx_dlb_data,        --       jesd204_rx_dlb_data.export
			jesd204_rx_dlb_data_valid  => CONNECTED_TO_jesd204_rx_dlb_data_valid,  -- jesd204_rx_dlb_data_valid.export
			jesd204_rx_dlb_kchar_data  => CONNECTED_TO_jesd204_rx_dlb_kchar_data,  -- jesd204_rx_dlb_kchar_data.export
			jesd204_rx_dlb_errdetect   => CONNECTED_TO_jesd204_rx_dlb_errdetect,   --  jesd204_rx_dlb_errdetect.export
			jesd204_rx_dlb_disperr     => CONNECTED_TO_jesd204_rx_dlb_disperr,     --    jesd204_rx_dlb_disperr.export
			alldev_lane_aligned        => CONNECTED_TO_alldev_lane_aligned,        --       alldev_lane_aligned.export
			sysref                     => CONNECTED_TO_sysref,                     --                    sysref.export
			jesd204_rx_frame_error     => CONNECTED_TO_jesd204_rx_frame_error,     --    jesd204_rx_frame_error.export
			jesd204_rx_int             => CONNECTED_TO_jesd204_rx_int,             --            jesd204_rx_int.irq
			csr_rx_testmode            => CONNECTED_TO_csr_rx_testmode,            --           csr_rx_testmode.export
			dev_lane_aligned           => CONNECTED_TO_dev_lane_aligned,           --          dev_lane_aligned.export
			dev_sync_n                 => CONNECTED_TO_dev_sync_n,                 --                dev_sync_n.export
			sof                        => CONNECTED_TO_sof,                        --                       sof.export
			somf                       => CONNECTED_TO_somf,                       --                      somf.export
			csr_f                      => CONNECTED_TO_csr_f,                      --                     csr_f.export
			csr_k                      => CONNECTED_TO_csr_k,                      --                     csr_k.export
			csr_l                      => CONNECTED_TO_csr_l,                      --                     csr_l.export
			csr_m                      => CONNECTED_TO_csr_m,                      --                     csr_m.export
			csr_n                      => CONNECTED_TO_csr_n,                      --                     csr_n.export
			csr_s                      => CONNECTED_TO_csr_s,                      --                     csr_s.export
			csr_cf                     => CONNECTED_TO_csr_cf,                     --                    csr_cf.export
			csr_cs                     => CONNECTED_TO_csr_cs,                     --                    csr_cs.export
			csr_hd                     => CONNECTED_TO_csr_hd,                     --                    csr_hd.export
			csr_np                     => CONNECTED_TO_csr_np,                     --                    csr_np.export
			csr_lane_powerdown         => CONNECTED_TO_csr_lane_powerdown,         --        csr_lane_powerdown.export
			rxphy_clk                  => CONNECTED_TO_rxphy_clk,                  --                 rxphy_clk.export
			rx_serial_data             => CONNECTED_TO_rx_serial_data,             --            rx_serial_data.rx_serial_data
			rx_analogreset             => CONNECTED_TO_rx_analogreset,             --            rx_analogreset.rx_analogreset
			rx_digitalreset            => CONNECTED_TO_rx_digitalreset,            --           rx_digitalreset.rx_digitalreset
			rx_islockedtodata          => CONNECTED_TO_rx_islockedtodata,          --         rx_islockedtodata.rx_is_lockedtodata
			rx_cal_busy                => CONNECTED_TO_rx_cal_busy                 --               rx_cal_busy.rx_cal_busy
		);

