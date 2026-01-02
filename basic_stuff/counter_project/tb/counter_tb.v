`timescale 1ns/1ps

module counter_tb;

    reg clk;
    reg rst;
    reg valid;
    wire [7:0] count;

    counter uut (
        .clk(clk),
        .rst(rst),
        .valid(valid),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        // dump waveforms
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_tb);

        // Initialize signals
        clk = 0;
        rst = 0;
        valid = 0;

        // Test reset
        rst = 1;
        #10;
        rst = 0;

        // Test counting
        valid = 1;
        #100;
        valid = 0;
        #100;
        valid = 1;
        #50;

        // Finish simulation
        #10;
        $finish;
    end

endmodule