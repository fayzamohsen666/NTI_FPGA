//Dff16e
/*The byte-enable inputs control whether each byte of 
the 16 registers should be written to on that cycle. 
byteena[1] controls the upper byte d[15:8], 
while byteena[0] controls the lower byte d[7:0].
resetn is a synchronous, active-low reset.*/

module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);
    
    always@(posedge clk)
        begin
            if(!resetn) q= {16{1'b0}};
            else
                begin
                  if(byteena[0])  q[7:0] <=  d[7:0];
                  if(byteena[1])  q[15:8] <=  d[15:8];
                end
        end
    
endmodule
