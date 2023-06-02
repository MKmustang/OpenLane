`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 12:13:06 PM
// Design Name: 
// Module Name: tdr_latch
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


module tdr_latch(
    input rstb,
    input clk, 
    output logic carry,
    output logic carry_b
    );
    
    logic q;
    
    always_ff @ (posedge clk or negedge rstb) begin
        if (rstb == 0) begin
            q <= 1'b0;
        end
        else begin
            q <= 1'b1;
        end
    end
    
    assign carry = q;
    assign carry_b = ~q;
    
endmodule
