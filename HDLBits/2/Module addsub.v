//Module addsub
/*An adder-subtractor can be built from an adder by optionally negating one of the inputs,
 which is equivalent to inverting the input then adding 1. 
 The net result is a circuit that can do two operations: (a + b + 0) and (a + ~b + 1).*/

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout_cin;
    wire [31:0] xor_out;
    
    assign xor_out= b ^ {32{sub}};
        
    add16 m1(a [15:0], xor_out [15:0], sub, sum [15:0], cout_cin);
    add16 m2(a [31:16], xor_out[31:16], cout_cin, sum [31:16]);


endmodule