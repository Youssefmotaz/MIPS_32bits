module MIPS_CU (
    input wire [5:0] Opcode,
    input wire [5:0] Func,
    output reg memtoReg,
    output reg memWrite,
    output reg Branch,
    output reg aluSrc,
    output reg regDest,
    output reg regWrite,
    output reg jump,
    output reg [2:0] ALUControl	 
);
    reg [1:0] ALUOp;
    
    always @(*) begin
        memtoReg = 'b0;
        memWrite = 'b0;
        Branch = 'b0;
        aluSrc = 'b0;
        regDest = 'b0;
        regWrite = 'b0;
        ALUOp = 'b0;
        jump = 'b0;
        case (Opcode)
            'b00_0000:begin
                regDest = 'b1;
                regWrite = 'b1;
                ALUOp = 'b10;
            end
            'b00_0010:begin
                jump = 'b1;
            end
            'b00_0100:begin
                Branch = 'b1;
                ALUOp = 'b01;
            end
            'b00_1000:begin
                regWrite = 'b1;
                aluSrc = 'b1;
            end
            'b10_0011:begin
                regWrite = 'b1;
                aluSrc = 'b1;
                memtoReg = 'b1;
            end
            'b10_1011:begin
                memWrite = 'b1;
                aluSrc = 'b1;
                memtoReg = 'b1;
            end
            default: begin
                memtoReg = 'b0;
                memWrite = 'b0;
                Branch = 'b0;
                aluSrc = 'b0;
                regDest = 'b0;
                regWrite = 'b0;
                ALUOp = 'b0;
                jump = 'b0;
            end
        endcase
        
        case (ALUOp)
            'b00:begin
                ALUControl = 'b010;
            end
            'b01:begin
                ALUControl = 'b100;
            end
            'b10:begin
                case (Func)
                    'b10_0000:begin
                        ALUControl = 'b010;
                    end 
                    'b10_0010:begin
                        ALUControl = 'b100;
                    end
                    'b10_1010:begin
                        ALUControl = 'b110;
                    end
                    'b01_1100:begin
                        ALUControl = 'b101;
                    end
                    default:begin
                        ALUControl = 'b010;
                    end
                endcase
            end
            default: begin
                ALUControl = 'b010;
            end
        endcase
    end
endmodule