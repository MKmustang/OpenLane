`timescale 1ns / 1ps
// `include "buffer.sv"

// this should really just be a 2x8 decoder ...

module demux_2x8(
    input data,
    input [2:0] a_sel,
    input [2:0] b_sel,
    output logic [7:0] arr
    );

    // logic to connect buffer outs to AND gates for demux logic
    wire a_sel_0_wire;
    wire a_sel_1_wire;
    wire a_sel_2_wire;
    wire a_sel_0_not_wire;
    wire a_sel_1_not_wire;
    wire a_sel_2_not_wire;

    wire b_sel_0_wire;
    wire b_sel_1_wire;
    wire b_sel_2_wire;
    wire b_sel_0_not_wire;
    wire b_sel_1_not_wire;
    wire b_sel_2_not_wire;

    buffer a_sel_0(
        .in(a_sel[0]),
        .out(a_sel_0_wire)
    );

    buffer a_sel_0_not(
        .in(!a_sel[0]),
        .out(a_sel_0_not_wire)
    );

    buffer a_sel_1(
        .in(a_sel[1]),
        .out(a_sel_1_wire)
    );

    buffer a_sel_1_not(
        .in(a_sel[2]),
        .out(a_sel_1_not_wire)
    );

    buffer a_sel_2(
        .in(a_sel[2]),
        .out(a_sel_2_wire)
    );

    buffer a_sel_2_not(
        .in(a_sel[2]),
        .out(a_sel_2_not_wire)
    );

    // right side of demux_2x8
    buffer b_sel_0(
        .in(b_sel[0]),
        .out(b_sel_0_wire)
    );

    buffer b_sel_0_not(
        .in(b_sel[0]),
        .out(b_sel_0_not_wire)
    );

    buffer b_sel_1(
        .in(b_sel[1]),
        .out(b_sel_1_wire)
    );

    buffer b_sel_1_not(
        .in(b_sel[1]),
        .out(b_sel_1_not_wire)
    );

    buffer b_sel_2(
        .in(b_sel[2]),
        .out(b_sel_2_wire)
    );

    buffer b_sel_2_not(
        .in(b_sel[2]),
        .out(b_sel_2_not_wire)
    );

    // set up A and gates + logic 
    logic a_and_0;
    logic a_and_1;
    logic a_and_2;
    logic a_and_3;
    logic a_and_4;
    logic a_and_5;
    logic a_and_6;
    logic a_and_7;

    assign a_and_0 = (data && a_sel_0_not_wire && a_sel_1_not_wire && a_sel_2_not_wire); // 0
    assign a_and_1 = (data && a_sel_0_wire && a_sel_1_not_wire && a_sel_2_not_wire);     // 1
    assign a_and_2 = (data && a_sel_0_not_wire && a_sel_1_wire && a_sel_2_not_wire);     // 2 
    assign a_and_3 = (data && a_sel_0_wire && a_sel_1_wire && a_sel_2_not_wire);         // 3
    assign a_and_4 = (data && a_sel_0_not_wire && a_sel_1_not_wire && a_sel_2_wire);     // 4
    assign a_and_5 = (data && a_sel_0_wire && a_sel_1_not_wire && a_sel_2_wire);         // 5
    assign a_and_6 = (data && a_sel_0_not_wire && a_sel_1_wire && a_sel_2_wire);         // 6
    assign a_and_7 = (data && a_sel_0_wire && a_sel_1_wire && a_sel_2_wire);             // 7

    
    // set up B and gates + logic
    logic b_and_0;
    logic b_and_1;
    logic b_and_2;
    logic b_and_3;
    logic b_and_4;
    logic b_and_5;
    logic b_and_6;
    logic b_and_7;

    assign b_and_0 = (data && b_sel_0_not_wire && b_sel_1_not_wire && b_sel_2_not_wire); // 0
    assign b_and_1 = (data && b_sel_0_wire && b_sel_1_not_wire && b_sel_2_not_wire);     // 1
    assign b_and_2 = (data && b_sel_0_not_wire && b_sel_1_wire && b_sel_2_not_wire);     // 2 
    assign b_and_3 = (data && b_sel_0_wire && b_sel_1_wire && b_sel_2_not_wire);         // 3
    assign b_and_4 = (data && b_sel_0_not_wire && b_sel_1_not_wire && b_sel_2_wire);     // 4
    assign b_and_5 = (data && b_sel_0_wire && b_sel_1_not_wire && b_sel_2_wire);         // 5
    assign b_and_6 = (data && b_sel_0_not_wire && b_sel_1_wire && b_sel_2_wire);         // 6
    assign b_and_7 = (data && b_sel_0_wire && b_sel_1_wire && b_sel_2_wire);             // 7

    // OR gate stuff
    logic a_b_or_0;
    logic a_b_or_1;
    logic a_b_or_2;
    logic a_b_or_3;
    logic a_b_or_4;
    logic a_b_or_5;
    logic a_b_or_6;
    logic a_b_or_7;

    assign a_b_or_0 = a_and_0 || b_and_0;
    assign a_b_or_1 = a_and_1 || b_and_1;
    assign a_b_or_2 = a_and_2 || b_and_2;
    assign a_b_or_3 = a_and_3 || b_and_3;
    assign a_b_or_4 = a_and_4 || b_and_4;
    assign a_b_or_5 = a_and_5 || b_and_5;
    assign a_b_or_6 = a_and_6 || b_and_6;
    assign a_b_or_7 = a_and_7 || b_and_7;

    //final buffer pass
    wire out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7;

    buffer out_or_0(
        .in(a_b_or_0),
        .out(out_0)
    );

    buffer out_or_1(
        .in(a_b_or_1),
        .out(out_1)
    );

    buffer out_or_2(
        .in(a_b_or_2),
        .out(out_2)
    );

    buffer out_or_3(
        .in(a_b_or_3),
        .out(out_3)
    );

    buffer out_or_4(
        .in(a_b_or_4),
        .out(out_4)
    );

    buffer out_or_5(
        .in(a_b_or_5),
        .out(out_5)
    );

    buffer out_or_6(
        .in(a_b_or_6),
        .out(out_6)
    );

    buffer out_or_7(
        .in(a_b_or_7),
        .out(out_7)
    );

    // assign statements for Dual Read in RF
    assign arr = {out_7, out_6, out_5, out_4, out_3, out_2, out_1, out_0};
    // assign arr[0] = out_0;
    // assign arr[1] = out_1;
    // assign arr[2] = out_2;
    // assign arr[3] = out_3;
    // assign arr[4] = out_4;
    // assign arr[5] = out_5;
    // assign arr[6] = out_6;
    // assign arr[7] = out_7;

endmodule
