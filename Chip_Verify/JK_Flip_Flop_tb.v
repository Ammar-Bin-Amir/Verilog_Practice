`timescale 1ns/1ns
`include "JK_Flip_Flop.v"

module JKFF_tb;
    
    reg clk; 
    reg j; 
    reg k;
    wire q;

    JKFF uut(clk,j,k,q);

    initial begin
        $dumpfile("JK_Flip_Flop_tb.vcd");
        $dumpvars(0,JKFF_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        j <= 0;
        k <= 0;
        #5
        j <= 0;
        k <= 1;
        #5
        j <= 1;
        k <= 0;
        #5
        j <= 1;
        k <= 1;
        #25 $finish;
    end

    initial $monitor("j=%0d k=%0d q=%0d", j, k, q);

endmodule