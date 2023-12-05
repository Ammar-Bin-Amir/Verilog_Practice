`timescale 1ns/1ns
`include "Day12.v"

module day12_tb;
    
    reg clk, rst, in;
    wire out;

    day12 uut(clk,rst,in,out);

    initial begin
        $dumpfile("Day12_tb.vcd");
        $dumpvars(0,day12_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #10 rst = 1; in = $random;
        #10 rst = 0; in = $random;
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 $finish;
    end

    initial $monitor("clk=%b rst=%b in=%b out=%b", clk, rst, in, out);

endmodule