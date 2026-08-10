`timescale 1ns/1ns
module stream_parity_gen_tb;
  reg clk;
  reg reset;
  reg serial_in;
  
  wire parity_out;
  
  stream_parity_gen m(.*);
  
  always #5 clk = ~clk;
  
  initial
    begin
	  clk=0;
      reset=1; #10; reset=0;
	  
	  //first group
      serial_in=1; #10;
	  serial_in=0; #10;
	  serial_in=1; #10;
	  serial_in=0; #10;
	  serial_in=1; #10; 
	  serial_in=0; #10;
	  serial_in=1; #10;
	  serial_in=0; #10;
	  
	  serial_in=1; #10;
	  serial_in=0; #10;
	  serial_in=0; #10;
	  serial_in=1; #10;
	  serial_in=0; #10;
	  serial_in=1; #10;
	  serial_in=0; #10;
	  serial_in=0; #10;
	  #10; $stop;	  
	end
	
endmodule
