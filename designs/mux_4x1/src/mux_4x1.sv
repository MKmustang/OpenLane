`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2023 10:29:04 PM
// Design Name: 
// Module Name: 4x1_mux
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


module mux_4x1(
    input [3:0]array_i,
    input [1:0]sel_i,
    output logic out_o
    );
    
    always @ (array_i || sel_i) begin
        case (sel_i)
            2'b00: out_o = array_i[0];
            2'b01: out_o = array_i[1];
            2'b10: out_o = array_i[2];
            2'b11: out_o = array_i[3];
        endcase
    end
    
    // SVA to check that the output matches the selected input
    // always @(sel_i, array_i) begin
    //     case (sel_i)
    //         2'b00: assert (out_o === array_i[0]) else $error("Assertion failed: incorrect output value");
    //         2'b01: assert (out_o === array_i[1]) else $error("Assertion failed: incorrect output value");
    //         2'b10: assert (out_o === array_i[2]) else $error("Assertion failed: incorrect output value");
    //         2'b11: assert (out_o === array_i[3]) else $error("Assertion failed: incorrect output value");
    //     endcase
    // end
    
endmodule