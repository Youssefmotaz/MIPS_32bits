`timescale 1ns / 1ps

module mips_testbench;

// Inputs
reg clk;
reg rst;

// Outputs
wire [15:0] test_value;

// Instantiate the MIPS processor (Assuming the top module name is 'MIPS_Top')
TOP_Module uut (
    .CLK(clk),
    .RST(rst),
    .test_value(test_value)
);

// Clock Generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100 MHz clock
end

// Simulation procedure
initial begin
    // Load and test GCD program
    $display("Loading GCD Program...");
    $readmemh("D:/Digital/Digital/IEEE/MIPS/Test Programs/Program1.txt", uut.U0_InstructionMemory.ROM);
    rst = 1;
    #10
    rst = 0; 
    #20
    rst = 1;

    // Wait for the GCD program to finish
    wait(test_value == 16'd60);
    #10
    $display("GCD Program completed with result: %d", test_value);
/*
    // Load and test Factorial program
    $display("Loading Factorial Program...");
    $readmemh("D:/Digital/Digital/IEEE/MIPS/Test Programs/Program3.txt", uut.MIPS_INSTR_MEM_Top.INSTR_MEM);
    rst = 1; #10; rst = 0;  // Apply reset to start execution

    // Wait for the Factorial program to finish
    wait(test_value == 16'd5040);
    $display("Factorial Program completed with result: %d", test_value);
*/
    $finish;  // End the simulation
end

endmodule
