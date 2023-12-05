`timescale 1ns/1ns
`include "NOT_Gate.v"

module not_gate_tb;
    
    reg in;
    wire out;

    not_gate uut(in,out);

    initial begin
        $dumpfile("NOT_Gate_tb.vcd");
        $dumpvars(0,not_gate_tb);
    end

    initial begin
        #5 in = 0;
        #5 in = 1;
        #10 $finish;
    end

    initial $monitor("in=%b out=%b", in, out);

endmodule