`timescale 1ns/1ps

module counter (
    input wire clk,
    input wire rst,
    input wire valid,
    output reg[7:0] count
);

    always @(posedge clk) begin
        if (rst) begin
            count <= 8'd0;
        end else if (valid) begin
            count <= count + 8'd1;
        end
    end

endmodule