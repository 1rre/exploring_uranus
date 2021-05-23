// (C) 2001-2017 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module Qsys_alt_vip_cl_gamma_corrector_0_gamma_core
   
   (  input    wire                                av_st_din_valid,
      output   wire                                av_st_din_ready,
      input    wire                                av_st_din_startofpacket,
      input    wire                                av_st_din_endofpacket,
      input    wire  [56 - 1 : 0]      av_st_din_data,

      output   wire                                av_st_dout_valid,
      input    wire                                av_st_dout_ready,
      output   wire                                av_st_dout_startofpacket,
      output   wire                                av_st_dout_endofpacket,
      output   wire  [56 - 1 : 0]     av_st_dout_data,
      
      input    wire                                av_st_cmd_valid,
      output   wire                                av_st_cmd_ready,
      input    wire                                av_st_cmd_startofpacket,
      input    wire                                av_st_cmd_endofpacket,
      input    wire  [64 - 1 : 0]          av_st_cmd_data,
      
      output   wire                                av_st_resp_valid,
      input    wire                                av_st_resp_ready,
      output   wire                                av_st_resp_startofpacket,
      output   wire                                av_st_resp_endofpacket,
      output   wire  [64 - 1 : 0]          av_st_resp_data,

      input    wire                                av_st_coeff_valid,
      input    wire  [50 - 1 : 0]        av_st_coeff_data,
      input    wire                                av_st_coeff_startofpacket,
      input    wire                                av_st_coeff_endofpacket,
      output   wire                                av_st_coeff_ready,
      input    wire                                clock,
      input    wire                                reset
   );
   
   localparam   string   COEFF_FILE  [3 : 0]  =  '{"no_file_required.hex", "no_file_required.hex", "no_file_required.hex", "no_file_required.hex"};
   
   
   alt_vip_gamma_corrector_alg_core # (
      .INPUT_BITS_PER_SYMBOL           (8),
      .OUTPUT_BITS_PER_SYMBOL          (8),
      .NUMBER_OF_COLOR_PLANES          (3),
      .COLOR_PLANES_ARE_IN_PARALLEL    (1),
      .PIXELS_IN_PARALLEL              (1),
      .ENABLE_TWO_BANKS                (0),
      .RUNTIME_CONTROL                 (1),
      .PIPELINE_READY                  (0),
      .SRC_WIDTH                       (8),
      .DST_WIDTH                       (8),
      .TASK_WIDTH                      (8),
      .CONTEXT_WIDTH                   (8),
      .SOURCE_ID                       (0),
      .COEFF_FILE                      (COEFF_FILE)
   ) gc_core_inst (  
      .clock                           (clock),
      .reset                           (reset),
      .av_st_cmd_valid                 (av_st_cmd_valid),
      .av_st_cmd_ready                 (av_st_cmd_ready),
      .av_st_cmd_startofpacket         (av_st_cmd_startofpacket),
      .av_st_cmd_endofpacket           (av_st_cmd_endofpacket),
      .av_st_cmd_data                  (av_st_cmd_data),
      .av_st_resp_valid                (av_st_resp_valid),
      .av_st_resp_ready                (av_st_resp_ready),
      .av_st_resp_startofpacket        (av_st_resp_startofpacket),
      .av_st_resp_endofpacket          (av_st_resp_endofpacket),
      .av_st_resp_data                 (av_st_resp_data),
      .av_st_din_valid                 (av_st_din_valid),
      .av_st_din_ready                 (av_st_din_ready),
      .av_st_din_startofpacket         (av_st_din_startofpacket),
      .av_st_din_endofpacket           (av_st_din_endofpacket),
      .av_st_din_data                  (av_st_din_data),
      .av_st_dout_valid                (av_st_dout_valid),
      .av_st_dout_ready                (av_st_dout_ready),
      .av_st_dout_startofpacket        (av_st_dout_startofpacket),
      .av_st_dout_endofpacket          (av_st_dout_endofpacket),
      .av_st_dout_data                 (av_st_dout_data),     
      .av_st_coeff_valid               (av_st_coeff_valid),
      .av_st_coeff_data                (av_st_coeff_data),
      .av_st_coeff_startofpacket       (av_st_coeff_startofpacket),
      .av_st_coeff_endofpacket         (av_st_coeff_endofpacket),
      .av_st_coeff_ready               (av_st_coeff_ready)
   );
      
endmodule
   

