`timescale 1ns/1ps

module edge_detector (
    input wire clk,
    input wire rst,
    input wire in,
    output reg edge_pulse
);

    reg[1:0] input_history;

    always @(posedge clk) begin
        input_history = {input_history[0], in};
        if (rst) begin
            edge_pulse <= 0;
            input_history[0] <= in;
            input_history[1] <= in;
        end else begin
            if (input_history == 2'b01) begin
                edge_pulse <= 1;
            end else if (input_history == 2'b10) begin
                edge_pulse <= 0;
            end else begin
                edge_pulse <= 0;
            end
        end
    end
endmodule