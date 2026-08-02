module d_ff(
  input wire d,
  input wire clk,
  input wire reset, //active low & Asynchronous reset
  
  output reg q
);

  always@(posedge clk or negedge reset)
    begin
	  if(!reset) q<=0'b0;
	  else q<=d;
	end
	
endmodule

