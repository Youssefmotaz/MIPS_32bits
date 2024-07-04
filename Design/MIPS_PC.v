module MIPS_PC (
    input wire [31:0] PC_IN,
    input wire clk,rst,
    output reg [31:0] PC
);
    
    always @(posedge clk or negedge rst) begin
        if(!rst)
        begin
            PC <= 'b0;
        end
        else
        begin
            PC <= PC_IN;
        end
    end
    
endmodule