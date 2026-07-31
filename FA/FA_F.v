//Dataflow
module FA_F(
  input A, B, Cin,
  output Cout, S
);

assign {Cout, S} = A + B + Cin;

endmodule 

