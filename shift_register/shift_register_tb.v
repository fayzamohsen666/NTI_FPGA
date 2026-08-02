module shift_register_tb;
  reg Sin, clk, reset_n;
  wire [3:0] Sout;
	
  shift_register m( Sin, clk, reset_n, Sout);
  
  always #5 clk= ~ clk; 
  
  initial
    begin
	  clk=0;
	  reset_n=0; #10;
	  reset_n=1; 
	  
	  Sin=1; #10;
	  Sin=0; #10;
	  Sin=1; #10;
	  Sin=1; #10;
	  
	  $stop;
	end
  
endmodule
	
	