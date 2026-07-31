//Vector5
/* The output should be 1 if the two bits being compared are equal.
The top vector is a concatenation of 5 repeats of each input
The bottom vector is 5 repeats of a concatenation of the 5 inputs*/

module top_module (
    input a, b, c, d, e,
    output [24:0] out );//
    
    wire [24:0] vector1= { {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};
    wire [24:0] vector2= {5{a,b,c,d,e}};
    
    assign out = (~vector1) ^ vector2; 

endmodule
