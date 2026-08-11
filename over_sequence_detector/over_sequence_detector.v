//moore
module over_sequence_detector(
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
			 one_3 =3'b101,
			 one_4 =3'b110;
			 
  reg [2:0] preset_state, next_state;
			 
  always@(posedge clk, negedge reset)
    begin
	  if(!reset) preset_state<=IDLE;
	  else preset_state<=next_state;
	end
	
  always@(*)
    begin
	  Out=1'b0;
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
		  else next_state=one_1;
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
		  if(Serial_in==1'b1) next_state=one_4;
		  else next_state=zero_1;
		end
	  one_4:
	    begin
		  Out=1'b1;
		  if(Serial_in==1'b0) next_state=zero_1;
		  else next_state=one_1;
		end
	  endcase
	end
endmodule
	
  