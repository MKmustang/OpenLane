`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 11:42:13 AM
// Design Name: 
// Module Name: ring_oscillator
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


module ring_oscillator(
    input rstb,
    input tsc_i,
    input carry_b,
    input RE,
    output logic ring_o
    );
    
    logic ring_ctrl;
    logic first_and; 
    logic second_and;
    
    always @* begin
        ring_ctrl = rstb && ~RE;
        first_and = !(ring_ctrl && tsc_i);
        second_and = !(first_and && carry_b);
        ring_o = !(second_and);
    end
    
endmodule
