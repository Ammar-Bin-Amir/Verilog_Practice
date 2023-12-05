`timescale 1ns/1ns
`include "4_Bit_Ripple_Counter.v"

module RippleCounter4Bit_tb;

    reg clk;
    wire [3:0] out;

    RippleCounter4Bit uut(clk,out);

    initial
        begin
            $dumpfile("4_Bit_Ripple_Counter_tb.vcd");
            $dumpvars(0,RippleCounter4Bit_tb);
        end
    
    initial clk = 0;
    always #5 clk = ~clk;

    initial
        begin
            repeat (25) @ (posedge clk);
            $display("Test Completed!");
            $finish;
        end
    
endmodule
