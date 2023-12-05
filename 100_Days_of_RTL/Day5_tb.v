`timescale 1ns/1ns
`include "Day5.v"

module day5_tb;
    
    reg clk, rst;
    wire [7:0] out;

    day5 uut(clk,rst,out);

    initial begin
        $dumpfile("Day5_tb.vcd");
        $dumpvars(0,day5_tb);
    end

    initial begin
        clk = 0;
        rst = 1;
    end

    always #5 clk = ~clk;

    initial begin
        #10 rst = 0;
        #100 $finish;
    end

    initial $monitor("clk=%b rst=%b out=%b", clk, rst, out);

endmodule