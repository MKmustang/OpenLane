`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2023 10:29:04 PM
// Design Name: 
// Module Name: mux_4x1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module demux_1x16
    #(
        parameter N = 3 // 1 less than # of bits in data format
    )
    (
        input [N:0] data_i,
        input [3:0] sel_i,
        output logic [15:0] [N:0] data_o
    );

    integer i;
    
    always_comb begin
        for (i = 0; i < 16; i = i + 1) begin
            data_o[i] = 4'b0000;
        end
        case (sel_i)
            4'b0000: data_o[0] = data_i;
            4'b0001: data_o[1] = data_i;
            4'b0010: data_o[2] = data_i;
            4'b0011: data_o[3] = data_i;
            4'b0100: data_o[4] = data_i;
            4'b0101: data_o[5] = data_i;
            4'b0110: data_o[6] = data_i;
            4'b0111: data_o[7] = data_i;
            4'b1000: data_o[8] = data_i;
            4'b1001: data_o[9] = data_i;
            4'b1010: data_o[10] = data_i;
            4'b1011: data_o[11] = data_i;
            4'b1100: data_o[12] = data_i;
            4'b1101: data_o[13] = data_i;
            4'b1110: data_o[14] = data_i;
            4'b1111: data_o[15] = data_i;
        endcase
    end
    
    // SVA to check that the output matches the selected input
    // always @(data_i, sel_i, data_o) begin
    //     case(sel_i)
    //       4'b0000: assert(data_o[0] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b0001: assert(data_o[1] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b0010: assert(data_o[2] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b0011: assert(data_o[3] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b0100: assert(data_o[4] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b0101: assert(data_o[5] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b0110: assert(data_o[6] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b0111: assert(data_o[7] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b1000: assert(data_o[8] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b1001: assert(data_o[9] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b1010: assert(data_o[10] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b1011: assert(data_o[11] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b1100: assert(data_o[12] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b1101: assert(data_o[13] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b1110: assert(data_o[14] === data_i) else $error("Assertion failed: incorrect output value");
    //       4'b1111: assert(data_o[15] === data_i) else $error("Assertion failed: incorrect output value");
    //     endcase
    // end
    
endmodule