module rising_level_moore(
  input clk,
  input level,
  input reset,
  output reg tick_moore
);

  reg [1:0] present_state, next_state;
  
  localparam zero=2'b00, 
             edg =2'b01,
			 one =2'b10;
  
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
	  tick_moore=1'b0;
	  case(present_state)
	    zero:
		  begin
		    if(level==1'b1)
			  next_state=edg;
		  end
		edg:
		  begin
		    next_state=one;
            tick_moore=1'b1;
          end			
		one:
		  begin
		  	if(level==1'b0)
			  next_state=zero;
		  end
      endcase		  
	end
	
endmodule
    
	  
  
  