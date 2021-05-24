module px_avg (
	input clk,
	input [23:0] px_in,
	output[23:0] px_out
);

reg [23:0] px_0;
reg [23:0] px_1;

assign px_out[23:16] = (px_0[23:16] + px_1[23:16])>>1;
assign px_out[15:8] = (px_0[15:8] + px_1[15:8])>>1;
assign px_out[7:0] = (px_0[7:0] + px_1[7:0])>>1;

always @(posedge clk) begin
	px_0 = px_1;
	px_1 = px_in;
end

endmodule