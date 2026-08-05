module clock_divider(
  input wire before_clk,
  input wire rst,
  
  output reg after_clk
);

  integer count;
  

  always@(posedge before_clk or negedge rst)
    begin
	  if(!rst)
	    begin
		  count <= 0;
		  after_clk <= 0;
		end
	  else
	    begin
		  if(count < (8-1)) count <= count + 1;
	      else
	        begin
		      count <= 0;
		      after_clk <= ~ after_clk;
		    end  
		end
    end

endmodule	
  
  

  
