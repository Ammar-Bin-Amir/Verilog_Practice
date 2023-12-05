`timescale 1ns/1ns
`include "Day11.v"

module day11_tb;
    
    reg clk, rst;
    reg [3:0] parallel_in;
    wire serial_out, empty, valid;

    day11 uut(clk,rst,parallel_in,serial_out,empty,valid);

    initial begin
        $dumpfile("Day11_tb.vcd");
        $dumpvars(0,day11_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; parallel_in = 4'b1011;
        #10 rst = 0; parallel_in = 4'b1011;
        #10 parallel_in = 4'b1011;
        #10 parallel_in = 4'b1011;
        #10 parallel_in = 4'b1011;
        #10 $finish;
    end

    initial $monitor("clk=%b rst=%b in=%b out=%b empty=%b valid=%b",clk, rst, parallel_in, serial_out, empty, valid);

endmodule