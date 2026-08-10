module stream_parity_gen(
  input wire clk,
  input wire reset,
  input wire serial_in,
  
  output reg parity_out
);

  reg [7:0] shift_reg;
  reg [3:0] counter;
  
  	function even_parity_gen(input [7:0] data);
	  integer i;
	  begin
	  even_parity_gen=0;
      for(i=0; i<8; i=i+1)
	    even_parity_gen=data[i]^even_parity_gen;
	  end
	endfunction
	
	
  always@(posedge clk)
    begin
	  if(reset)
	    begin
		  shift_reg <= 8'b0000_0000;
		  counter   <= 4'b0000;
		end
	   else
	     begin
		   if(counter < 4'b1000) 
		    begin
			  counter <= counter + 1;
			  shift_reg <= {serial_in, shift_reg[7:1]};
			end
		  else
		    begin
			  counter <= 4'b0001;
			  shift_reg <= {serial_in, shift_reg[7:1]};
			  parity_out <= even_parity_gen(shift_reg);
			  //shift_reg <= 8'b0000_0000;
			end		     
		 end
	end
	

	
endmodule
         	  
  
