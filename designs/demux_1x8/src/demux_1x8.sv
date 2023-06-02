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

module demux_1x8
    #(
        parameter N = 3 // 1 less than # of bits in data format
    )
    (
        input [N:0] data_i,
        input [2:0] sel_i,
        output logic [7:0] [N:0] data_o 
    );

    integer i;
    
    always_comb begin
        for (i = 0; i < 8; i = i + 1) begin
            data_o[i] = 4'b0000;
        end
        case (sel_i)
            3'b000: data_o[0] = data_i;
            3'b001: data_o[1] = data_i;
            3'b010: data_o[2] = data_i;
            3'b011: data_o[3] = data_i;
            3'b100: data_o[4] = data_i;
            3'b101: data_o[5] = data_i;
            3'b110: data_o[6] = data_i;
            3'b111: data_o[7] = data_i;
        endcase
    end
  
    // SVA to check that the output matches the selected input
    always @(data_i, sel_i, data_o) begin
        case(sel_i)
          3'b000: assert(data_o[0] === data_i) else $error("Assertion failed: incorrect output value");
          3'b001: assert(data_o[1] === data_i) else $error("Assertion failed: incorrect output value");
          3'b010: assert(data_o[2] === data_i) else $error("Assertion failed: incorrect output value");
          3'b011: assert(data_o[3] === data_i) else $error("Assertion failed: incorrect output value");
          3'b100: assert(data_o[4] === data_i) else $error("Assertion failed: incorrect output value");
          3'b101: assert(data_o[5] === data_i) else $error("Assertion failed: incorrect output value");
          3'b110: assert(data_o[6] === data_i) else $error("Assertion failed: incorrect output value");
          3'b111: assert(data_o[7] === data_i) else $error("Assertion failed: incorrect output value");
        endcase
    end
    
endmodule
