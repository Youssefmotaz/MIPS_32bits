module MIPS_INSTR_MEM #(parameter Width = 32 , parameter Depth = 100) (
    input wire [Width-1:0] PC,
    output wire [Width-1:0] Instr
);
    reg [Width-1:0] ROM [0:Depth-1];

 /*   initial 
      begin
        $readmemh("D:\Digital\Digital\IEEE\MIPS\Test Programs\Program2.txt",INSTR_MEM);
      end
 */     
    assign Isntr = ROM [PC>>2];

endmodule