`timescale 1ns/1ns
`include "AND_Gate.v"

module and_gate_tb;

    parameter N = 2;
    reg [N-1:0] in;
    wire out;

    and_gate #(N) uut(in,out);

    initial begin
        $dumpfile("AND_Gate_tb.vcd");
        $dumpvars(0,and_gate_tb);
    end

    initial begin
       for (integer i = 0; i < 2**N; i = i + 1) begin
        #5 in = i;
       end
       #10 $finish;
    end

    initial $monitor("in=%b out=%b", in, out);

endmodule