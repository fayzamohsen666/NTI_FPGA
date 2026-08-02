module d_ff_async(
  input wire d,
  input wire clk,
  input wire reset, //active high & Asynchronous reset
  
  output reg q
);

  always@(posedge clk or posedge reset)
    begin
	  if(reset) q<=0'b0;
	  else q<=d;
	end
	
endmodule