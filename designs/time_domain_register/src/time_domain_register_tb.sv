`timescale 1ns / 1ps
`include "/home/marko/MK_OpenLane/designs/time_domain_register/src/time_domain_register.sv"

module time_domain_register_tb;

    // include libraries if TB needs it

    // declare signals for DUT
    logic WE0_i;
    logic WE1_i;
    logic RE_i;
    logic rstb_i;
    logic carry_o;
    logic out_o;

    // DUT - tdr
    time_domain_register dut(
        .WE0_i(WE0_i),
        .WE1_i(WE1_i),
        .RE_i(RE_i),
        .rstb_i(rstb_i),
        .carry_o(carry_o),
        .out_o(out_o));

    initial begin
        // reset phase -
        WE0_i = 1'b0;
        WE1_i = 1'b0;
        RE_i = 1'b0;
        rstb_i = 1'b0;

        #5; // write phase - t0 = 5ns 
        WE0_i = 1'b1; // Write enable on for 2.5ns --> T0 = 2.5ns
        WE1_i = 1'b0;
        RE_i = 1'b0;
        rstb_i = 1'b1;

        #2.5;
        WE0_i = 1'b0; 
        
        #2.5;
        WE1_i = 1'b1;

        #2.5;
        WE1_i = 1'b0;

        // write phase is done -> begin reading
        // reading phase

        #5;

        RE_i = 1'b1;

        #10;
        RE_i = 1'b0;

        // ending simulation
        $finish;

    end 

    // more tb code.

endmodule

