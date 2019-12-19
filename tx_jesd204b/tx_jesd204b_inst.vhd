	component tx_jesd204b is
		port (
			csr_cf                     : out std_logic_vector(4 downto 0);                     -- export
			csr_cs                     : out std_logic_vector(1 downto 0);                     -- export
			csr_f                      : out std_logic_vector(7 downto 0);                     -- export
			csr_hd                     : out std_logic;                                        -- export
			csr_k                      : out std_logic_vector(4 downto 0);                     -- export
			csr_l                      : out std_logic_vector(4 downto 0);                     -- export
			csr_lane_powerdown         : out std_logic_vector(1 downto 0);                     -- export
			csr_m                      : out std_logic_vector(7 downto 0);                     -- export
			csr_n                      : out std_logic_vector(4 downto 0);                     -- export
			csr_np                     : out std_logic_vector(4 downto 0);                     -- export
			csr_s                      : out std_logic_vector(4 downto 0);                     -- export
			csr_tx_testmode            : out std_logic_vector(3 downto 0);                     -- export
			csr_tx_testpattern_a       : out std_logic_vector(31 downto 0);                    -- export
			csr_tx_testpattern_b       : out std_logic_vector(31 downto 0);                    -- export
			csr_tx_testpattern_c       : out std_logic_vector(31 downto 0);                    -- export
			csr_tx_testpattern_d       : out std_logic_vector(31 downto 0);                    -- export
			dev_sync_n                 : out std_logic;                                        -- export
			jesd204_tx_avs_chipselect  : in  std_logic                     := 'X';             -- chipselect
			jesd204_tx_avs_address     : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			jesd204_tx_avs_read        : in  std_logic                     := 'X';             -- read
			jesd204_tx_avs_readdata    : out std_logic_vector(31 downto 0);                    -- readdata
			jesd204_tx_avs_waitrequest : out std_logic;                                        -- waitrequest
			jesd204_tx_avs_write       : in  std_logic                     := 'X';             -- write
			jesd204_tx_avs_writedata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			jesd204_tx_avs_clk         : in  std_logic                     := 'X';             -- clk
			jesd204_tx_avs_rst_n       : in  std_logic                     := 'X';             -- reset_n
			jesd204_tx_dlb_data        : out std_logic_vector(63 downto 0);                    -- export
			jesd204_tx_dlb_kchar_data  : out std_logic_vector(7 downto 0);                     -- export
			jesd204_tx_frame_error     : in  std_logic                     := 'X';             -- export
			jesd204_tx_frame_ready     : out std_logic;                                        -- export
			jesd204_tx_int             : out std_logic;                                        -- irq
			jesd204_tx_link_data       : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			jesd204_tx_link_valid      : in  std_logic                     := 'X';             -- valid
			jesd204_tx_link_ready      : out std_logic;                                        -- ready
			mdev_sync_n                : in  std_logic                     := 'X';             -- export
			pll_locked                 : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- pll_locked
			sync_n                     : in  std_logic                     := 'X';             -- export
			sysref                     : in  std_logic                     := 'X';             -- export
			tx_analogreset             : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- tx_analogreset
			tx_bonding_clocks_ch0      : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- clk
			tx_bonding_clocks_ch1      : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- clk
			tx_cal_busy                : out std_logic_vector(1 downto 0);                     -- tx_cal_busy
			tx_digitalreset            : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- tx_digitalreset
			tx_serial_data             : out std_logic_vector(1 downto 0);                     -- tx_serial_data
			txlink_clk                 : in  std_logic                     := 'X';             -- clk
			txlink_rst_n_reset_n       : in  std_logic                     := 'X';             -- reset_n
			txphy_clk                  : out std_logic_vector(1 downto 0)                      -- export
		);
	end component tx_jesd204b;

	u0 : component tx_jesd204b
		port map (
			csr_cf                     => CONNECTED_TO_csr_cf,                     --                    csr_cf.export
			csr_cs                     => CONNECTED_TO_csr_cs,                     --                    csr_cs.export
			csr_f                      => CONNECTED_TO_csr_f,                      --                     csr_f.export
			csr_hd                     => CONNECTED_TO_csr_hd,                     --                    csr_hd.export
			csr_k                      => CONNECTED_TO_csr_k,                      --                     csr_k.export
			csr_l                      => CONNECTED_TO_csr_l,                      --                     csr_l.export
			csr_lane_powerdown         => CONNECTED_TO_csr_lane_powerdown,         --        csr_lane_powerdown.export
			csr_m                      => CONNECTED_TO_csr_m,                      --                     csr_m.export
			csr_n                      => CONNECTED_TO_csr_n,                      --                     csr_n.export
			csr_np                     => CONNECTED_TO_csr_np,                     --                    csr_np.export
			csr_s                      => CONNECTED_TO_csr_s,                      --                     csr_s.export
			csr_tx_testmode            => CONNECTED_TO_csr_tx_testmode,            --           csr_tx_testmode.export
			csr_tx_testpattern_a       => CONNECTED_TO_csr_tx_testpattern_a,       --      csr_tx_testpattern_a.export
			csr_tx_testpattern_b       => CONNECTED_TO_csr_tx_testpattern_b,       --      csr_tx_testpattern_b.export
			csr_tx_testpattern_c       => CONNECTED_TO_csr_tx_testpattern_c,       --      csr_tx_testpattern_c.export
			csr_tx_testpattern_d       => CONNECTED_TO_csr_tx_testpattern_d,       --      csr_tx_testpattern_d.export
			dev_sync_n                 => CONNECTED_TO_dev_sync_n,                 --                dev_sync_n.export
			jesd204_tx_avs_chipselect  => CONNECTED_TO_jesd204_tx_avs_chipselect,  --            jesd204_tx_avs.chipselect
			jesd204_tx_avs_address     => CONNECTED_TO_jesd204_tx_avs_address,     --                          .address
			jesd204_tx_avs_read        => CONNECTED_TO_jesd204_tx_avs_read,        --                          .read
			jesd204_tx_avs_readdata    => CONNECTED_TO_jesd204_tx_avs_readdata,    --                          .readdata
			jesd204_tx_avs_waitrequest => CONNECTED_TO_jesd204_tx_avs_waitrequest, --                          .waitrequest
			jesd204_tx_avs_write       => CONNECTED_TO_jesd204_tx_avs_write,       --                          .write
			jesd204_tx_avs_writedata   => CONNECTED_TO_jesd204_tx_avs_writedata,   --                          .writedata
			jesd204_tx_avs_clk         => CONNECTED_TO_jesd204_tx_avs_clk,         --        jesd204_tx_avs_clk.clk
			jesd204_tx_avs_rst_n       => CONNECTED_TO_jesd204_tx_avs_rst_n,       --      jesd204_tx_avs_rst_n.reset_n
			jesd204_tx_dlb_data        => CONNECTED_TO_jesd204_tx_dlb_data,        --       jesd204_tx_dlb_data.export
			jesd204_tx_dlb_kchar_data  => CONNECTED_TO_jesd204_tx_dlb_kchar_data,  -- jesd204_tx_dlb_kchar_data.export
			jesd204_tx_frame_error     => CONNECTED_TO_jesd204_tx_frame_error,     --    jesd204_tx_frame_error.export
			jesd204_tx_frame_ready     => CONNECTED_TO_jesd204_tx_frame_ready,     --    jesd204_tx_frame_ready.export
			jesd204_tx_int             => CONNECTED_TO_jesd204_tx_int,             --            jesd204_tx_int.irq
			jesd204_tx_link_data       => CONNECTED_TO_jesd204_tx_link_data,       --           jesd204_tx_link.data
			jesd204_tx_link_valid      => CONNECTED_TO_jesd204_tx_link_valid,      --                          .valid
			jesd204_tx_link_ready      => CONNECTED_TO_jesd204_tx_link_ready,      --                          .ready
			mdev_sync_n                => CONNECTED_TO_mdev_sync_n,                --               mdev_sync_n.export
			pll_locked                 => CONNECTED_TO_pll_locked,                 --                pll_locked.pll_locked
			sync_n                     => CONNECTED_TO_sync_n,                     --                    sync_n.export
			sysref                     => CONNECTED_TO_sysref,                     --                    sysref.export
			tx_analogreset             => CONNECTED_TO_tx_analogreset,             --            tx_analogreset.tx_analogreset
			tx_bonding_clocks_ch0      => CONNECTED_TO_tx_bonding_clocks_ch0,      --     tx_bonding_clocks_ch0.clk
			tx_bonding_clocks_ch1      => CONNECTED_TO_tx_bonding_clocks_ch1,      --     tx_bonding_clocks_ch1.clk
			tx_cal_busy                => CONNECTED_TO_tx_cal_busy,                --               tx_cal_busy.tx_cal_busy
			tx_digitalreset            => CONNECTED_TO_tx_digitalreset,            --           tx_digitalreset.tx_digitalreset
			tx_serial_data             => CONNECTED_TO_tx_serial_data,             --            tx_serial_data.tx_serial_data
			txlink_clk                 => CONNECTED_TO_txlink_clk,                 --                txlink_clk.clk
			txlink_rst_n_reset_n       => CONNECTED_TO_txlink_rst_n_reset_n,       --              txlink_rst_n.reset_n
			txphy_clk                  => CONNECTED_TO_txphy_clk                   --                 txphy_clk.export
		);

