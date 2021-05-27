module px_scale (
  input [7:0] r_in, g_in, b_in,
  output [7:0] r_out, g_out, b_out
);

wire unsigned [7:0] max;
assign max = (r_in>g_in)? ((r_in>b_in)? r_in : b_in) : ((g_in>b_in)? g_in : b_in);

wire [15:0] r_mul, g_mul, b_mul;

assign r_mul = (r_in * 8'd255);
assign g_mul = (g_in * 8'd255);
assign b_mul = (b_in * 8'd255);

assign r_out = r_mul / max;
assign g_out = g_mul / max;
assign b_out = b_mul / max;

endmodule