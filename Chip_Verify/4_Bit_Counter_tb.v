`timescale 1ns/1ns
`include "4_Bit_Counter.v"

module Counter4Bit_tb;

    reg clk, rst;
    wire [3:0] out;

    Counter4Bit uut(clk,rst,out);

    initial begin
        $dumpfile("4_Bit_Counter_tb.vcd");
        $dumpvars(0,Counter4Bit_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #5 rst = 1;
        #90 rst = 0;
        #100 rst = 1;
        $display("Test Completed!");
        #110 $finish;
    end

endmodule