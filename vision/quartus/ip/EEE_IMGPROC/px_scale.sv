module px_scale (
	input [7:0] r_in, g_in, b_in,
	output [7:0] r_out, g_out, b_out
);

wire unsigned [7:0] max;
assign max = (r_in>g_in)? ((r_in>b_in)? r_in : b_in) : ((g_in>b_in)? g_in : b_in);

assign r_out = (r_in * 8'd255) / max;
assign g_out = (g_in * 8'd255) / max;
assign b_out = (b_in * 8'd255) / max;

endmodule