//Behavioral
module FA_B(
  input A, B, Cin,
  output reg Cout, S
);

  always @(*)
    begin
      {Cout, S} =A + B + Cin;
    end
	
endmodule

