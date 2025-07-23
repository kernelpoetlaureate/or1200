module clock_generator ;
    reg clk;

    initial begin
        clk = 0; // Initialize clock to 0
    end

    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units (10 time units for a full cycle)
    end
endmodule