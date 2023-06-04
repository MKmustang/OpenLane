`timescale 1ns / 1ps

module tdr_latch(
    input rstb,
    input clk, 
    output logic carry,
    output logic carry_b
    );
    
    logic q;
    
    always @ (posedge clk) begin
        if (!rstb) begin
            q <= 1'b0;
        end
        else begin
            q <= 1'b1;
        end
    end
    
    assign carry = q;
    assign carry_b = ~q;

    
endmodule
