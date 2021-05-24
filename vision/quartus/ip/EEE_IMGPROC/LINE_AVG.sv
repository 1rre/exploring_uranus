module line_avg (
	input clk,
	input [23:0] c_px,
	output[7:0] r_out, g_out, b_out
);


wire [23:0] avg_2;
wire [23:0] avg_4;
wire [23:0] avg_8;
wire [23:0] avg_16;
wire [23:0] avg_32;
wire [23:0] avg_64;
wire [23:0] avg_128;
wire [23:0] avg_256;
wire [23:0] avg_px;

assign r_out = avg_px[23:16];
assign g_out = avg_px[15:8];
assign b_out = avg_px[7:0];

px_avg apx_2 (
	.clk(clk),
	.px_in(c_px),
	.px_out(avg_2)
);
px_avg apx_4 (
	.clk(clk),
	.px_in(avg_2),
	.px_out(avg_4)
);
px_avg apx_8 (
	.clk(clk),
	.px_in(avg_4),
	.px_out(avg_8)
);
px_avg apx_16 (
	.clk(clk),
	.px_in(avg_8),
	.px_out(avg_16)
);
px_avg apx_32 (
	.clk(clk),
	.px_in(avg_16),
	.px_out(avg_32)
);
px_avg apx_64 (
	.clk(clk),
	.px_in(avg_32),
	.px_out(avg_64)
);
px_avg apx_128 (
	.clk(clk),
	.px_in(avg_64),
	.px_out(avg_128)
);
px_avg apx_256 (
	.clk(clk),
	.px_in(avg_128),
	.px_out(avg_256)
);
px_avg apx (
	.clk(clk),
	.px_in(avg_256),
	.px_out(avg_px)
);


endmodule