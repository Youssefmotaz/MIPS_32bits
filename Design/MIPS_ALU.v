module MIPS_ALU (
    input wire [31:0] SrcA,
    input wire [31:0] SrcB,
    input wire [2:0] ALUControl,
    output reg [31:0] ALUResult,
    output wire Zero 
);
    always @(*) begin
        case (ALUControl)
            'b000:begin
                ALUResult = SrcA & SrcB;
            end 
            'b001:begin
                ALUResult = SrcA | SrcB;
            end
            'b010:begin
                ALUResult = SrcA + SrcB;
            end
            'b100:begin
                ALUResult = SrcA - SrcB;
            end
            'b101:begin
                ALUResult = SrcA * SrcB;
            end
            'b110:begin
                if (SrcA < SrcB) begin
                    ALUResult = 'b1;
                end
                else begin
                    ALUResult = 'b0;
                end
            end
            default: ALUResult = 'b0;
        endcase
    end

    assign Zero = (ALUResult == 'b0) ? 'b1 : 'b0;

endmodule