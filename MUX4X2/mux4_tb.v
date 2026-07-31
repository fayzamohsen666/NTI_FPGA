module mux4_tb;
  reg D0, D1, D2, D3, s0, s1;
  wire Y_flow, Y_struc, Y_behav, Y_gate;
  
  mux4_flow  mux1(D0, D1, D2, D3, s0, s1, Y_flow);
  mux4_struc mux2(D0, D1, D2, D3, s0, s1, Y_struc);
  mux4_gate  mux3(D0, D1, D2, D3, s0, s1, Y_gate);
  mux4_behav mux4(D0, D1, D2, D3, s0, s1, Y_behav);
  
  initial
    begin
	D0=1; D1=0; D2=0; D3=0;
	{s1, s0} = 0;
	#10
	D0=0; D1=1; D2=0; D3=0;
	{s1, s0} = 1;
	#10
	D0=0; D1=0; D2=1; D3=0;
	{s1, s0} = 2;
	#10
	D0=0; D1=0; D2=0; D3=1;
	{s1, s0} = 3;
	#10
	$stop;
	end
	
endmodule