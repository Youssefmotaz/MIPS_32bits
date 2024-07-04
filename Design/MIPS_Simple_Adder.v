module MIPS_Simple_Adder (
    input wire [31:0] A,
    input wire [31:0] B,
    output wire [31:0] C
);
    
    assign C = A+B;
    
endmodule