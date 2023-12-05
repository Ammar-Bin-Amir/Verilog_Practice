`timescale 1ns/1ps
`include "Day1.v"

module day1_tb;

    reg a, b, sel;
    wire out;

    day1 uut(a,b,sel,out);

    initial begin
        $dumpfile("Day1_tb.vcd");
        $dumpvars(0,day1_tb);
    end

    initial begin
        for (integer i = 0; i < 10 ; i = i + 1) begin
            #5
            a = $random;
            b = $random;
            sel = $random%2;
        end
    end

    initial $monitor("a=%b b=%b sel=%b out=%b", a, b, sel, out);

endmodule