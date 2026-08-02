module d_ff_sync(
  input wire d,
  input wire clk,
  input wire reset, //active low & synchronous reset
  
  output reg q
);

  always@(posedge clk)
    begin
	  if(!reset) q<=0'b0;
	  else q<=d;
	end
	
endmodule