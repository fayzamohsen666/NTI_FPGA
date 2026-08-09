module fsm_tb;

  reg clk;
  reg reset;
  reg a;
  reg b;
  wire y0;
  wire y1;
  
  fsm m(.*);
  
  always #5 clk = ~ clk;
  
  initial
    begin
	  clk=1'b0;
	  reset=1'b0; #3; reset=1'b1;
	  
	  {a,b}=2'b00;
	  #8;
	  {a,b}=2'b01;
	  #8;
	  {a,b}=2'b00;
	  #8;
	  {a,b}=2'b10;
	  #8;
	  {a,b}=2'b00;
	  #8;
	  {a,b}=2'b01;
	  #8;
	  {a,b}=2'b10;
	  #8;
	  {a,b}=2'b11;
	  #24;
	  $stop;
	end
endmodule
  
  
