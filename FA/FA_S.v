//Structural 
module FA_S(
  input A, B, Cin,
  output Cout, S 
);

  wire sum1, carry1, sum2, carry2;
 
  HA block1 (A ,B , sum1, carry1);
  HA block2 (sum1, Cin, sum2, carry2);

  assign S= sum2;
  assign Cout= carry1 | carry2 ;

endmodule


