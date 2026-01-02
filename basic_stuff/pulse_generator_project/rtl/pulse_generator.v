`timescale 1ns/1ps

// goal: write a pulse generator that generates a pulse of width 1 cycle every N cycles

module pulse_generator (
    input wire clk,
    input wire rst,
    output reg pulse,
    output reg[7:0] clk_count,
    output reg[7:0] pulse_count
);

    // parameter to set the pulse interval
    parameter N = 10;

    // main logic
    always @(posedge clk) begin
        pulse <= 0;
        if (rst) begin
            clk_count <= 0;
            pulse_count <= 0;
            pulse <= 0;
        end else begin
            if (clk_count == N - 1) begin
                pulse <= 1;
                pulse_count <= pulse_count + 1;
                clk_count <= 0;
            end else begin
                pulse <= 0;
                clk_count <= clk_count + 1;
            end
        end
    end 

endmodule