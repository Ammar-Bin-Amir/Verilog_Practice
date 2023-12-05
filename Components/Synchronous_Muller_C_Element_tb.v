`timescale 1ns/1ns
`include "Synchronous_Muller_C_Element.v"

module synchronous_muller_c_element_tb;
    
    reg clk;
    reg rst;
    reg [2:0] in;
    wire out;

    synchronous_muller_c_element uut(clk,rst,in,out);

    initial begin
        $dumpfile("Synchronous_Muller_C_Element_tb.vcd");
        $dumpvars(0,synchronous_muller_c_element_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #10 rst = 1;
        #10 rst = 0;
        #10 in = 7;
        #10 in = 6;
        #10 in = 5;
        #10 in = 4;
        #10 in = 3;
        #10 in = 2;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 2;
        #10 in = 3;
        #10 in = 4;
        #10 in = 5;
        #10 in = 6;
        #10 in = 7;
        #10 in = 6;
        #10 in = 5;
        #10 in = 4;
        #10 in = 3;
        #10 in = 2;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 2;
        #10 in = 3;
        #10 in = 4;
        #10 in = 5;
        #10 in = 6;
        #10 in = 7;
        #10 $finish;
    end

    initial $monitor("clk=%b rst=%b in=%b out=%b", clk, rst, in, out);

endmodule