`timescale 1ns/1ns
`include "Day2.v"

module day2_tb;
    
    reg clk, rst, d;
    wire q_no_rst, q_sync_rst, q_async_rst;

    day2 uut(clk, rst, d, q_no_rst, q_sync_rst, q_async_rst);

    initial begin
        $dumpfile("Day2_tb.vcd");
        $dumpvars(0,day2_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1'b1;
        d = 1'b0;
        @(posedge clk);
        rst = 1'b0;
        @(posedge clk);
        d = 1'b1;
        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        rst = 1'b1;
        @(posedge clk);
        @(posedge clk);
        rst = 1'b0;
        @(posedge clk);
        @(posedge clk);
        $finish();
    end

    initial $monitor("clk=%b rst=%b d=%b q_no_rst=%b q_sync_rst=%b q_async_rst=%b", clk, rst, d, q_no_rst, q_sync_rst, q_async_rst);

endmodule