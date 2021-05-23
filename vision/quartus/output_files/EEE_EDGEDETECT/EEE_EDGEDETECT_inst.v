	EEE_EDGEDETECT u0 (
		.clk          (<connected-to-clk>),          //                   clock.clk
		.reset_n      (<connected-to-reset_n>),      //                   reset.reset_n
		.sink_data    (<connected-to-sink_data>),    //   avalon_streaming_sink.data
		.sink_valid   (<connected-to-sink_valid>),   //                        .valid
		.sink_ready   (<connected-to-sink_ready>),   //                        .ready
		.sink_sop     (<connected-to-sink_sop>),     //                        .startofpacket
		.sink_eop     (<connected-to-sink_eop>),     //                        .endofpacket
		.source_data  (<connected-to-source_data>),  // avalon_streaming_source.data
		.source_eop   (<connected-to-source_eop>),   //                        .endofpacket
		.source_ready (<connected-to-source_ready>), //                        .ready
		.source_sop   (<connected-to-source_sop>),   //                        .startofpacket
		.source_valid (<connected-to-source_valid>), //                        .valid
		.s_chipselect (<connected-to-s_chipselect>), //                      s1.chipselect
		.s_read       (<connected-to-s_read>),       //                        .read
		.s_write      (<connected-to-s_write>),      //                        .write
		.s_readdata   (<connected-to-s_readdata>),   //                        .readdata
		.s_writedata  (<connected-to-s_writedata>),  //                        .writedata
		.s_address    (<connected-to-s_address>),    //                        .address
		.mode         (<connected-to-mode>)          //            conduit_mode.new_signal
	);

