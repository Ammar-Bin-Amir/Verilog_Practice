`timescale 1ns/1ns
`include "Day10.v"

module day10_tb;
    
    reg clk, rst, load;
    reg [3:0] in;
    wire [3:0] out;

    day10 uut(clk, rst, load, in, out);

    initial begin
        $dumpfile("Day10_tb.vcd");
        $dumpvars(0,day10_tb);
    end

    initial clk = 0;
    initial rst = 1;
    always #5 clk = ~clk;

    initial begin
        #10 rst = 0; load = 1; in = $random;
        #10 load = 0;
        #200 load = 1;
        $finish;
    end

    initial $monitor("clk=%b rst=%b load=%b in=%b out=%b", clk, rst, load, in, out);

endmodule