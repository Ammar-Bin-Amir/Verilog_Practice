`timescale 1ns/1ns
`include "Day9.v"

module day9_tb;
    
    parameter W = 3;
    reg [W-1:0] binary_in;
    wire [W-1:0] gray_out;

    day9 #(W) uut(binary_in,gray_out);

    initial begin
        $dumpfile("Day9_tb.vcd");
        $dumpvars(0,day9_tb);
    end

    initial begin
        for (integer i = 0; i <= 2**W; i = i+1) begin
            #5 binary_in = 0;
            binary_in = binary_in + i;
        end
        $finish;
    end

    initial $monitor("binary_in=%b gray_out=%b", binary_in, gray_out);

endmodule