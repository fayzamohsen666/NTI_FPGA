module d_ff_tb;
  reg d;
  reg clk;
  reg reset; 
  
  wire q_sync;
  wire q_async;
  
  d_ff_sync sync   ( d, clk, ! reset, q_sync );
  d_ff_async async ( d, clk,   reset, q_async);
  
  
  always #5 clk = ~ clk ;
  
  initial
    begin
	  clk=0;
	  
	  reset=1; 
	  d=1;     #10;
	  d=0;     #10;
	  
	  reset=0;
	  d=1;     #10;
	  d=0;     #10;
	  
	  $stop;
	end
	
endmodule


