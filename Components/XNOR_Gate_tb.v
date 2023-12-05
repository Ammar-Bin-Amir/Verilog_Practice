`timescale 1ns/1ns
`include "XNOR_Gate.v"

module xnor_gate_tb;
    
    parameter N = 2;
    reg [N-1:0] in;
    wire out;

    xnor_gate #(N) uut(in,out);

    initial begin
        $dumpfile("XNOR_Gate_tb.vcd");
        $dumpvars(0,xnor_gate_tb);
    end

    initial begin
        for (integer i = 0; i < 2**N; i = i + 1) begin
            #5 in = i;
        end
        #10 $finish;
    end

    initial $monitor("in=%b out=%b", in, out);

endmodule