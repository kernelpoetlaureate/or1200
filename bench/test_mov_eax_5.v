`timescale 1ns / 1ps

module test_mov_eax_5;
    reg clk;
    reg rst;

    // Instantiate the CPU module
    or1200_cpu uut (
        .clk(clk),
        .rst(rst)
        // Removed eax connection as it is not a port of or1200_cpu
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period (100 MHz)
    end

    // Test sequence
    initial begin
        // Initialize reset
        rst = 1; // Assert reset
        #10;     // Hold reset for 10ns (1 clock cycle)
        rst = 0; // De-assert reset

        // Wait for some cycles to simulate execution
        #20; // Reduced from 50ns to 20ns for smaller VCD output

        // Finish simulation
        #10; // Small delay before finishing
        $finish;
    end

    // Add waveform generation
    initial begin
        $dumpfile("test_mov_eax_5.vcd"); // Specify the output VCD file
        $dumpvars(1, uut); // Dump only top-level signals of the CPU module
    end
endmodule
