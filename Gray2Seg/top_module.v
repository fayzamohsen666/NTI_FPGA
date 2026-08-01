module top_module(
  input [3:0] gray,
  output [6:0] seg
);

  wire [3:0] binary;
  
  Gray2Binary m1(gray, binary);
  Binary2Seg m2(binary, seg);
  
endmodule