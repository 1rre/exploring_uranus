`define MK_SIGN(fn) $signed({1'b0,fn})

module edge_detect (
input [23:0]
  px_in,
input unsigned [10:0]
  x,y,
input unsigned [9:0]
  T_MIN,T_DIF,
input
  clk,line_sync,
output logic [23:0]
  px_out0, px_out1, px_out2, px_out3
);

wire in_range;
assign in_range = x >= 1 && y >= 1;

wire [7:0] red, green, blue;

wire [23:0] edge_px;
wire [23:0] edge_px_1;
assign edge_px = {r_out,g_out,b_out};
assign edge_px_1 = {r_out_1,g_out_1,b_out_1};

wire [23:0] col_out;
wire [23:0] col_out_1;

wire [23:0] t_out;
wire [23:0] t_out_1;

wire [7:0] red_t, green_t, blue_t;
assign red_t = (r_out>T_MIN)? r_out : 0;
assign green_t = (g_out>T_MIN)? g_out : 0;
assign blue_t = (b_out>T_MIN)? b_out : 0;

wire [7:0] red_t_1, green_t_1, blue_t_1;
assign red_t_1 = (r_out_1>T_MIN)? r_out_1 : 0;
assign green_t_1 = (g_out_1>T_MIN)? g_out_1 : 0;
assign blue_t_1 = (b_out_1>T_MIN)? b_out_1 : 0;

assign t_out = (red_t || green_t || blue_t)? edge_px : 24'h0;
assign t_out_1 = (red_t_1 || green_t_1 || blue_t_1)? edge_px_1 : 24'h0;

lookup_colour c1 (
  .px_in(t_out),
  .px_lookup(px_in),
  .px_out(col_out)
);

lookup_colour c2 (
  .px_in(t_out_1),
  .px_lookup(px_in),
  .px_out(col_out_1)
);

assign px_out0 = in_range? col_out : px_in;
assign px_out1 = in_range? edge_px : px_in;
assign px_out2 = in_range? col_out_1 : px_in;
assign px_out3 = in_range? edge_px_1 : px_in;

reg unsigned [7:0] px_buffer[640][3];
reg unsigned [7:0] last_px[3];
wire unsigned [7:0] c_px[3];

assign c_px[0] = px_in[23:16];
assign c_px[1] = px_in[15:8];
assign c_px[2] = px_in[7:0];

reg signed [15:0] dh[3], dv[3];

wire unsigned [15:0] abs_dh[3], abs_dv[3];
wire unsigned [15:0] abs_dh_1[3], abs_dv_1[3];
wire unsigned [15:0] abs_d[3];
wire unsigned [15:0] abs_d_1[3];


assign abs_dh[0] = (dh[0]<16'sh0)? 0 : dh[0]; // -dh[0]
assign abs_dh[1] = (dh[1]<16'sh0)? 0 : dh[1]; // -dh[1]
assign abs_dh[2] = (dh[2]<16'sh0)? 0 : dh[2]; // -dh[2]
assign abs_dv[0] = (dv[0]<16'sh0)? 0 : dv[0]; // -dv[0]
assign abs_dv[1] = (dv[1]<16'sh0)? 0 : dv[1]; // -dv[1]
assign abs_dv[2] = (dv[2]<16'sh0)? 0 : dv[2]; // -dv[2]

assign abs_dh_1[0] = (dh[0]<16'sh0)? -dh[0] : dh[0]; // 
assign abs_dh_1[1] = (dh[1]<16'sh0)? -dh[1] : dh[1]; // 
assign abs_dh_1[2] = (dh[2]<16'sh0)? -dh[2] : dh[2]; // 
assign abs_dv_1[0] = (dv[0]<16'sh0)? -dv[0] : dv[0]; // 
assign abs_dv_1[1] = (dv[1]<16'sh0)? -dv[1] : dv[1]; // 
assign abs_dv_1[2] = (dv[2]<16'sh0)? -dv[2] : dv[2]; // 

assign abs_d[0] = ({1'b0,abs_dh[0]} + {1'b0,abs_dv[0]})>>1;
assign abs_d[1] = ({1'b0,abs_dh[1]} + {1'b0,abs_dv[1]})>>1;
assign abs_d[2] = ({1'b0,abs_dh[2]} + {1'b0,abs_dv[2]})>>1;

assign abs_d_1[0] = ({1'b0,abs_dh_1[0]} + {1'b0,abs_dv_1[0]})>>1;
assign abs_d_1[1] = ({1'b0,abs_dh_1[1]} + {1'b0,abs_dv_1[1]})>>1;
assign abs_d_1[2] = ({1'b0,abs_dh_1[2]} + {1'b0,abs_dv_1[2]})>>1;


wire unsigned [7:0] r_out, g_out, b_out;
wire unsigned [7:0] r_out_1, g_out_1, b_out_1;

assign r_out = (abs_d[0]>8'hff)? 8'hff : abs_d[0][7:0];
assign g_out = (abs_d[1]>8'hff)? 8'hff : abs_d[1][7:0];
assign b_out = (abs_d[2]>8'hff)? 8'hff : abs_d[2][7:0];

assign r_out_1 = (abs_d_1[0]>8'hff)? 8'hff : abs_d_1[0][7:0];
assign g_out_1 = (abs_d_1[1]>8'hff)? 8'hff : abs_d_1[1][7:0];
assign b_out_1 = (abs_d_1[2]>8'hff)? 8'hff : abs_d_1[2][7:0];

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
  
  px_buffer[x][0] = last_px[0];
  px_buffer[x][1] = last_px[1];
  px_buffer[x][2] = last_px[2];
  last_px[0] = c_px[0];
  last_px[1] = c_px[1];
  last_px[2] = c_px[2];
end


endmodule
