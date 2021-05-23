
module EEE_EDGEDETECT (
	clk,
	reset_n,
	sink_data,
	sink_valid,
	sink_ready,
	sink_sop,
	sink_eop,
	source_data,
	source_eop,
	source_ready,
	source_sop,
	source_valid,
	s_chipselect,
	s_read,
	s_write,
	s_readdata,
	s_writedata,
	s_address,
	mode);	

	input		clk;
	input		reset_n;
	input	[23:0]	sink_data;
	input		sink_valid;
	output		sink_ready;
	input		sink_sop;
	input		sink_eop;
	output	[23:0]	source_data;
	output		source_eop;
	input		source_ready;
	output		source_sop;
	output		source_valid;
	input		s_chipselect;
	input		s_read;
	input		s_write;
	output	[31:0]	s_readdata;
	input	[31:0]	s_writedata;
	input	[2:0]	s_address;
	input		mode;
endmodule
