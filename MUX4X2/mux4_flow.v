//dataflow
module mux4_flow(
  input D0, D1, D2, D3, s0, s1, 
  output Y
);

assign Y= ({s1,s0} == 0) ? D0 :
          ({s1,s0} == 1) ? D1 :
		  ({s1,s0} == 2) ? D2 : D3;
		  
endmodule