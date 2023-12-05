`timescale 1ns/1ns
`include "JK_Flip_Flop.v"

module jk_ff_tb;
    
    reg clk;
    reg rst;
    reg j;
    reg k;
    wire q;
    wire qn;

    jk_ff uut(clk,rst,j,k,q,qn);

    initial begin
        $dumpfile("JK_Flip_Flop_tb.vcd");
        $dumpvars(0,jk_ff_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #10 rst = 0;
        #40 rst = 1;
        #20 j = 0; k = 0;
        #20 j = 0; k = 1;
        #20 j = 1; k = 0;
        #20 j = 1; k = 1;
        #20 j = 0; k = 0;
        #20 j = 0; k = 1;
        #20 j = 1; k = 0;
        #20 j = 1; k = 1;
        #50 $finish;
    end

    initial $monitor("clk=%b rst=%b j=%b k=%b q=%b qn=%b", clk, rst, j, k, q, qn);

endmodule