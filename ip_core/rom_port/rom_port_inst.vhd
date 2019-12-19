	component rom_port is
		port (
			address : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- address
			clock   : in  std_logic                     := 'X';             -- clk
			clken   : in  std_logic                     := 'X';             -- clken
			q       : out std_logic_vector(23 downto 0)                     -- dataout
		);
	end component rom_port;

	u0 : component rom_port
		port map (
			address => CONNECTED_TO_address, --  rom_input.address
			clock   => CONNECTED_TO_clock,   --           .clk
			clken   => CONNECTED_TO_clken,   --           .clken
			q       => CONNECTED_TO_q        -- rom_output.dataout
		);

