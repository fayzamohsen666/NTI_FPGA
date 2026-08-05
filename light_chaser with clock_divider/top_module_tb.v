`timescale 1ns/1ns
module top_module_tb;
  reg clk;
  reg rst_clk;
  reg rst_light;
  reg hold;
  
  wire [3:0] Sout;
  
  
  top_module m(clk, rst_clk, rst_light, hold, Sout );
  
  always #5 clk = ~ clk ;
  
  initial
    begin
	   clk=0;
	   hold=1;
	   rst_clk=0;
	   rst_light=0;
	   #5;
	   rst_clk=1;
	   rst_light=1;
	   #200;
	   hold=0;
	   #300;
	   hold=1;
	   #1000;
	   $stop;
	end
	
endmodule

