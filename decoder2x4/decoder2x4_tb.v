module decoder2x4_tb;
  reg A;
  reg B;
  reg En;
  
  wire [3:0] F;
  
  decoder2x4 m1(A, B, En, F);
  
  
  initial
    begin
	  En=1;
	  #10;
	  {B,A}=2'b00;
	  #10;
	  {B,A}=2'b01;
	  #10;
	  {B,A}=2'b10;
	  #10;
	  {B,A}=2'b11;
	  #10;
          En=0;
          #10;
	  $stop;
     end

endmodule