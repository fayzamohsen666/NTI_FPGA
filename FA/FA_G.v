//Gate_level
module FA_G(
    input A, B, Cin,
    output Cout, S
);

  assign S= A^ B ^ Cin;
  assign Cout= (A & B) | ( Cin & (A^B) );

endmodule