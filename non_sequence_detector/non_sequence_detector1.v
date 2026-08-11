//mealy
module non_sequence_detector1(
  input wire clk,
  input wire reset,
  input wire Serial_in,
  output reg Out
);

  localparam IDLE  =3'b000,
             one_1 =3'b001,
             zero_1=3'b010,
			 one_2 =3'b011,
			 zero_2=3'b100,
			 one_3 =3'b101;
			 //one_4 =3'b110;
			 
  reg [2:0] preset_state, next_state;
			 
  always@(posedge clk, negedge reset)
    begin
	  if(!reset) 
	    begin
		  preset_state<=IDLE;
		  Out<=1'b0;
		end
	  else 
	    begin
		  if(preset_state==one_3 && Serial_in==1'b1) Out<=1'b1;
		  else Out<=1'b0;
		  preset_state<=next_state;
		end
	end
	
  always@(*)
    begin
	  case(preset_state)
	  IDLE:
	    begin
		  if(Serial_in==1'b1) next_state=one_1;
		  else next_state=IDLE;
		end
	  one_1:
	    begin
		  if(Serial_in==1'b0) next_state=zero_1;
		  else next_state=one_1;
		end
	  zero_1:
	    begin
		  if(Serial_in==1'b1) next_state=one_2;
		  else next_state=IDLE;
		end
	  one_2:
	    begin
		  if(Serial_in==1'b0) next_state=zero_2;
		  else next_state=one_1;
		end
	  zero_2:
	    begin
		  if(Serial_in==1'b1) next_state=one_3;
		  else next_state=IDLE;
		end
	  one_3:
	    begin
		  if(Serial_in==1'b1) next_state=IDLE;
		  else next_state=zero_1;
		end
	  endcase
	end
endmodule
	
  
