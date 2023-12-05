`timescale 1ns/1ns
`include "Day14.v"

module day14_tb;
    
    reg [2:0] requests;
    wire [2:0] grants;

    day14 uut(requests,grants);

    initial begin
        $dumpfile("Day14_tb.vcd");
        $dumpvars(0,day14_tb);
    end

    initial begin
        #5 requests = 0;
        #5 requests = 1;
        #5 requests = 2;
        #5 requests = 3;
        #5 requests = 4;
        #5 requests = 5;
        #5 requests = 6;
        #5 requests = 7;
        #5 requests = 8;
        #5 $finish;
    end

    initial $monitor("requests=%b grants=%b", requests, grants);

endmodule