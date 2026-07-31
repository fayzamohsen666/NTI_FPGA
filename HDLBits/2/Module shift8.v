//Module shift8

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] out1, out2, out3;
    my_dff8 m1(clk, d, out1);
    my_dff8 m2(clk, out1, out2);
    my_dff8 m3(clk, out2, out3);
    
    always@(*)
        begin
            case(sel)
                0:q=d;
                1:q=out1;
                2:q=out2;
                3:q=out3;
            endcase
        end
endmodule
