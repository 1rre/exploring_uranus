`ifndef LOOKUP_COLOUR_SVH
`define LOOKUP_COLOUR_SVH

module lookup_colour (
input[23:0]
  px_in, px_lookup,
output[23:0]
  px_out
);

wire unsigned [7:0]
  r_in, g_in, b_in, r_lu, g_lu, b_lu, r_out, g_out, b_out;

wire
  r_on, g_on, b_on, px_on;

assign r_in = px_in[23:16];
assign g_in = px_in[15:8];
assign b_in = px_in[7:0];

assign r_lu = px_lookup[23:16];
assign g_lu = px_lookup[15:8];
assign b_lu = px_lookup[7:0];

assign px_out = {r_out,g_out,b_out};

assign r_on = r_in > 8'h7f;
assign g_on = g_in > 8'h7f;
assign b_on = b_in > 8'h7f;
assign px_on = r_on || g_on || b_on;

assign r_out = px_on? r_lu : 8'h0;
assign g_out = px_on? g_lu : 8'h0;
assign b_out = px_on? b_lu : 8'h0;

endmodule

`endif