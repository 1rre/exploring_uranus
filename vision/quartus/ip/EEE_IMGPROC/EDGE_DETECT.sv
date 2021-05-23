module edge_detect (
input [23:0]
  px_in,
input unsigned [10:0]
  x,y,
input
  clk,line_sync,
output logic [23:0]
  px_out
);

wire in_range;
assign in_range = x >= 2 && y >= 2;

wire [2:0] red, green, blue;
wire [7:0] grey;

wire [23:0] edge_px;
assign edge_px = {grey,grey,grey};

assign px_out = in_range? edge_px : px_in;

logic unsigned [2:0] px_buffer[3][640][3];

reg signed [4:0] dh[3], dv[3];

wire unsigned [4:0] abs_dh[3], abs_dv[3];
wire unsigned [4:0] abs_d[3];

assign abs_dh[0] = dh[0]<0? -dh[0] : dh[0];
assign abs_dh[1] = dh[1]<0? -dh[1] : dh[1];
assign abs_dh[2] = dh[2]<0? -dh[2] : dh[2];
assign abs_dv[0] = dv[0]<0? -dv[0] : dv[0];
assign abs_dv[1] = dv[1]<0? -dv[1] : dv[1];
assign abs_dv[2] = dv[2]<0? -dv[2] : dv[2];

assign abs_d[0] = (abs_dh[0] + abs_dv[0])>>1;
assign abs_d[1] = (abs_dh[1] + abs_dv[1])>>1;
assign abs_d[2] = (abs_dh[2] + abs_dv[2])>>1;

assign red = (abs_d[0]>3'b111)? 3'b111 : abs_d[0][2:0];
assign green = (abs_d[1]>3'b111)? 3'b111 : abs_d[1][2:0];
assign blue = (abs_d[2]>3'b111)? 3'b111 : abs_d[2][2:0];

// assign grey = {red|blue|green, 5'h0};
assign grey = {(red>green)?(red>blue)?red:blue:(green>blue)?green:blue, 5'h0};

wire [7:0] r_in,g_in,b_in;
assign r_in = px_in[23:16];
assign g_in = px_in[15:8];
assign b_in = px_in[7:0];

always @(posedge clk) begin
  px_buffer[2][x][0] = r_in[7:5];
  px_buffer[2][x][1] = g_in[7:5];
  px_buffer[2][x][2] = b_in[7:5];
  if (x >= 2) begin
    // Horizontal Differential
	 for (int i = 0; i < 3; i = i + 1) begin
	   dh[i] = (
        (px_buffer[0][x-2][i] - px_buffer[2][x-2][i]) +
        ((px_buffer[0][x-1][i] - px_buffer[2][x-1][i]) << 1) +
        (px_buffer[0][x][i] - px_buffer[2][x][i])
      );
		dv[i] = (
		  (px_buffer[0][x-2][i] - px_buffer[0][x][i]) +
		  ((px_buffer[1][x-2][i] - px_buffer[1][x][i])<<1) +
		  (px_buffer[2][x-2][i] - px_buffer[2][x][i])
		);
		
	 end
	 

	 end
end

always @(posedge line_sync) begin
	px_buffer[0] = px_buffer[1];
	px_buffer[1] = px_buffer[2];
end


endmodule
