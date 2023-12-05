`timescale 1ns/1ns
`include "T_Flip_Flop.v"

module TFF_tb;

    reg clk, t;
    wire q;

    TFF uut(clk,t,q);

    initial begin
        $dumpfile("T_Flip_Flop_tb.vcd");
        $dumpvars(0,TFF_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #10 t <= 0;
        #10 t <= 1;
        #30 $finish;
        $display("Test Completed!");
    end

endmodule