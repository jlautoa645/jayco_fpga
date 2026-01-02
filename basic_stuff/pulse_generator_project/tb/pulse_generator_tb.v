`timescale 1ns/1ps

module pulse_generator_tb;

    reg clk;
    reg rst;
    wire pulse;
    wire [7:0] clk_count;
    wire [7:0] pulse_count;

    pulse_generator uut (
        .clk(clk),
        .rst(rst),
        .pulse(pulse),
        .clk_count(clk_count),
        .pulse_count(pulse_count)
    );

    always #5 clk = ~clk;

    initial begin
        // dump waveforms
        $dumpfile("pulse_generator.vcd");
        $dumpvars(0, pulse_generator_tb);

        // apply test vectors
        clk = 0;
        rst = 0;

        // Test reset
        rst = 1;
        #10;
        rst = 0;

        // Run for a number of clock cycles to observe pulse generation
        #392
        // Test reset
        rst = 1;
        #37;
        rst = 0;
        #550;

        // Finish simulation
        $finish;
    end

endmodule