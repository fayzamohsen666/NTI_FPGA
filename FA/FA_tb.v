module FA_tb;
  reg A, B, Cin;
  wire Cout_B, S_B; 
  wire Cout_F, S_F; 
  wire Cout_G, S_G; 
  wire Cout_S, S_S; 
  
  FA_B behav( A, B, Cin, Cout_B, S_B);
  FA_F flow( A, B, Cin, Cout_F, S_F);
  FA_G gate( A, B, Cin, Cout_G, S_G);
  FA_S struc( A, B, Cin, Cout_S, S_S);
  
  initial
    begin
	  {Cin, B, A}= 3'b000;
	  #10;
	  {Cin, B, A}= 3'b001;
	  #10;
	  {Cin, B, A}= 3'b010;
	  #10;
	  {Cin, B, A}= 3'b011;
	  #10;
	  {Cin, B, A}= 3'b100;
	  #10;
	  {Cin, B, A}= 3'b101;
	  #10;
	  {Cin, B, A}= 3'b110;
	  #10;
	  {Cin, B, A}= 3'b111;
	  #10;
	  $stop;
	end
endmodule
  