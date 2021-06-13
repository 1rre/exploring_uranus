`ifndef DIFF_DETECT_SVH
`define DIFF_DETECT_SVH

`define MK_SIGN(fn) $signed({1'b0,fn})

module diff_detect (
  input          [23:0] px1, px2,
  output unsigned [7:0] px_max,
  output unsigned [9:0] total
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
  
  wire unsigned [23:0] diffs;
  
  assign diffs[23:16] = (ar>=0)? ar[7:0] : -ar;
  assign diffs[15:8] = (ag>=0)? ag[7:0] : -ag;
  assign diffs[7:0] = (ab>=0)? ab[7:0] : -ab;
  
  assign total = diffs[23:16] + diffs[15:8] + diffs[7:0];
  
  wire [7:0] t1_max;
  assign t1_max = (diffs[23:16] < diffs[15:8])? diffs[23:16] : diffs[15:8];
  assign px_max = (diffs[7:0] < t1_max)? diffs[7:0] : t1_max;
  
endmodule

`endif