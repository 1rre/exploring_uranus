module colour_detect (
  input
    clk, x, y,
  input [23:0]
    px_in,
  output [23:0]
    px_out
);

localparam bit [23:0] GREEN  = {8'd053,8'd255,8'd110};
localparam bit [23:0] ORANGE = {8'd255,8'd215,8'd013};
localparam bit [23:0] BLUE   = {8'd001,8'd139,8'd255};
localparam bit [23:0] PINK   = {8'd155,8'd165,8'd255};
localparam bit [23:0] BLACK  = {8'd037,8'd159,8'd255};

localparam bit [23:0] SET_GR = {8'd000,8'd255,8'd000};
localparam bit [23:0] SET_OR = {8'd255,8'd255,8'd000};
localparam bit [23:0] SET_BL = {8'd000,8'd000,8'd255};
localparam bit [23:0] SET_PK = {8'd255,8'd000,8'd255};
localparam bit [23:0] SET_BK = {8'd255,8'd255,8'd255};
localparam bit [23:0] SET_NO = {8'd000,8'd000,8'd000};

localparam unsigned T_DIF = 9'd32;
localparam unsigned T_MIN = 9'd56;

wire unsigned [7:0] r_in,g_in,b_in;

assign r_in = px_in[23:16];
assign g_in = px_in[15:8];
assign b_in = px_in[7:0];

// Is the pixel bright enough for detection?
wire unsigned [8:0] colour_sum;
assign colour_sum = r+b+g;
wire bright_px;
assign bright_px = colour_sum > T_MIN;

// Brighten the pixel
wire unsigned [7:0] s_r,s_g,s_b;
px_scale s1 (
	.r_in(r_in),
	.g_in(g_in),
	.b_in(b_in),
	.r_out(s_r),
	.g_out(s_g),
	.b_out(s_b)
);

wire [23:0] diff_gn, diff_or, diff_bl, diff_pk, diff_bk;
diff_detect d_gn (
	.px1(GREEN),
	.px2({s_r,s_g,s_b}),
	.px_out(diff_gn)
);
diff_detect d_or (
	.px1(ORANGE),
	.px2({s_r,s_g,s_b}),
	.px_out(diff_or)
);
diff_detect d_bl (
	.px1(BLUE),
	.px2({s_r,s_g,s_b}),
	.px_out(diff_bl)
);
diff_detect d_pk (
	.px1(PINK),
	.px2({s_r,s_g,s_b}),
	.px_out(diff_pk)
);
diff_detect d_bk (
	.px1(BLACK),
	.px2({s_r,s_g,s_b}),
	.px_out(diff_bk)
);

wire [8:0] sum_gn, sum_or, sum_bl, sum_pk, sum_bk;

assign sum_gn = diff_gn[23:16] + diff_gn[15:8] + diff_gn[7:0];
assign sum_or = diff_or[23:16] + diff_or[15:8] + diff_or[7:0];
assign sum_bl = diff_bl[23:16] + diff_bl[15:8] + diff_bl[7:0];
assign sum_pk = diff_pk[23:16] + diff_pk[15:8] + diff_pk[7:0];
assign sum_bk = diff_bk[23:16] + diff_bk[15:8] + diff_bk[7:0];

// maximums
wire [8:0] s_gn_or,s_bl_bk,s_bb_pk,s_bp_go;
assign s_gn_or = (sum_gn>sum_or)? sum_gn : sum_or;
assign s_bl_bk = (sum_bl>sum_bk)? sum_bl : sum_bk;
assign s_bb_pk = (s_bl_bk>sum_pk)? s_bl_bk : sum_pk;
assign s_bp_go = (s_bb_pk>s_gn_or)? s_bb_pk : s_gn_or;

wire gn_ismax, or_ismax, bl_ismax, pk_ismax, bk_ismax;
assign gn_ismax = (s_bp_go == sum_gn);
assign or_ismax = (s_bp_go == sum_or);
assign bl_ismax = (s_bp_go == sum_bl);
assign pk_ismax = (s_bp_go == sum_pk);
assign bk_ismax = (s_bp_go == sum_bk);

// TODO: from finding out which colour is max intensity
// 		Implement diff_detect

endmodule
	 