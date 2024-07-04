module MIPS_REG_FILE #(parameter Width = 32, parameter Depth = 32)(
    input wire clk,rst,
    input wire WE3,
    input wire [4:0] A1,
    input wire [4:0] A2,
    input wire [4:0] A3,
    input wire [Width-1:0] WD3,
    output reg [Width-1:0] RD1,
    output reg [Width-1:0] RD2
);
    reg [Width-1:0] Reg_File [0:Depth-1] ;
    integer i;

    always @(*) begin
        RD1 = Reg_File[A1];
        RD2 = Reg_File[A2];
    end
    
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            for (i = 0; i < 32 ; i = i+1 ) begin
                Reg_File[i] <= 'b0;
            end
        end 
        else if (WE3) begin
            Reg_File[A3] <= WD3;
        end
    end
endmodule