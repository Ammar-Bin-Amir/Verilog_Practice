`timescale 1ns/1ns
`include "Round_Robin_Arbiter.v"

module round_robin_arbiter_tb;
    
    reg clk;
    reg rst;
    reg [2:0] requests;
    wire [2:0] grants;

    round_robin_arbiter uut(clk,rst,requests,grants);

    initial begin
        $dumpfile("Round_Robin_Arbiter_tb.vcd");
        $dumpvars(0,round_robin_arbiter_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #10 rst = 1;
        #15 rst = 0;
        #30 requests = 0;
        #30 requests = 1;
        #30 requests = 2;
        #30 requests = 3;
        #30 requests = 4;
        #30 requests = 5;
        #30 requests = 6;
        #30 requests = 7;
        #50 $finish;
    end

    initial $monitor("clk=%b rst=%b requests=%b grants=%b", clk, rst, requests, grants);

endmodule