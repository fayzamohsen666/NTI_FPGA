module rising_level_mealy(
  input clk,
  input level,
  input reset,
  output reg tick_mealy
);

  reg present_state, next_state;
  
  localparam zero=1'b0, 
			 one =1'b1;
  
  always@(posedge clk or negedge reset)
    begin
    if(!reset)
	  present_state<=zero;
	else
	  present_state<=next_state;
	end
	  
  always@(*)
    begin
	  next_state=present_state;
	  tick_mealy=1'b0;
	  case(present_state)
	    zero:
		  begin
		    if(level)
			  begin
			  next_state=one;
			  tick_mealy=1'b1;
			  end  
		  end			
		one:
		  begin
		  	if(!level)
			  next_state=zero;
		  end
      endcase		  
	end
	
endmodule
    
	  
  
  