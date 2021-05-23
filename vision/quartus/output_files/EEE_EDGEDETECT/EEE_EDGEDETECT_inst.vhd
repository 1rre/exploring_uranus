	component EEE_EDGEDETECT is
		port (
			clk          : in  std_logic                     := 'X';             -- clk
			reset_n      : in  std_logic                     := 'X';             -- reset_n
			sink_data    : in  std_logic_vector(23 downto 0) := (others => 'X'); -- data
			sink_valid   : in  std_logic                     := 'X';             -- valid
			sink_ready   : out std_logic;                                        -- ready
			sink_sop     : in  std_logic                     := 'X';             -- startofpacket
			sink_eop     : in  std_logic                     := 'X';             -- endofpacket
			source_data  : out std_logic_vector(23 downto 0);                    -- data
			source_eop   : out std_logic;                                        -- endofpacket
			source_ready : in  std_logic                     := 'X';             -- ready
			source_sop   : out std_logic;                                        -- startofpacket
			source_valid : out std_logic;                                        -- valid
			s_chipselect : in  std_logic                     := 'X';             -- chipselect
			s_read       : in  std_logic                     := 'X';             -- read
			s_write      : in  std_logic                     := 'X';             -- write
			s_readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			s_writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			s_address    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			mode         : in  std_logic                     := 'X'              -- new_signal
		);
	end component EEE_EDGEDETECT;

	u0 : component EEE_EDGEDETECT
		port map (
			clk          => CONNECTED_TO_clk,          --                   clock.clk
			reset_n      => CONNECTED_TO_reset_n,      --                   reset.reset_n
			sink_data    => CONNECTED_TO_sink_data,    --   avalon_streaming_sink.data
			sink_valid   => CONNECTED_TO_sink_valid,   --                        .valid
			sink_ready   => CONNECTED_TO_sink_ready,   --                        .ready
			sink_sop     => CONNECTED_TO_sink_sop,     --                        .startofpacket
			sink_eop     => CONNECTED_TO_sink_eop,     --                        .endofpacket
			source_data  => CONNECTED_TO_source_data,  -- avalon_streaming_source.data
			source_eop   => CONNECTED_TO_source_eop,   --                        .endofpacket
			source_ready => CONNECTED_TO_source_ready, --                        .ready
			source_sop   => CONNECTED_TO_source_sop,   --                        .startofpacket
			source_valid => CONNECTED_TO_source_valid, --                        .valid
			s_chipselect => CONNECTED_TO_s_chipselect, --                      s1.chipselect
			s_read       => CONNECTED_TO_s_read,       --                        .read
			s_write      => CONNECTED_TO_s_write,      --                        .write
			s_readdata   => CONNECTED_TO_s_readdata,   --                        .readdata
			s_writedata  => CONNECTED_TO_s_writedata,  --                        .writedata
			s_address    => CONNECTED_TO_s_address,    --                        .address
			mode         => CONNECTED_TO_mode          --            conduit_mode.new_signal
		);

