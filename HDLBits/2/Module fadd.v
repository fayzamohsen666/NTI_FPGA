//Module fadd

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    
    wire cout_cin;
    add16 m1(a [15:0], b [15:0], 0, sum [15:0], cout_cin);
    add16 m2(a [31:16], b [31:16], cout_cin, sum [31:16]);
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign {cout, sum} = a + b + cin;

endmodule