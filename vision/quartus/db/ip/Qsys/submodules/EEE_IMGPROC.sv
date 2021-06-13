
`define Y_FROM 160

`include "ip/EEE_IMGPROC/include/EDGE_DETECT.svh"
`include "ip/EEE_IMGPROC/include/DIFF_DETECT.svh"

module EEE_IMGPROC(
  // global clock & reset
  clk,
  reset_n,
  
  // mm slave
  s_chipselect,
  s_read,
  s_write,
  s_readdata,
  s_writedata,
  s_address,

  // stream sink
  sink_data,
  sink_valid,
  sink_ready,
  sink_sop,
  sink_eop,
  
  // streaming source
  source_data,
  source_valid,
  source_ready,
  source_sop,
  source_eop,
  
  // conduit
  mode,
  led
);


// global clock & reset
input	clk;
input	reset_n;

// mm slave
input             s_chipselect;
input             s_read;
input             s_write;
output reg [31:0] s_readdata;
input      [31:0] s_writedata;
input       [3:0] s_address;


// streaming sink
input [23:0] sink_data;
input        sink_valid;
output       sink_ready;
input        sink_sop;
input        sink_eop;

// streaming source
output [23:0] source_data;
output        source_valid;
input         source_ready;
output        source_sop;
output        source_eop;

// conduit export
input      [9:0] mode;
output reg [9:0] led;

////////////////////////////////////////////////////////////////////////
//
parameter IMAGE_W = 11'd640;
parameter IMAGE_H = 11'd480;
parameter MESSAGE_BUF_MAX = 256;
parameter MSG_INTERVAL = 6;
parameter BB_COL_DEFAULT = 24'h00ff00;


wire [7:0]   red, green, blue, grey;
wire [7:0]   red_out, green_out, blue_out;

wire         sop, eop, in_valid, out_ready;
////////////////////////////////////////////////////////////////////////

reg line_complete;

wire [23:0] im_0, im_1, im_2, im_3, im_4, im_5,im_nil;


edge_detect e_d (
  .px_in(im_nil),
  .x(x),
  .y(y),
  .line_sync(line_complete & in_valid),
  .clk(clk & in_valid),
  .px_out0(im_0),
  .px_out1(im_1),
  .px_out2(im_2),
  .px_out3(im_3),
  .px_out4(im_4),
  .px_out5(im_5),
  .T_MIN(T_MIN),
  .T_DIF(T_DIF)
);

assign im_nil = {red,green,blue};

// Switch output pixels depending on mode switch
// Don't modify the start-of-packet word - it's a packet discriptor
// Don't modify data in non-video packets
assign {red_out, green_out, blue_out} = (mode[0] & ~sop & packet_video) ? im_0 : 
                                        (mode[1] & ~sop & packet_video) ? im_1 : 
                                        (mode[2] & ~sop & packet_video) ? im_2 : 
                                        (mode[3] & ~sop & packet_video) ? im_3 : 
                                        (mode[4] & ~sop & packet_video) ? im_4 :
                                        (mode[5] & ~sop & packet_video) ? im_5 : im_nil;


// bounding boxes for each ball
reg unsigned [9:0]
  or_x1, or_y1, or_x2, or_y2,
  gn_x1, gn_y1, gn_x2, gn_y2,
  bl_x1, bl_y1, bl_x2, bl_y2,
  pk_x1, pk_y1, pk_x2, pk_y2,
  bk_x1, bk_y1, bk_x2, bk_y2;

reg [63:0]
  or_bb, gn_bb, bl_bb, pk_bb, bk_bb;

//Count valid pixels to tget the image coordinates. Reset and detect packet type on Start of Packet.
reg [10:0] x, y;
reg packet_video;
always@(posedge clk) begin
  if (sop) begin
    x <= 11'h0;
    y <= 11'h0;

    packet_video <= (blue[3:0] == 3'h0);
  end
  else if (in_valid) begin
    if (x == IMAGE_W-1) begin
      line_complete <= 1;
      x <= 11'h0;
      y <= y + 11'h1;
    end
    else begin
      line_complete <= 0;
      x <= x + 11'h1;
    end
  end
end


always@(posedge clk) begin
	if (eop & in_valid & packet_video) begin 
    led <= ~led;
    // Set bounding box buffers
    or_bb <= {6'h0, or_y2 - 10'd160,
              6'h0, or_x2,
              6'h0, or_y1 - 10'd160,
              6'h0, or_x1};

    gn_bb <= {6'h0, gn_y2 - 10'd160,
              6'h0, gn_x2,
              6'h0, gn_y1 - 10'd160,
              6'h0, gn_x1};

    bl_bb <= {6'h0, bl_y2 - 10'd160,
              6'h0, bl_x2,
              6'h0, bl_y1 - 10'd160,
              6'h0, bl_x1};

    pk_bb <= {6'h0, pk_y2 - 10'd160,
              6'h0, pk_x2,
              6'h0, pk_y1 - 10'd160,
              6'h0, pk_x1};
       
    bk_bb <= {6'h0, bk_y2 - 10'd160,
              6'h0, bk_x2,
              6'h0, bk_y1 - 10'd160,
              6'h0, bk_x1};
  end
end

wire
  or_valid, gn_valid, bl_valid, pk_valid, bk_valid;

assign or_valid = total_or < T_DIF;
assign gn_valid = total_gn < T_DIF;
assign bl_valid = total_bl < T_DIF;
assign pk_valid = total_pk < T_DIF;
assign bk_valid = total_bk < T_DIF;

wire
  y_valid, x_valid, col_valid;

assign y_valid = (y > 10'd160) && (y < 10'd465);
assign x_valid = (x > 10'd005) && (x < 10'd635);
assign col_valid = (red_out + green_out + blue_out) > 9'h10;

always@(posedge clk) begin

  if (x_valid && y_valid && col_valid) begin
    if (or_valid) begin
      if (or_x1 > x) or_x1 <= x;
      if (or_y1 > y) or_y1 <= y;
      if (or_x2 < x) or_x2 <= x;
      if (or_y2 < y) or_y2 <= y;
    end
    if (gn_valid) begin
      if (gn_x1 > x) gn_x1 <= x;
      if (gn_y1 > y) gn_y1 <= y;
      if (gn_x2 < x) gn_x2 <= x;
      if (gn_y2 < y) gn_y2 <= y;
    end
    if (bl_valid) begin
      if (bl_x1 > x) bl_x1 <= x;
      if (bl_y1 > y) bl_y1 <= y;
      if (bl_x2 < x) bl_x2 <= x;
      if (bl_y2 < y) bl_y2 <= y;
    end
    if (pk_valid) begin
      if (pk_x1 > x) pk_x1 <= x;
      if (pk_y1 > y) pk_y1 <= y;
      if (pk_x2 < x) pk_x2 <= x;
      if (pk_y2 < y) pk_y2 <= y;
    end
    if (bk_valid) begin
      if (bk_x1 > x) bk_x1 <= x;
      if (bk_y1 > y) bk_y1 <= y;
      if (bk_x2 < x) bk_x2 <= x;
      if (bk_y2 < y) bk_y2 <= y;
    end

  end
  
  if (sop & in_valid) begin	//Reset bounds on start of packet
    or_x1 <= 10'd639;
    or_y1 <= 10'd479;
    or_x2 <= 10'd0;
    or_y2 <= 10'd160;
    
    gn_x1 <= 10'd639;
    gn_y1 <= 10'd479;
    gn_x2 <= 10'd0;
    gn_y2 <= 10'd160;
    
    bl_x1 <= 10'd639;
    bl_y1 <= 10'd479;
    bl_x2 <= 10'd0;
    bl_y2 <= 10'd160;
    
    pk_x1 <= 10'd639;
    pk_y1 <= 10'd479;
    pk_x2 <= 10'd0;
    pk_y2 <= 10'd160;
    
    bk_x1 <= 10'd639;
    bk_y1 <= 10'd479;
    bk_x2 <= 10'd0;
    bk_y2 <= 10'd160;
	end
end


//Process bounding box at the end of the frame.
reg [1:0] msg_state;
                
reg [7:0] frame_count;
always@(posedge clk) begin
  if (eop & in_valid & packet_video) begin  //Ignore non-video packets
    
    //Start message writer FSM once every MSG_INTERVAL frames, if there is room in the FIFO
    frame_count <= frame_count - 1;
    
    if (frame_count == 0 && msg_buf_size < MESSAGE_BUF_MAX - 3) begin
      msg_state <= 2'b01;
      frame_count <= MSG_INTERVAL-1;
    end
  end
  
  //Cycle through message writer states once started
  if (msg_state != 2'b00) msg_state <= msg_state + 2'b01;

end
  
//Generate output messages for CPU
reg [31:0] msg_buf_in; 
wire [31:0] msg_buf_out;
reg msg_buf_wr;
wire msg_buf_rd, msg_buf_flush;
wire [7:0] msg_buf_size;
wire msg_buf_empty;

`define RED_BOX_MSG_ID "RBB"


