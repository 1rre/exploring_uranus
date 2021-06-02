`define MK_SIGN(fn) $signed({1'b0,fn})

module diff_detect (
  input [23:0] px1, px2,
  output[23:0] px_out
);
  wire signed [8:0] r1,r2,g1,g2,b1,b2,ar,ag,ab;
  assign r1 = `MK_SIGN(px1[23:16]);
  assign r2 = `MK_SIGN(px2[23:16]);
  assign g1 = `MK_SIGN(px1[15:8]);
  assign g2 = `MK_SIGN(px2[15:8]);
  assign b1 = `MK_SIGN(px1[7:0]);
  assign b2 = `MK_SIGN(px2[7:0]);
  
  assign ar = r1-r2;
  assign ag = g1-g2;
  assign ab = b1-b2;
  
  assign px_out[23:16] = (ar>=0)? ar[7:0] : -ar;
  assign px_out[15:8] = (ag>=0)? ag[7:0] : -ag;
  assign px_out[7:0] = (ab>=0)? ab[7:0] : -ab;
  
endmodule