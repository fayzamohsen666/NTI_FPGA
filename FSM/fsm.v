module fsm(
  input clk, reset,
  input a, b,
  output reg y0,
  output reg y1
);

  localparam S0=2'b00,
             S1=2'b01,
			 S2=2'b10;
			 
  reg [1:0] present_state, next_state;
  
  always@(posedge clk or negedge reset)
    begin
    if(!reset)
	  present_state<=S0;
	else
	  present_state<=next_state;
	end
	  
  always@(*)
    begin
    next_state=present_state;
	y0=1'b0;
	y1=1'b0;
    case(present_state)
	  S0:
	    begin
		  y1=1'b1;
		  if({b,a} == 2'b11) 
		    begin
			  next_state=S2;
			  y0=1'b1;
			end
		  else if ({b,a} == 2'b01) next_state=S1;
		end
	  S1:
	    begin
		 y1=1'b1;
		 if(a) next_state=S0;
		end
	  S2:
	    next_state=S0;	
    endcase
	end
	
endmodule
  