always@(*) begin	//Write words to FIFO as state machine advances
  case(msg_state)
    2'b00: begin
      msg_buf_in = 32'b0;
      msg_buf_wr = 1'b0;
    end
    2'b01: begin
      msg_buf_in = `RED_BOX_MSG_ID;	//Message ID
      msg_buf_wr = 1'b1;
    end
    2'b10: begin
      msg_buf_in = 32'b0;//{5'b0, x_min, 5'b0, y_min};	//Top left coordinate
      msg_buf_wr = 1'b1;
    end
    2'b11: begin
      msg_buf_in = 32'b0;//{5'b0, x_max, 5'b0, y_max}; //Bottom right coordinate
      msg_buf_wr = 1'b1;
    end
  endcase
end

//Output message FIFO
MSG_FIFO	MSG_FIFO_inst (
  .clock (clk),
  .data (msg_buf_in),
  .rdreq (msg_buf_rd),
  .sclr (~reset_n | msg_buf_flush),
  .wrreq (msg_buf_wr),
  .q (msg_buf_out),
  .usedw (msg_buf_size),
  .empty (msg_buf_empty)
  );


//Streaming registers to buffer video signal
STREAM_REG #(.DATA_WIDTH(26)) in_reg (
  .clk(clk),
  .rst_n(reset_n),
  .ready_out(sink_ready),
  .valid_out(in_valid),
  .data_out({red,green,blue,sop,eop}),
  .ready_in(out_ready),
  .valid_in(sink_valid),
  .data_in({sink_data,sink_sop,sink_eop})
);

STREAM_REG #(.DATA_WIDTH(26)) out_reg (
  .clk(clk),
  .rst_n(reset_n),
  .ready_out(out_ready),
  .valid_out(source_valid),
  .data_out({source_data,source_sop,source_eop}),
  .ready_in(source_ready),
  .valid_in(in_valid),
  .data_in({red_out, green_out, blue_out, sop, eop})
);


/////////////////////////////////
/// Memory-mapped port		 /////
/////////////////////////////////

// Addresses
`define REG_STATUS 0
`define READ_MSG 1
`define READ_ID 2
`define REG_BBCOL 3
`define REG_TMIN 4
`define REG_TDIF 5

`define REG_OR_BASE 3
`define REG_GN_BASE 4
`define REG_BL_BASE 5
`define REG_PK_BASE 6
`define REG_BK_BASE 7

