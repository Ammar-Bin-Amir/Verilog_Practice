`timescale 1ns/1ns
`include "Task1.v"

module task1_tb;

    parameter W = 5;
    reg clk, en, ld, rst;
    reg [W-1:0] cnt_in;
    wire [W-1:0] cnt_out;

    task1 #(W) uut(clk,en,ld,rst,cnt_in,cnt_out);

    initial begin
        $dumpfile("Task1_tb.vcd");
        $dumpvars(0,task1_tb);
    end

    initial begin
        clk = 0;
        en = 0;
        ld = 0;
        rst = 1;
    end

    always #5 clk = ~clk;
    
    initial begin
        #10 cnt_in = $random;
        #20 en = 1;
        #40 rst = 0;
        #80 ld = 1;
        #100 $finish;
    end

    initial $monitor("clk=%b en=%b ld=%b rst=%b cnt_in=%b cnt_out=%b",clk,en,ld,rst,cnt_in,cnt_out);

endmodule