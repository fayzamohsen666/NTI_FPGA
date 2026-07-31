//Behavioral
module mux4_behav(
  input D0, D1, D2, D3, s0, s1, 
  output reg Y
);

  always @(*)
    begin
	  case({s1,s0})
			0: Y= D0;
			1: Y= D1;
			2: Y= D2;
			3: Y= D3;
	  endcase
	end
	
endmodule


