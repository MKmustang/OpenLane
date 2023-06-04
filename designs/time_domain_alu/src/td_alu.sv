`timescale 1ns / 1ps
`include "buffer.sv"
`include "mux_8x1.sv"

module td_alu(
    input a,
    input b,
    input op_0,
    input op_1,
    input op_2,
    output y
    );

    logic Gnd = 0;
    logic Vdd = 1;

    // wires between buffers and digital gates 
    wire a_min_max;
    wire b_min_max;

    wire a_cmp_sub;
    wire b_cmp_sub;

    wire just_a;
    wire just_b;

    buffer buffer_min_max_1(
        .in(a),
        .out(a_min_max),
        .Gnd(Gnd),
        .Vdd(Vdd)
    );

    buffer buffer_min_max_2(
        .in(b),
        .out(b_min_max),
        .Gnd(Gnd),
        .Vdd(Vdd)
    );

    buffer buffer_cmp_sub_1(
        .in(a),
        .out(a_cmp_sub),
        .Gnd(Gnd),
        .Vdd(Vdd)
    );

    buffer buffer_cmp_sub_2(
        .in(b),
        .out(b_cmp_sub),
        .Gnd(Gnd),
        .Vdd(Vdd)
    );

    buffer buffer_a(
        .in(a),
        .out(just_a),
        .Gnd(Gnd),
        .Vdd(Vdd)
    );

    buffer buffer_b(
        .in(b),
        .out(just_b),
        .Gnd(Gnd),
        .Vdd(Vdd)
    );

    // logic variables for TD operations
    logic max;
    logic min;
    logic cmp;
    logic sub;
    logic cmp_wire_mid;
    wire cmp_wire_out;

    assign cmp_wire_out = cmp_wire_mid || a_cmp_sub;
    assign cmp_wire_mid = b_cmp_sub || cmp_wire_out;
    assign max = a_min_max || b_min_max;
    assign min = a_min_max && b_min_max;
    assign cmp = !(cmp_wire_out);
    assign sub = a_cmp_sub ^^ b_cmp_sub;

    // plugging into the mux
    logic [7:0] arr;
    logic [2:0] sel;
    logic out;

    assign arr = {Gnd, Gnd, just_b, just_a, sub, cmp, min, max};
    assign sel = {op_2, op_1, op_0};

    mux_8x1 mux(
        .array_i(arr),
        .sel_i(sel),
        .out_o(out)
    );

    // last buffer to boost signal before output
    buffer buffer_out(
        .in(out),
        .out(y),
        .Gnd(Gnd),
        .Vdd(Vdd)
    );

endmodule
