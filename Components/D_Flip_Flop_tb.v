`timescale 1ns/1ns
`include "D_Flip_Flop.v"

module d_ff_tb;
    
    reg clk, rst, d;
    wire q, qn;

    d_ff uut(clk,rst,d,q,qn);

    initial begin
        $dumpfile("D_Flip_Flop_tb.vcd");
        $dumpvars(0,d_ff_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial rst = 0;
    initial #10 rst = 1;

    initial #20 d = 0;
    always #10 d = ~d;

    initial #100 $finish;

    initial $monitor("clk=%b rst=%b d=%b q=%b qn=%b", clk, rst, d, q, qn);

endmodule