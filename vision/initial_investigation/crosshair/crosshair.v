// Added to EEE_IMGPROC.v

`define READ_CROSS				4

wire [23:0] im_1, im_2;
reg  [23:0] cross_val;

// Show Crosshair
wire cross_active;
assign cross_active = (x == 320 && y >= 235 && 245 >= y) || (y == 240 && x >= 315 && 325 >= x);
assign im_1 = cross_active? {~red,~green,~blue} : {red, green, blue};

// Show bounding box
wire bb_active;
assign bb_active = (x == left) | (x == right) | (y == top) | (y == bottom);
assign im_2 = bb_active ? bb_col : red_high;

// Switch output pixels depending on mode switch
// Don't modify the start-of-packet word - it's a packet discriptor
// Don't modify data in non-video packets
assign {red_out, green_out, blue_out} = (~mode | sop | ~packet_video) ? im_1 : im_2;

always @(posedge clk) begin
  if (s_address == `READ_CROSS) s_readdata <= {8'h0, cross_val};
	if (x == 320 && y == 240) begin
		cross_val = {red,green,blue};
  end
end
