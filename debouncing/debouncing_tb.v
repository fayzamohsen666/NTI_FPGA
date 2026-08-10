`timescale 1ns/1ps
module debouncing_tb;
  parameter WAITING_TIME=100;
  
  reg clk;
  reg reset;
  reg sw;
  reg m_tick;
  wire dp;
  
  debouncing #(.WAITING_TIME(WAITING_TIME)) m(.*);
  
  always #20 clk = ~ clk;

  
  initial
    begin
	  clk=1'b0;
	  reset=1'b0;
	  sw=1'b0;
	  m_tick=1'b0;
	  
	  #1; 
	  reset=1'b1;
	  sw=1;
	  
	  #WAITING_TIME; m_tick=1'b1;
	  #40; m_tick=1'b0;
	  
	  #(WAITING_TIME-40); m_tick=1'b1;
	  #40; m_tick=1'b0; 
	  
	  #5; sw=1'b0;
	  
	  #25; sw=1'b1;
	  
	  #(WAITING_TIME-70); m_tick=1'b1;
	  #40; m_tick=1'b0;
	  
	  #(WAITING_TIME-40); m_tick=1'b1;
	  #40; m_tick=1'b0;
	  
	  #(WAITING_TIME-40); m_tick=1'b1;
	  #40; m_tick=1'b0;
	  
	  #20; sw=1'b0;
	  
	  #(WAITING_TIME-60); m_tick=1'b1;
	  #40; m_tick=1'b0;
	  
	  #5; sw=1'b1;
	  
	  #25; sw=1'b0;
	  
	  #(WAITING_TIME-70); m_tick=1'b1;
	  #40; m_tick=1'b0;
	  
	  #(WAITING_TIME-40); m_tick=1'b1;
	  #40; m_tick=1'b0;
	  
	  #(WAITING_TIME-40); m_tick=1'b1;
	  #40; m_tick=1'b0;
	  
	  #(WAITING_TIME-40); m_tick=1'b1;
	  #40; m_tick=1'b0;
	  
	  #5; $stop;
	  
	end
	
endmodule
  