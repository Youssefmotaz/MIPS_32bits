module MIPS_DATA_MEM #(parameter Width = 32 , parameter Depth = 100)(
    input wire clk,rst,
    input wire WE,
    input wire [Width-1:0] A,
    input wire [Width-1:0] WD,
    output reg [Width-1:0] RD,
    output reg [15:0] test_value
);
    reg [Width-1:0] DATA_MEM [0:Depth-1];
    integer i;

    always @(*) begin
        RD = DATA_MEM[A];
        test_value = DATA_MEM[0][15:0];
    end

    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            for (i = 0; i < 100 ; i = i+1 ) begin
                DATA_MEM[i] <= 'b0;
            end
        end 
        else if (WE) begin
            DATA_MEM[A] <= WD;
        end
    end
    
endmodule