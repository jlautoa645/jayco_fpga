`timescale 1ns/1ps

module edge_detector_tb;

    reg clk;
    reg rst;
    reg in; 
    wire edge_pulse;

    edge_detector uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .edge_pulse(edge_pulse)
    );

    always #5 clk = ~clk;

    initial begin
        // dump waveforms
        $dumpfile("edge_detector.vcd");
        $dumpvars(0, edge_detector_tb);

        // Initialize signals
        clk = 0;
        rst = 0;
        in = 0;

        // Test reset
        rst = 1;
        #30;
        rst = 0;

        // Test edge detection
        #100;
        in = 1;
        #80;
        in = 0;
        #60;
        in = 1;
        #40;
        in = 0;
        #50; 
        in = 1;
        #30;
        in = 0;
        #10;
        in = 1;
        #10;
        in = 0;
        #1000;
        in = 1;
        #20;
        in = 0;

        // Finish simulation
        #20;
        $finish;
    end
endmodule