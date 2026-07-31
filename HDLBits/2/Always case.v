//Always case
/*create a 6-to-1 multiplexer. When sel is between 0 and 5, 
choose the corresponding data input. Otherwise, output 0. 
The data inputs and outputs are all 4 bits wide. */

module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
            0: out= data0;
            1: out= data1;
            2: out= data2;
            3: out= data3;
            4: out= data4;
            5: out= data5;
            default: out=0;
        endcase
    end

endmodule