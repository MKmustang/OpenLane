`timescale 1ns / 1ps

module pe(
    input [2:0] w,
    input [2:0] ra,
    input [2:0] rb,
    input [2:0] src,
    input [2:0] op,
    input north,
    input south,
    input east,
    input west,
    input imm, 
    input re, 
    input rst, 
    input fb,
    output logic data
);

    // sub modules below
    logic mux_out; 

    mux_8x1 mux(
        .array_i({2'b00, imm, data, east, west, south, north}),
        .sel_i(src),
        .out_o(mux_out)
    );

    logic td_rf_a_out;
    logic td_rf_b_out;

    td_rf td_rf(
        .we(mux_out),
        .w0(w[0]),
        .w1(w[1]),
        .w2(w[2]),
        .fb(1'b0),
        .re(re),
        .ra0(ra[0]),
        .ra1(ra[1]),
        .ra2(ra[2]),
        .rb0(rb[0]),
        .rb1(rb[1]),
        .rb2(rb[2]),
        .rst(rst),
        .a(td_rf_a_out),
        .b(td_rf_b_out)
    );

    td_alu td_alu(
        .a(td_rf_a_out),
        .b(td_rf_b_out),
        .op_0(op[0]),
        .op_1(op[1]),
        .op_2(op[2]),
        .y(data)
    );

endmodule
