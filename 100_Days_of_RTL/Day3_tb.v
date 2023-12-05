`timescale 1ns/1ns
`include "Day3.v"

module day3_tb;
    
    reg clk, rst, in;
    wire rising_out, falling_out, out;

    day3 uut(clk, rst, in, rising_out, falling_out, out);

    initial begin
        $dumpfile("Day3_tb.vcd");
        $dumpvars(0,day3_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst <= 1'b1;
        in <= 1'b1;
        @(posedge clk);
        rst <= 1'b0;
        @(posedge clk);
        for (integer i=0; i<32; i=i+1) begin
            in <= $random%2;
            @(posedge clk);
        end
        $finish();
    end

    initial $monitor("clk=%b rst=%b in=%b rising_edge=%b falling_edge=%b out=%b", clk, rst, in, rising_out, falling_out, out);

endmodule