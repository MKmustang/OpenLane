`timescale 1ns / 1ps
`include "../../../include/sky130_fd_sc_hd.v"
//////////////////////////////////////////////////////////////////////////////////
// Company:  Joseph Callenes-Sloan 
// Engineer: Mark Kong 
// 
// Create Date: 05/29/2023 02:48:27 PM
// Design Name: 
// Module Name: time_domain_register
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

// 8-bit time domain register ???

module time_domain_register(
    input WE0_i,
    input WE1_i,
    input RE_i,
    input rstb_i,
    output logic carry_o,
    output out_o
    );
    
    logic carry_b;
    logic ring_oscillator_o;
    wire buffer_chain_o;
    
    /*** 
    
    BUFFER CHAIN FOR ACTUAL STORAGE CONTENTS FOR TIME DOMAIN REGISTER (TDR)
    
    ***/
    
    logic EN;
    wire ch1, ch2, ch3, ch4, ch5, ch6, ch7;
    
    assign EN = WE0_i || WE1_i || RE_i;
    assign out_o = buffer_chain_o;

    sky130_fd_sc_hd__ebufn_2 buff1 (
        .A(ring_oscillator_o),
        .Z(ch1),
        .TE_B(EN));

    sky130_fd_sc_hd__ebufn_2 buff2 (
        .A(ch1),
        .Z(ch2),
        .TE_B(EN));

    sky130_fd_sc_hd__ebufn_2 buff3 (
        .A(ch2),
        .Z(ch3),
        .TE_B(EN));

    sky130_fd_sc_hd__ebufn_2 buff4 (
        .A(ch3),
        .Z(ch4),
        .TE_B(EN));

    sky130_fd_sc_hd__ebufn_2 buff5 (
        .A(ch4),
        .Z(ch5),
        .TE_B(EN));

    sky130_fd_sc_hd__ebufn_2 buff6 (
        .A(ch5),
        .Z(ch6),
        .TE_B(EN));

    sky130_fd_sc_hd__ebufn_2 buff7 (
        .A(ch6),
        .Z(ch7),
        .TE_B(EN));

    sky130_fd_sc_hd__ebufn_2 buff8 (
        .A(ch7),
        .Z(buffer_chain_o),
        .TE_B(EN));
        
    /***
    
    MODULES 2 & 3 to support latching and refresh logic for TDR.  
    
    ***/ 
    
    ring_oscillator ring (
        .rstb(rstb_i), 
        .tsc_i(buffer_chain_o), 
        .carry_b(carry_b), 
        .RE(RE_i), 
        .ring_o(ring_oscillator_o));
    
    tdr_latch latch (
        .rstb(rstb_i),
        .clk(buffer_chain_o),
        .carry(carry_o),
        .carry_b(carry_b)); 
        
endmodule
