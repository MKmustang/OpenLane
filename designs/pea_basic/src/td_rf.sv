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
    input rst, 
    output logic a,
    output logic b
);

    // initializing logic and wires for module
    logic [7:0] demux_we_arr;
    logic [7:0] demux_fb_arr;
    logic [7:0] demux_2x8_arr;

    // making necessary connections below 
    demux_1x8 demux_we(
        .data_i(we),
        .sel_i({w2, w1, w0}),
        .data_o(demux_we_arr)
    );

    // instantiating but not connecting this to TDRs
    demux_1x8 demux_fb(
        .data_i(fb),
        .sel_i({w2, w1, w0}),
        .data_o(demux_fb_arr)
    );

    demux_2x8 read_en(
        .data(re),
        .a_sel({ra2, ra1, ra0}),
        .b_sel({rb2, rb1, rb0}),
        .arr(demux_2x8_arr)
    );

    // wires between tdrs & buffers
    wire [7:0] re_arr;

    // buffer to increase drive signal strength
    buffer b0(
        .in(demux_2x8_arr[0]),
        .out(re_arr[0])
    );

    buffer b1(
        .in(demux_2x8_arr[1]),
        .out(re_arr[1])
    );

    buffer b2(
        .in(demux_2x8_arr[2]),
        .out(re_arr[2])
    );

    buffer b3(
        .in(demux_2x8_arr[3]),
        .out(re_arr[3])
    );

    buffer b4(
        .in(demux_2x8_arr[4]),
        .out(re_arr[4])
    );

    buffer b5(
        .in(demux_2x8_arr[5]),
        .out(re_arr[5])
    );

    buffer b6(
        .in(demux_2x8_arr[6]),
        .out(re_arr[6])
    );

    buffer b7(
        .in(demux_2x8_arr[7]),
        .out(re_arr[7])
    );

    // time_domain_registers assuming no feedback input. 
    wire [7:0] td_out;

    time_domain_register tdr_0(
        .WE0_i(demux_we_arr[0]),
        .WE1_i(demux_we_arr[0]),
        .RE_i(re_arr[0]),
        .rstb_i(rst),
        // .carry_o(),
        .out_o(td_out[0])
    );

    time_domain_register tdr_1(
        .WE0_i(demux_we_arr[1]),
        .WE1_i(demux_we_arr[1]),
        .RE_i(re_arr[1]),
        .rstb_i(rst),
        .out_o(td_out[1])
    );

    time_domain_register tdr_2(
        .WE0_i(demux_we_arr[2]),
        .WE1_i(demux_we_arr[2]),
        .RE_i(re_arr[2]),
        .rstb_i(rst),
        .out_o(td_out[2])
    );

    time_domain_register tdr_3(
        .WE0_i(demux_we_arr[3]),
        .WE1_i(demux_we_arr[3]),
        .RE_i(re_arr[3]),
        .rstb_i(rst),
        .out_o(td_out[3])
    );

    time_domain_register tdr_4(
        .WE0_i(demux_we_arr[4]),
        .WE1_i(demux_we_arr[4]),
        .RE_i(re_arr[4]),
        .rstb_i(rst),
        .out_o(td_out[4])
    );

    time_domain_register tdr_5(
        .WE0_i(demux_we_arr[5]),
        .WE1_i(demux_we_arr[5]),
        .RE_i(re_arr[5]),
        .rstb_i(rst),
        .out_o(td_out[5])
    );

    time_domain_register tdr_6(
        .WE0_i(demux_we_arr[6]),
        .WE1_i(demux_we_arr[6]),
        .RE_i(re_arr[6]),
        .rstb_i(rst),
        .out_o(td_out[6])
    );

    time_domain_register tdr_7(
        .WE0_i(demux_we_arr[7]),
        .WE1_i(demux_we_arr[7]),
        .RE_i(re_arr[7]),
        .rstb_i(rst),
        .out_o(td_out[7])
    );

    // muxes and output for this unit (seen as top level)
    mux_8x1 a_mux(
        .array_i(td_out),
        .sel_i({ra2, ra1, ra0}),
        .out_o(a)
    );

    mux_8x1 b_mux(
        .array_i(td_out),
        .sel_i({rb2, rb1, rb0}),
        .out_o(b)
    );

endmodule
