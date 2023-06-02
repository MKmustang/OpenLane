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

module demux_1x4
    #(
        parameter N = 3 // 1 less than # of bits in data format
    )
    (
        input [N:0] data_i,
        input [1:0] sel_i,
        output logic [3:0] [N:0] data_o
    );

    integer i;
    
    always_comb begin
        for (i = 0; i < 4; i = i + 1) begin
            data_o[i] = 4'b0000;
        end
        case (sel_i)
            2'b00: data_o[0] = data_i;
            2'b01: data_o[1] = data_i;
            2'b10: data_o[2] = data_i;
            2'b11: data_o[3] = data_i;
        endcase
    end
    
    // SVA to check that the output matches the selected input
    always @(*) begin
        case (sel_i)
            2'b00: assert (data_o[0] === data_i) else $error("Assertion failed: incorrect output value");
            2'b01: assert (data_o[1] === data_i) else $error("Assertion failed: incorrect output value");
            2'b10: assert (data_o[2] === data_i) else $error("Assertion failed: incorrect output value");
            2'b11: assert (data_o[3] === data_i) else $error("Assertion failed: incorrect output value");
        endcase
    end
    
endmodule