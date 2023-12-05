`timescale 1ns/1ns
`include "Priority_Arbiter.v"

module priority_arbiter_tb;
    
    reg clk;
    reg rst;
    reg [2:0] requests;
    wire [2:0] grants;

    priority_arbiter uut(clk,rst,requests,grants);

    initial begin
        $dumpfile("Priority_Arbiter_tb.vcd");
        $dumpvars(0,priority_arbiter_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #10 rst = 1;
        #50 rst = 0;
        for (integer i = 0; i < 8; i = i + 1) begin
            #10 requests = i;
        end
        #100 $finish;
    end

    initial $monitor("clk=%b rst=%b requests=%b grants=%b", clk, rst, requests, grants);

endmodule