module top_module(
  input wire clk,
  input wire rst_clk,
  input wire rst_light,
  input wire hold,
  
  output wire [3:0] Sout
);

  
  wire modified_clk;
  clock_divider m1(clk, rst_clk, modified_clk);
  light_chaser  m2(modified_clk, rst_light, hold, Sout);
  
endmodule