`define MK_SIGN(fn) $signed({1'b0,fn})

module edge_detect (
input [23:0]
  px_in,
input unsigned [10:0]
  x,y,
input
  clk,line_sync,
output logic [23:0]
  px_out0
);

wire in_range;
assign in_range = x >= 1 && y >= 1;

wire [7:0] red, green, blue;

wire [23:0] edge_px;
assign edge_px = {r_out,g_out,b_out};

wire [23:0] col_out;

colour_detect c1 (
  .clk(clk),
  .x(x),
  .y(y),
  .px_in(edge_px),
  .px_out(col_out)
);


assign px_out0 = in_range? col_out : px_in;

reg unsigned [7:0] px_buffer[640][3];
reg unsigned [7:0] last_px[3];
wire unsigned [7:0] c_px[3];

reg signed [15:0] dh[3], dv[3];

wire unsigned [15:0] abs_dh[3], abs_dv[3];
wire unsigned [15:0] abs_d[3];

assign abs_dh[0] = $unsigned((dh[0]<16'sh0)? -dh[0] : dh[0]);
assign abs_dh[1] = $unsigned((dh[1]<16'sh0)? -dh[1] : dh[1]);
assign abs_dh[2] = $unsigned((dh[2]<16'sh0)? -dh[2] : dh[2]);
assign abs_dv[0] = $unsigned((dv[0]<16'sh0)? -dv[0] : dv[0]);
assign abs_dv[1] = $unsigned((dv[1]<16'sh0)? -dv[1] : dv[1]);
assign abs_dv[2] = $unsigned((dv[2]<16'sh0)? -dv[2] : dv[2]);

assign abs_d[0] = ({1'b0,abs_dh[0]} + {1'b0,abs_dv[0]})>>1;
assign abs_d[1] = ({1'b0,abs_dh[1]} + {1'b0,abs_dv[1]})>>1;
assign abs_d[2] = ({1'b0,abs_dh[2]} + {1'b0,abs_dv[2]})>>1;


wire unsigned [7:0] r_out, g_out, b_out;
wire signed [8:0] rq, gq, bq;
wire unsigned [8:0] rm, gm, bm;

assign r_out = (abs_d[0]>8'hff)? 8'hff : abs_d[0][7:0];
assign b_out = (abs_d[1]>8'hff)? 8'hff : abs_d[1][7:0];
assign g_out = (abs_d[2]>8'hff)? 8'hff : abs_d[2][7:0];

assign rq = `MK_SIGN(r_out)-`MK_SIGN(avg_px[0]);
assign gq = `MK_SIGN(g_out)-`MK_SIGN(avg_px[1]);
assign bq = `MK_SIGN(b_out)-`MK_SIGN(avg_px[2]);

assign rm = ((rq<9'sh0)?8'b0:$unsigned(rq[7:0]));
assign gm = ((gq<9'sh0)?8'b0:$unsigned(gq[7:0]));
assign bm = ((bq<9'sh0)?8'b0:$unsigned(bq[7:0]));

assign red = (rm>9'hff)?8'hff:rm[7:0];
assign green = (gm>9'hff)?8'hff:gm[7:0];
assign blue = (bm>9'hff)?8'hff:bm[7:0];

assign c_px[0] = px_in[23:16];
assign c_px[1] = px_in[15:8];
assign c_px[2] = px_in[7:0];

reg [7:0] avg_px[3];

wire[7:0] avg_r, avg_g, avg_b;

line_avg avg (
	.clk(clk),
	.c_px(px_in),
	.r_out(avg_r),
	.g_out(avg_g),
	.b_out(avg_b)
);

always @(posedge clk) begin
  // Horizontal Differential
  if (x >= 1) begin
	 // Red
    dh[0] = (`MK_SIGN(px_buffer[x-1][0]) - `MK_SIGN(c_px[0]))<<<3;
    dv[0] = (`MK_SIGN(px_buffer[x][0]) - `MK_SIGN(last_px[0]))<<<3;
	 // Green
    dh[1] = (`MK_SIGN(px_buffer[x-1][1]) - `MK_SIGN(c_px[1]))<<<3;
    dv[1] = (`MK_SIGN(px_buffer[x][1]) - `MK_SIGN(last_px[1]))<<<3;
	 // Blue
    dh[2] = (`MK_SIGN(px_buffer[x-1][2]) - `MK_SIGN(c_px[2]))<<<3;
    dv[2] = (`MK_SIGN(px_buffer[x][2]) - `MK_SIGN(last_px[2]))<<<3;
  end
  
  if (x == 576) begin
	avg_px[0] = avg_r;
	avg_px[1] = avg_g;
	avg_px[2] = avg_b;
  end
  
  px_buffer[x][0] = last_px[0];
  px_buffer[x][1] = last_px[1];
  px_buffer[x][2] = last_px[2];
  last_px[0] = c_px[0];
  last_px[1] = c_px[1];
  last_px[2] = c_px[2];
end


endmodule
