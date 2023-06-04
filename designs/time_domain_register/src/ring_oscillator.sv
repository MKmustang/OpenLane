`timescale 1ns / 1ps

module ring_oscillator(
    input rstb,
    input tsc_i,
    input carry_b,
    input re,
    output logic ring_o
    );
    
    logic ring_ctrl;
    logic first_and; 
    logic second_and;
    
    always @* begin
        ring_ctrl = rstb && ~re;
        first_and = !(ring_ctrl && tsc_i);
        second_and = !(first_and && carry_b);
        ring_o = !(second_and);
    end
    
endmodule
