//Structural 
module mux4_struc(
  input i0, i1, i2, i3, s0, s1, 
  output out
);

  wire out1, out2;

  mux2 block1(i0, i1, s0, out1);
  mux2 block2(i2, i3, s0, out2);
  mux2 block3(out1, out2, s1, out);

endmodule