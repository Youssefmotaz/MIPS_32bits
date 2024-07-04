module MIPS_Simple_MUX #(parameter Width = 32)(
    input wire [Width-1:0] in1,
    input wire [Width-1:0] in2,
    input wire sel,
    output wire [Width-1:0] out
);
    assign out = (sel) ? in1 : in2;
    
endmodule