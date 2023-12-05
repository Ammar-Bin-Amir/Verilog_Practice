`timescale 1ns/1ns
`include "NOR_Gate.v"

module nor_gate_tb;
    
    parameter N = 2;
    reg [N-1:0] in;
    wire out;

    nor_gate #(N) uut(in,out);

    initial begin
        $dumpfile("NOR_Gate_tb.vcd");
        $dumpvars(0,nor_gate_tb);
    end

    initial begin
        for (integer i = 0; i < 2**N; i = i + 1) begin
            #5 in = i;
        end
        #10 $finish;
    end

    initial $monitor("in=%b out=%b", in, out);

endmodule