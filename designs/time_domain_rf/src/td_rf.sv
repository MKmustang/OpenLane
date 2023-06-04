`timescale 1ns / 1ps

module td_rf(
    input we,
    input w0,
    input w1,
    input w2,
    input fb,
    input re,
    input ra0,
    input ra1,
    input ra2,
    input rb0,
    input rb1,
    input rb2,
    output logic a,
    output logic b
);

    // initializing logic and wires for module
    logic [7:0] demux_a_arr;
    logic [7:0] demux_b_arr;
    logic [7:0] demux_2x8_arr;

    // making necessary connections below 
    demux_1x8 demux_a(
        .data_i(we),
        .sel_i({w2, w1, w0}),
        .data_o(demux_a_arr)
    );

    demux_1x8 demux_a(
        .data_i(fb),
        .sel_i({w2, w1, w0}),
        .data_o(demux_b_arr)
    );

    demux_2x8(
        .data(re),
        .a_sel({ra2, ra1, ra0}),
        .b_sel({rb2, rb1, rb0}),
        .arr(demux_2x8_arr)
    );

    // time_domain_register tdr_0(
    //     .W
    // );

endmodule
