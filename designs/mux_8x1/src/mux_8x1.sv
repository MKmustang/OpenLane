`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2023 10:29:04 PM
// Design Name: 
// Module Name: 8x1_mux
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


module mux_8x1(
    input [7:0]array_i,
    input [2:0]sel_i,
    output logic out_o
    );
    
    always @ (array_i || sel_i) begin
        case (sel_i)
            3'b000: out_o = array_i[0];
            3'b001: out_o = array_i[1];
            3'b010: out_o = array_i[2];
            3'b011: out_o = array_i[3];
            3'b100: out_o = array_i[4];
            3'b101: out_o = array_i[5];
            3'b110: out_o = array_i[6];
            3'b111: out_o = array_i[7];
            default: out_o = 0;
        endcase
    end
    
    // SVA to check that the output matches the selected input
    // always @(array_i, sel_i, out_o) begin
    //     case(sel_i)
    //       3'b000: assert(out_o === array_i[0]) else $error("Assertion failed: incorrect output value");
    //       3'b001: assert(out_o === array_i[1]) else $error("Assertion failed: incorrect output value");
    //       3'b010: assert(out_o === array_i[2]) else $error("Assertion failed: incorrect output value");
    //       3'b011: assert(out_o === array_i[3]) else $error("Assertion failed: incorrect output value");
    //       3'b100: assert(out_o === array_i[4]) else $error("Assertion failed: incorrect output value");
    //       3'b101: assert(out_o === array_i[5]) else $error("Assertion failed: incorrect output value");
    //       3'b110: assert(out_o === array_i[6]) else $error("Assertion failed: incorrect output value");
    //       3'b111: assert(out_o === array_i[7]) else $error("Assertion failed: incorrect output value");
    //     endcase
    // end
    
endmodule
