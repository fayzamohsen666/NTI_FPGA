//Gate_level
module mux4_gate(
  input D0, D1, D2, D3, s0, s1, 
  output Y
);

  assign Y =( D0 & (~s1) & (~s0) ) |
            ( D1 & (~s1) & ( s0) ) |
			( D2 & ( s1) & (~s0) ) |
			( D3 & ( s1) & ( s0) ) ;

endmodule
