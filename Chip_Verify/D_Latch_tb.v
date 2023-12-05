`timescale 1ns/1ns
`include "D_Latch.v"

module DLatch_tb;

    reg en, d, rst;
    wire q;

    DLatch uut(en,d,rst,q);

    initial begin
        $dumpfile("D_Latch_tb.vcd");
        $dumpvars(0,DLatch_tb);
    end

    initial begin
        #5 en = 0; d = 0; rst = 0;
        #5 en = 0; d = 1; rst = 0;
        #5 en = 1; d = 0; rst = 0;
        #5 en = 1; d = 1; rst = 0;
        #5 en = 1; d = 1; rst = 1;
        $display("Test Completed!");
        #30 $finish;
    end

endmodule