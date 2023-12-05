`timescale 1ns/1ns
`include "Day6.v"

module day6_tb;
    
    reg clk, rst, in;
    wire [3:0] out;

    day6 uut(clk,rst,in,out);

    initial begin
        $dumpfile("Day6_tb.vcd");
        $dumpvars(0,day6_tb);
    end

    initial begin
        clk = 0;
        rst = 1;
        in = $random;
        #10 rst = 0; in = $random;
        #10 in = $random;
        #10 in = $random;
        #10 in = $random;
        #10 in = $random;
        $finish;
    end
    always #5 clk = ~clk;

    initial $monitor("clk=%b rst=%b in=%b out=%b", clk, rst, in, out);

endmodule