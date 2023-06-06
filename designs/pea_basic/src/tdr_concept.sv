`timescale 1ns / 1ps
`include "../../../include/sky130_fd_sc_hd.v"
// `include "/home/marko/MK_OpenLane/designs/time_domain_register/src/tdr_latch.sv"
// `include "/home/marko/MK_OpenLane/designs/time_domain_register/src/ring_oscillator.sv"

// 8-bit time domain register ???

module tdr_concept(
    input WE0_i,
    input WE1_i,
    input RE_i,
    input rstb_i,
    output out_o
    );
    
    logic carry_b;
    logic ring_oscillator_o;
    wire buffer_chain_o;
    
    /*** 
    
    BUFFER CHAIN FOR ACTUAL STORAGE CONTENTS FOR TIME DOMAIN REGISTER (TDR)
    
    ***/
    logic carry_o;
    logic en;
    logic invert_one, invert_two;
    wire ch1, ch2, ch3, ch4, ch5, ch6, ch7;
    wire ch8, ch9, ch10, ch11, ch12, ch13, ch14;
    wire ch15, ch16, ch17, ch18, ch19, ch20, ch21;
    wire ch22, ch23, ch24, ch25, ch26, ch27, ch28;
    wire ch29, ch30, ch31;
    
    assign en = WE0_i || WE1_i || RE_i;
    assign out_o = buffer_chain_o;

    sky130_fd_sc_hd__ebufn_2 buff1 (
        .A(ring_oscillator_o),
        .Z(ch1),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff2 (
        .A(ch1),
        .Z(ch2),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff3 (
        .A(ch2),
        .Z(ch3),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff4 (
        .A(ch3),
        .Z(ch4),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff5 (
        .A(ch4),
        .Z(ch5),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff6 (
        .A(ch5),
        .Z(ch6),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff7 (
        .A(ch6),
        .Z(ch7),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff8 (
        .A(ch7),
        .Z(ch8),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff9 (
        .A(ch8),
        .Z(ch9),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff10 (
        .A(ch9),
        .Z(ch10),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff11 (
        .A(ch10),
        .Z(ch11),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff12 (
        .A(ch11),
        .Z(ch12),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff13 (
        .A(ch12),
        .Z(ch13),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff14 (
        .A(ch13),
        .Z(ch14),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff15 (
        .A(ch14),
        .Z(ch15),
        .TE_B(en));

    assign invert_one = !ch15; 

    sky130_fd_sc_hd__ebufn_2 buff16 (
        .A(invert_one),
        .Z(ch16),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff17 (
        .A(ch16),
        .Z(ch17),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff18 (
        .A(ch17),
        .Z(ch18),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff19 (
        .A(ch18),
        .Z(ch19),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff20 (
        .A(ch19),
        .Z(ch20),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff21 (
        .A(ch20),
        .Z(ch21),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff22 (
        .A(ch21),
        .Z(ch22),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff23 (
        .A(ch22),
        .Z(ch23),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff24 (
        .A(ch23),
        .Z(ch24),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff25 (
        .A(ch24),
        .Z(ch25),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff26 (
        .A(ch25),
        .Z(ch26),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff27 (
        .A(ch26),
        .Z(ch27),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff28 (
        .A(ch27),
        .Z(ch28),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff29 (
        .A(ch28),
        .Z(ch29),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff30 (
        .A(ch29),
        .Z(ch30),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff31 (
        .A(ch30),
        .Z(ch31),
        .TE_B(en));

    sky130_fd_sc_hd__ebufn_2 buff32 (
        .A(ch31),
        .Z(invert_two),
        .TE_B(en));

    assign buffer_chain_o = !invert_two;
        
    /***
    
    MODULES 2 & 3 to support latching and refresh logic for TDR.  
    
    ***/ 

    // second buffer chain for rst_delay
    logic con0, con1, con2, con3, con4, con5, delayed_rst;

    assign con0 = rstb_i;

    buffer rst_0(
        .in(con0),
        .out(con1)
    );

    buffer rst_1(
        .in(con1),
        .out(con2)
    );

    buffer rst_2(
        .in(con2),
        .out(con3)
    );

    buffer rst_3(
        .in(con3),
        .out(con4)
    );

    buffer rst_4(
        .in(con4),
        .out(con5)
    );

    buffer rst_5(
        .in(con5),
        .out(delayed_rst)
    );

    
    ring_oscillator ring (
        .rstb(delayed_rst), 
        .tsc_i(buffer_chain_o), 
        .carry_b(carry_b), 
        .re(RE_i), 
        .ring_o(ring_oscillator_o));
    
    tdr_latch latch (
        .rstb(delayed_rst),
        .clk(buffer_chain_o),
        .carry(carry_o),
        .carry_b(carry_b)); 
        
endmodule
