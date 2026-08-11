`timescale 1ns/1ns
module non_sequence_detector_tb;
  reg clk;
  reg reset;
  reg Serial_in;
  wire Out_mealy;
  wire Out_moore;
  
  reg [5:0] in;
  
  non_sequence_detector   m   (clk, reset, Serial_in, Out_moore);
  non_sequence_detector1 m1   (clk, reset, Serial_in, Out_mealy);
  
  always #5 clk = ~ clk;
  
 integer i;
		
  initial 
    begin
	  clk=1'b0;
      reset=1'b1;
      #5;
      reset=1'b0;
	  #5;
	  reset=1'b1;
	  
	  in=6'b110101;
      for(i=0;i<6;i=i+1)
	    begin
         Serial_in = in[i];
         #10;		 
		end
	  
	  in=6'b111010;
      for(i=0;i<6;i=i+1)
	    begin
         Serial_in = in[i];
         #10;		 
		end
		
	  in=6'b110101;
      for(i=0;i<6;i=i+1)
	    begin
         Serial_in = in[i];
         #10;		 
		end
		#20;
		$stop;
	
	end
	
endmodule
