module colour_detect (
input
  clk,
input unsigned [9:0]
  T_DIF,T_MIN,
input unsigned [10:0]
  x, y,
input [23:0]
  px_in,
output logic [23:0]
  px_out
);

wire [23:0] GREEN;
assign GREEN = {8'd053,8'd255,8'd110};
wire [23:0] ORANGE;
assign ORANGE = {8'd255,8'd215,8'd013};
wire [23:0] BLUE;
assign BLUE = {8'd001,8'd139,8'd255};
wire [23:0] PINK;
assign PINK = {8'd155,8'd165,8'd255};
wire [23:0] BLACK;
assign BLACK = {8'd037,8'd159,8'd255};

wire [23:0] SET_GN;
assign SET_GN = {8'd000,8'd255,8'd000};
wire [23:0] SET_OR;
assign SET_OR = {8'd255,8'd255,8'd000};
wire [23:0] SET_BL;
assign SET_BL = {8'd000,8'd000,8'd255};
wire [23:0] SET_PK;
assign SET_PK = {8'd255,8'd000,8'd255};
wire [23:0] SET_BK;
assign SET_BK = {8'd255,8'd255,8'd255};
wire [23:0] SET_NO;
assign SET_NO = {8'd000,8'd000,8'd000};

wire unsigned [7:0] r_in,g_in,b_in;

assign r_in = px_in[23:16];
assign g_in = px_in[15:8];
assign b_in = px_in[7:0];

// Is the pixel bright enough for detection?
wire unsigned [8:0] colour_sum;
assign colour_sum = r_in+g_in+b_in;
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

wire unsigned [8:0] sum_gn, sum_or, sum_bl, sum_pk, sum_bk;

assign sum_gn = {1'b0,diff_gn[23:16]} + {1'b0,diff_gn[15:8]} + {1'b0,diff_gn[7:0]};
assign sum_or = {1'b0,diff_or[23:16]} + {1'b0,diff_or[15:8]} + {1'b0,diff_or[7:0]};
assign sum_bl = {1'b0,diff_bl[23:16]} + {1'b0,diff_bl[15:8]} + {1'b0,diff_bl[7:0]};
assign sum_pk = {1'b0,diff_pk[23:16]} + {1'b0,diff_pk[15:8]} + {1'b0,diff_pk[7:0]};
assign sum_bk = {1'b0,diff_bk[23:16]} + {1'b0,diff_bk[15:8]} + {1'b0,diff_bk[7:0]};

// maximums
wire gn_ismax, or_ismax, bl_ismax, pk_ismax, bk_ismax;
wire gn_isvalid, or_isvalid, bl_isvalid, pk_isvalid, bk_isvalid;

assign gn_isvalid = (diff_gn[23:16] <= T_DIF) &&
                    (diff_gn[15:8]  <= T_DIF) &&
                    (diff_gn[7:0]   <= T_DIF) && bright_px;

assign or_isvalid = (diff_or[23:16] <= T_DIF) &&
                    (diff_or[15:8]  <= T_DIF) &&
                    (diff_or[7:0]   <= T_DIF) && bright_px;

assign bl_isvalid = (diff_bl[23:16] <= T_DIF) &&
                    (diff_bl[15:8]  <= T_DIF) &&
                    (diff_bl[7:0]   <= T_DIF) && bright_px;

assign pk_isvalid = (diff_pk[23:16] <= T_DIF) &&
                    (diff_pk[15:8]  <= T_DIF) &&
                    (diff_pk[7:0]   <= T_DIF) && bright_px;

assign bk_isvalid = (diff_bk[23:16] <= T_DIF) &&
                    (diff_bk[15:8]  <= T_DIF) &&
                    (diff_bk[7:0]   <= T_DIF) && bright_px;

assign gn_ismax = ((sum_gn <= sum_or)||!or_isvalid) && 
                  ((sum_gn <= sum_bl)||!bl_isvalid) &&
                  ((sum_gn <= sum_pk)||!pk_isvalid) &&
                  ((sum_gn <= sum_bk)||!bk_isvalid) && gn_isvalid;
                  
assign or_ismax = ((sum_or <= sum_gn)||!gn_isvalid) &&
                  ((sum_or <= sum_bl)||!bl_isvalid) && 
                  ((sum_or <= sum_pk)||!pk_isvalid) &&
                  ((sum_or <= sum_bk)||!bk_isvalid) && or_isvalid;

// No comparison to black for blue
assign bl_ismax = ((sum_bl <= sum_or)||!or_isvalid) &&
                  ((sum_bl <= sum_gn)||!gn_isvalid) &&
                  ((sum_bl <= sum_pk)||!pk_isvalid) && bl_isvalid;

assign pk_ismax = ((sum_pk <= sum_or)||!or_isvalid) &&
                  ((sum_pk <= sum_gn)||!gn_isvalid) &&
                  ((sum_pk <= sum_bl)||!bl_isvalid) && 
                  ((sum_pk <= sum_bk)||!bk_isvalid) && pk_isvalid;

// No comparison to blue for black
assign bk_ismax = ((sum_bk <= sum_or)||!or_isvalid) && 
                  ((sum_bk <= sum_gn)||!gn_isvalid) &&
                  ((sum_bk <= sum_pk)||!pk_isvalid) && bk_isvalid;

reg unsigned [23:0] last;

wire [23:0] c_px;
assign c_px = gn_ismax? SET_GN : or_ismax? SET_OR : bl_ismax? SET_BL : pk_ismax? SET_PK : bk_ismax? SET_BK : SET_NO;

always_ff @ (posedge clk) begin
  px_out = c_px;
  last = c_px;
end

endmodule
