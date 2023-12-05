`timescale 1ns/1ns
`include "Day7.v"

module day7_tb;
    
    reg clk, rst;
    wire [3:0] out;

    day7 uut(clk,rst,out);

    initial begin
        $dumpfile("Day7_tb.vcd");
        $dumpvars(0,day7_tb);
    end

    initial begin
        clk = 0;
        rst = 1;
    end

    always #5 clk = ~clk;

    initial #10 rst = 0;
    initial #100 $finish;

    initial $monitor("clk=%b rst=%b out=%b", clk, rst, out);

endmodule