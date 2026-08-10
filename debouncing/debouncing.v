module debouncing#(
  parameter WAITING_TIME = 300
)(
  input wire clk,
  input wire reset,
  input wire sw,
  input wire m_tick,
  output reg dp
);

  localparam zero    = 3'b000,
             wait1_1 = 3'b001,
			 wait1_2 = 3'b010,
			 wait1_3 = 3'b011,
			 one     = 3'b100,
			 wait0_1 = 3'b101,
			 wait0_2 = 3'b110,
			 wait0_3 = 3'b111;
			 
  reg [2:0] present_state, next_state;
  
  always@(posedge clk, negedge reset)
    begin
      if(!reset)
	    present_state<=zero;
	  else
	    present_state<=next_state;
    end
	  
  always@(*)
    begin
	  next_state=present_state;
	  dp=1'b0;
	  case(present_state)
	    zero:
		  begin
		    if(sw) next_state=wait1_1;
		  end
		wait1_1:
		  begin
		    if(!sw) next_state=zero;
			else if(sw && m_tick) next_state=wait1_2;
		  end
		wait1_2:
		  begin
		    if(!sw) next_state=zero;
			else if(sw && m_tick) next_state=wait1_3;
		  end
		wait1_3:
		  begin
		    if(!sw) next_state=zero;
			else if(sw && m_tick) next_state=one;
		  end
		one:
		  begin
		    dp=1'b1;
			if(!sw) next_state=wait0_1;
		  end
		wait0_1:
		  begin
		    dp=1'b1;
			if(sw) next_state=one;
			else if((!sw)&& m_tick) next_state= wait0_2;
		  end
		wait0_2:
		  begin
		    dp=1'b1;
			if(sw) next_state=one;
			else if((!sw)&& m_tick) next_state= wait0_3;
		  end
		wait0_3:
		  begin
		    dp=1'b1;
			if(sw) next_state=one;
			else if((!sw) && m_tick) next_state= zero;
		  end
	  endcase
	end
	
endmodule
    
			 
