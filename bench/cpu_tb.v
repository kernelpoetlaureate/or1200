`timescale 1ns / 1ps

module cpu_tb;

    // Clock and Reset
    reg clk;
    reg rst;
    integer i;  // Moved integer declaration here

    // Instruction Memory Interface
    wire [31:0] imem_addr;
    wire        imem_re_i; // Instruction Memory Read Enable
    reg  [31:0] imem_rdata_i;

    // Data Memory Interface
    wire [31:0] dmem_addr;
    wire        dmem_re_i; // Data Memory Read Enable
    wire        dmem_we_i; // Data Memory Write Enable
    wire [31:0] dmem_wdata_i;
    reg  [31:0] dmem_rdata_i;

    // Internal Memory Models
    reg [31:0] imem [0:1023]; // 1024 words (4KB) for instructions
    reg [31:0] dmem [0:1023]; // 1024 words (4KB) for data

    // Output ports required by or1200_cpu
    wire abort_mvspr;
    wire abort_ex;

    // Instantiate your OpenRISC CPU
    or1200_cpu cpu_inst (
        .clk(clk),
        .rst(rst),
        // Add other connections here as needed, matching the actual port names
        .abort_mvspr(abort_mvspr),
        .abort_ex(abort_ex)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period (100 MHz clock)
    end

    // Reset sequence and Instruction Memory Loading
    initial begin
        rst = 1;
        $readmemh("bench/test_addi_pipeline.mem", imem); // Updated path to ensure correct file location
        for (i = 0; i < 1024; i = i + 1) begin
            dmem[i] = 0;
        end

        #20 rst = 0; // De-assert reset after a few clock cycles

        #500 $finish; // Simulate for 500ns then finish
    end

    // Instruction Memory Logic
    always @(posedge clk) begin
        if (imem_re_i) begin
            imem_rdata_i <= imem[imem_addr[11:2]];
        end
    end

    // Data Memory Logic
    always @(posedge clk) begin
        if (dmem_re_i) begin
            dmem_rdata_i <= dmem[dmem_addr[11:2]];
        end else if (dmem_we_i) begin
            dmem[dmem_addr[11:2]] <= dmem_wdata_i;
        end
    end

    // Dump waveforms (for GTKWave)
    initial begin
        $dumpfile("cpu_tb.vcd");
        $dumpvars(0, cpu_inst);
    end

endmodule
