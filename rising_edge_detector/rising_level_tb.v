`timescale 1ns/1ns
module rising_level_tb;
  reg clk;
  reg level;
  reg reset;
  wire tick_moore;
  wire tick_mealy;
  
  rising_level_moore m(.*);
  rising_level_mealy m1(.*);
  
  always #5 clk = ~clk; 
  
  initial
    begin
	  clk=1'b0;
	  reset=1'b0; 
	  level=1'b0;
	  
	  #3; reset=1'b1;
	  
	  #10; level=1'b1;
	  
	  #20; level=1'b0; 
	  
	  #10; $stop;
	  
	end
endmodule