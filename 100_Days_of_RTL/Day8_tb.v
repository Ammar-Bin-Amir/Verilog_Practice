`timescale 1ns/1ns
`include "Day8.v"

module day8_tb;
    
    reg [3:0] binary_in;
    wire [15:0] one_hot_out;

    day8 uut(binary_in,one_hot_out);

    initial begin
        $dumpfile("Day8_tb.vcd");
        $dumpvars(0,day8_tb);
    end

    initial begin
        for (integer i = 0; i <= 16 ; i = i + 1) begin
            #5 binary_in = 0;
            binary_in = binary_in + i;
        end
        $finish;
    end

    initial $monitor("binary_in=%b one_hot_out=%b", binary_in, one_hot_out);

endmodule