//Status register bits
// 31:16 - unimplemented
// 15:8 - number of words in message buffer (read only)
// 7:5 - unused
// 4 - flush message buffer (write only - read as 0)
// 3:0 - unused


// Process write

reg [7:0] reg_status;
reg[23:0] bb_col;
reg [9:0] T_MIN, T_DIF;

wire [23:0]
  t_or, t_gn, t_bl, t_pk, t_bk;
wire [7:0]
  dmax_or, dmax_gn, dmax_bl, dmax_pk, dmax_bk;
wire [9:0]
  total_or, total_gn, total_bl, total_pk, total_bk;

// Guesses currently
assign t_or[23:0] = {8'heb,8'hbd,8'h34};
assign t_gn[23:0] = {8'h52,8'he3,8'h6f};
assign t_bl[23:0] = {8'h7c,8'hc7,8'hde};
assign t_pk[23:0] = {8'hf7,8'hbc,8'hdc};
assign t_bk[23:0] = {8'h56,8'h57,8'h66};

diff_detect diff_or (
  .px1(im_nil),
  .px2(t_or),
  .total(total_or),
  .px_max(dmax_or)
);
diff_detect diff_gn (
  .px1(im_nil),
  .px2(t_gn),
  .total(total_gn),
  .px_max(dmax_gn)
);
diff_detect diff_bl (
  .px1(im_nil),
  .px2(t_bl),
  .total(total_bl),
  .px_max(dmax_bl)
);
diff_detect diff_pk (
  .px1(im_nil),
  .px2(t_pk),
  .total(total_pk),
  .px_max(dmax_pk)
);
diff_detect diff_bk (
  .px1(im_nil),
  .px2(t_bk),
  .total(total_bk),
  .px_max(dmax_bk)
);

always @ (posedge clk)
begin
  if (~reset_n)
  begin
    reg_status <= 8'b0;
    bb_col <= BB_COL_DEFAULT;
  end
  else begin
    if(s_chipselect & s_write) begin
       if (s_address == `REG_STATUS) reg_status <= s_writedata[7:0];
       if (s_address == `REG_BBCOL)  bb_col <= s_writedata[23:0];
       if (s_address == `REG_TMIN)  T_MIN <= s_writedata[23:0];
       if (s_address == `REG_TDIF)  T_DIF <= s_writedata[23:0];
    end
  end
end


//Flush the message buffer if 1 is written to status register bit 4
assign msg_buf_flush = (s_chipselect & s_write & (s_address == `REG_STATUS) & s_writedata[4]);


// Process reads
reg read_d; //Store the read signal for correct updating of the message buffer

// Copy the requested word to the output port when there is a read.
always @ (posedge clk)
begin
   if (~reset_n) begin
     s_readdata <= {32'b0};
    read_d <= 1'b0;
  end
  
  else if (s_chipselect & s_read) begin
    if (s_address == `REG_STATUS)
      s_readdata <= {16'b0,msg_buf_size,reg_status};
      
    if (s_address == `READ_MSG)
      s_readdata <= {msg_buf_out};
      
    if (s_address == `READ_ID)
      s_readdata <= 32'h1234EEE2;
      
    if (s_address[3:1] == `REG_OR_BASE)
      s_readdata <= s_address[0]? or_bb[63:32] : or_bb[31:0];
      
    if (s_address[3:1] == `REG_GN_BASE)
      s_readdata <= s_address[0]? gn_bb[63:32] : gn_bb[31:0];
      
    if (s_address[3:1] == `REG_BL_BASE)
      s_readdata <= s_address[0]? bl_bb[63:32] : bl_bb[31:0];
      
    if (s_address[3:1] == `REG_PK_BASE)
      s_readdata <= s_address[0]? pk_bb[63:32] : pk_bb[31:0];
      
    if (s_address[3:1] == `REG_BK_BASE)
      s_readdata <= s_address[0]? bk_bb[63:32] : bk_bb[31:0];
  end
  
  read_d <= s_read;
end

//Fetch next word from message buffer after read from READ_MSG
assign msg_buf_rd = s_chipselect & s_read & ~read_d & ~msg_buf_empty & (s_address == `READ_MSG);


endmodule

