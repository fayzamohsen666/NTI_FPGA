module light_chaser(
  input wire clk,
  input wire rst,
  input wire hold,
  
  output reg [3:0] Sout
);

  always@(posedge clk, negedge rst)
    begin
	  if(!rst) Sout <= 4'b0111;
      else if(hold)
		  begin
			  Sout[3] <= Sout[0];
			  Sout[2] <= Sout[3];
			  Sout[1] <= Sout[2];
			  Sout[0] <= Sout[1];
		  end
	end
	
endmodule
  