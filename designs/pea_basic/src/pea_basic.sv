`timescale 1ns / 1ps

module pea_basic(
    input we_0,
    input we_1,
    input re,
    input rst,
    input [2:0] opcode,
    output logic data
);

    // tdr_one

    logic carry_b_a;
    logic ring_oscillator_o_a;
    wire buffer_chain_o_a;
    
    /*** 
    
    BUFFER CHAIN FOR ACTUAL STORAGE CONTENTS FOR TIME DOMAIN REGISTER (TDR)
    
    ***/
    logic carry_o_a;
    logic en_a;
    logic invert_one_a, invert_two_a;
    wire ch1_a, ch2_a, ch3_a, ch4_a, ch5_a, ch6_a, ch7_a;
    wire ch8_a, ch9_a, ch10_a, ch11_a, ch12_a, ch13_a, ch14_a;
    wire ch15_a, ch16_a, ch17_a, ch18_a, ch19_a, ch20_a, ch21_a;
    wire ch22_a, ch23_a, ch24_a, ch25_a, ch26_a, ch27_a, ch28_a;
    wire ch29_a, ch30_a, ch31_a;
    
    assign en_a = we_0 || re;
    // assign data = buffer_chain_o_a;

    sky130_fd_sc_hd__ebufn_2 buff1_a (
        .A(ring_oscillator_o_a),
        .Z(ch1_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff2_a (
        .A(ch1_a),
        .Z(ch2_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff3_a (
        .A(ch2_a),
        .Z(ch3_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff4_a (
        .A(ch3_a),
        .Z(ch4_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff5_a (
        .A(ch4_a),
        .Z(ch5_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff6_a (
        .A(ch5_a),
        .Z(ch6_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff7_a (
        .A(ch6_a),
        .Z(ch7_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff8_a (
        .A(ch7_a),
        .Z(ch8_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff9_a (
        .A(ch8_a),
        .Z(ch9_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff10_a (
        .A(ch9_a),
        .Z(ch10_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff11_a (
        .A(ch10_a),
        .Z(ch11_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff12_a (
        .A(ch11_a),
        .Z(ch12_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff13_a (
        .A(ch12_a),
        .Z(ch13_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff14_a (
        .A(ch13_a),
        .Z(ch14_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff15_a (
        .A(ch14_a),
        .Z(ch15_a),
        .TE_B(en_a));

    assign invert_one_a = !ch15_a; 

    sky130_fd_sc_hd__ebufn_2 buff16_a (
        .A(invert_one_a),
        .Z(ch16_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff17_a (
        .A(ch16_a),
        .Z(ch17_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff18_a (
        .A(ch17_a),
        .Z(ch18_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff19_a (
        .A(ch18_a),
        .Z(ch19_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff20_a (
        .A(ch19_a),
        .Z(ch20_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff21_a (
        .A(ch20_a),
        .Z(ch21_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff22_a (
        .A(ch21_a),
        .Z(ch22_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff23_a (
        .A(ch22_a),
        .Z(ch23_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff24_a (
        .A(ch23_a),
        .Z(ch24_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff25_a (
        .A(ch24_a),
        .Z(ch25_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff26_a (
        .A(ch25_a),
        .Z(ch26_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff27_a (
        .A(ch26_a),
        .Z(ch27_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff28_a (
        .A(ch27_a),
        .Z(ch28_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff29_a (
        .A(ch28_a),
        .Z(ch29_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff30_a (
        .A(ch29_a),
        .Z(ch30_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff31_a (
        .A(ch30_a),
        .Z(ch31_a),
        .TE_B(en_a));

    sky130_fd_sc_hd__ebufn_2 buff32_a (
        .A(ch31_a),
        .Z(invert_two_a),
        .TE_B(en_a));

    assign buffer_chain_o_a = !invert_two_a;
        
    /***
    
    MODULES 2 & 3 to support latching and refresh logic for TDR.  
    
    ***/ 

    // second buffer chain for rst_delay
    logic con0_a, con1_a, con2_a, con3_a, con4_a, con5_a, delayed_rst_a;

    assign con0_a = rst;

    buffer rst_0_a(
        .in(con0_a),
        .out(con1_a)
    );

    buffer rst_1_a(
        .in(con1_a),
        .out(con2_a)
    );

    buffer rst_2_a(
        .in(con2_a),
        .out(con3_a)
    );

    buffer rst_3_a(
        .in(con3_a),
        .out(con4_a)
    );

    buffer rst_4_a(
        .in(con4_a),
        .out(con5_a)
    );

    buffer rst_5_a(
        .in(con5_a),
        .out(delayed_rst_a)
    );

    
    ring_oscillator ring_a (
        .rstb(delayed_rst_a), 
        .tsc_i(buffer_chain_o_a), 
        .carry_b(carry_b_a), 
        .re(re), 
        .ring_o(ring_oscillator_o_a));
    
    tdr_latch latch_a (
        .rstb(delayed_rst_a),
        .clk(buffer_chain_o_a),
        .carry(carry_o_a),
        .carry_b(carry_b_a)); 

    // tdr_two

    logic carry_b_b;
    logic ring_oscillator_o_b;
    wire buffer_chain_o_b;
    
    /*** 
    
    BUFFER CHAIN FOR ACTUAL STORAGE CONTENTS FOR TIME DOMAIN REGISTER (TDR)
    
    ***/
    logic carry_o_b;
    logic en_b;
    logic invert_one_b, invert_two_b;
    wire ch1_b, ch2_b, ch3_b, ch4_b, ch5_b, ch6_b, ch7_b;
    wire ch8_b, ch9_b, ch10_b, ch11_b, ch12_b, ch13_b, ch14_b;
    wire ch15_b, ch16_b, ch17_b, ch18_b, ch19_b, ch20_b, ch21_b;
    wire ch22_b, ch23_b, ch24_b, ch25_b, ch26_b, ch27_b, ch28_b;
    wire ch29_b, ch30_b, ch31_b;
    
    assign en_b = we_0 || re;
    // assign data = buffer_chain_o_b;

    sky130_fd_sc_hd__ebufn_2 buff1_b (
        .A(ring_oscillator_o_b),
        .Z(ch1_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff2_b (
        .A(ch1_b),
        .Z(ch2_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff3_b (
        .A(ch2_b),
        .Z(ch3_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff4_b (
        .A(ch3_b),
        .Z(ch4_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff5_b (
        .A(ch4_b),
        .Z(ch5_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff6_b (
        .A(ch5_b),
        .Z(ch6_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff7_b (
        .A(ch6_b),
        .Z(ch7_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff8_b (
        .A(ch7_b),
        .Z(ch8_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff9_b (
        .A(ch8_b),
        .Z(ch9_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff10_b (
        .A(ch9_b),
        .Z(ch10_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff11_b (
        .A(ch10_b),
        .Z(ch11_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff12_b (
        .A(ch11_b),
        .Z(ch12_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff13_b (
        .A(ch12_b),
        .Z(ch13_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff14_b (
        .A(ch13_b),
        .Z(ch14_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff15_b (
        .A(ch14_b),
        .Z(ch15_b),
        .TE_B(en_b));

    assign invert_one_b = !ch15_b; 

    sky130_fd_sc_hd__ebufn_2 buff16_b (
        .A(invert_one_b),
        .Z(ch16_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff17_b (
        .A(ch16_b),
        .Z(ch17_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff18_b (
        .A(ch17_b),
        .Z(ch18_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff19_b (
        .A(ch18_b),
        .Z(ch19_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff20_b (
        .A(ch19_b),
        .Z(ch20_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff21_b (
        .A(ch20_b),
        .Z(ch21_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff22_b (
        .A(ch21_b),
        .Z(ch22_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff23_b (
        .A(ch22_b),
        .Z(ch23_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff24_b (
        .A(ch23_b),
        .Z(ch24_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff25_b (
        .A(ch24_b),
        .Z(ch25_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff26_b (
        .A(ch25_b),
        .Z(ch26_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff27_b (
        .A(ch26_b),
        .Z(ch27_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff28_b (
        .A(ch27_b),
        .Z(ch28_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff29_b (
        .A(ch28_b),
        .Z(ch29_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff30_b (
        .A(ch29_b),
        .Z(ch30_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff31_b (
        .A(ch30_b),
        .Z(ch31_b),
        .TE_B(en_b));

    sky130_fd_sc_hd__ebufn_2 buff32_b (
        .A(ch31_b),
        .Z(invert_two_b),
        .TE_B(en_b));

    assign buffer_chain_o_b = !invert_two_b;
        
    /***
    
    MODULES 2 & 3 to support latching and refresh logic for TDR.  
    
    ***/ 

    // second buffer chain for rst_delay
    logic con0_b, con1_b, con2_b, con3_b, con4_b, con5_b, delayed_rst_b;

    assign con0_b = rst;

    buffer rst_0_b(
        .in(con0_b),
        .out(con1_b)
    );

    buffer rst_1_b(
        .in(con1_b),
        .out(con2_b)
    );

    buffer rst_2_b(
        .in(con2_b),
        .out(con3_b)
    );

    buffer rst_3_b(
        .in(con3_b),
        .out(con4_b)
    );

    buffer rst_4_b(
        .in(con4_b),
        .out(con5_b)
    );

    buffer rst_5_b(
        .in(con5_b),
        .out(delayed_rst_b)
    );

    
    ring_oscillator ring_b (
        .rstb(delayed_rst_b), 
        .tsc_i(buffer_chain_o_b), 
        .carry_b(carry_b_b), 
        .re(re), 
        .ring_o(ring_oscillator_o_b));
    
    tdr_latch latch_b (
        .rstb(delayed_rst_b),
        .clk(buffer_chain_o_b),
        .carry(carry_o_b),
        .carry_b(carry_b_b)); 

    // alu 

    td_alu td_alu(
        .a(buffer_chain_o_a),
        .b(buffer_chain_o_b),
        .op_0(opcode[0]),
        .op_1(opcode[1]),
        .op_2(opcode[2]),
        .y(data)
    );

endmodule
