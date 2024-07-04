module MIPS_Shifter #(parameter Width = 32)(
    input wire [Width-1:0] In,
    output wire [Width-1:0] Out
);
    assign Out = In << 2;
    
endmodule