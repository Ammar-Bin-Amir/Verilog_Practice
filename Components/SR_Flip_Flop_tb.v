`timescale 1ns/1ns
`include "SR_Flip_Flop.v"

module sr_ff_tb;
    
    reg clk, rst, s, r;
    wire q, qn;

    sr_ff uut(clk,rst,s,r,q,qn);

    initial begin
        $dumpfile("SR_Flip_Flop_tb.vcd");
        $dumpvars(0,sr_ff_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial rst = 0;

    initial begin
        #10 rst = 1;
        repeat (4) begin
            #10 s = 0; r = 0;
            #10 s = 0; r = 1;
            #10 s = 1; r = 0;
            #10 s = 1; r = 1;
        end
        #10 $finish;
    end

    initial $monitor("clk=%b rst=%b s=%b r=%b q=%b qn=%b", clk, rst, s, r, q, qn);

endmodule