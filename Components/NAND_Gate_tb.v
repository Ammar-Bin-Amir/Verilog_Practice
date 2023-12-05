`timescale 1ns/1ns
`include "NAND_Gate.v"

module nand_gate_tb;
    
    parameter N = 2;
    reg [N-1:0] in;
    wire out;

    nand_gate #(N) uut(in,out);

    initial begin
        $dumpfile("NAND_Gate_tb.vcd");
        $dumpvars(0,nand_gate_tb);
    end

    initial begin
        for (integer i = 0; i < 2**N; i = i + 1) begin
            #5 in = i;
        end
        #10 $finish;
    end

    initial $monitor("in=%b out=%b", in, out);

endmodule