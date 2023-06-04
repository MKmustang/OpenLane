`timescale 1ns / 1ps

module buffer (
    input wire in,
    output wire out,
    input wire Gnd,  // GND
    input wire Vdd   // VDD
);

  assign out = in;

  // Pull-down resistor
  assign out = (Gnd == 1'b0) ? 1'bz : out;

  // Pull-up resistor
  assign out = (Vdd == 1'b0) ? 1'bz : out;

endmodule
