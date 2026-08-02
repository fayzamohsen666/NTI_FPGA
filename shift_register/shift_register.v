module shift_register(
  input Sin, clk, reset_n,
  output [3:0] Sout
);
  
  d_ff m0 ( Sin    , clk, reset_n   , Sout[0]);
  d_ff m1 ( Sout[0], clk, reset_n   , Sout[1]);
  d_ff m2 ( Sout[1], clk, reset_n   , Sout[2]);
  d_ff m3 ( Sout[2], clk, reset_n   , Sout[3]);
    
endmodule
  

  