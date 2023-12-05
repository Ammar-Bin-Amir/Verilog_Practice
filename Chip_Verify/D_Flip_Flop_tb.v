`timescale 1ns/1ns
`include "D_Flip_Flop.v"

module DFF_tb;

    reg clk, rst, d;
    wire q;

    DFF uut(clk,rst,d,q);

    initial begin
        $dumpfile("D_Flip_Flop_tb.vcd");
        $dumpvars(0,DFF_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #5 
        d <= 0;
        rst <= 1;
        #5 
        d <= 1;
        rst <= 1;
        #5 
        d <= 0;
        rst <= 0;
        #5 
        d <= 1;
        rst <= 0;
        #50 $finish;
    end

endmodule