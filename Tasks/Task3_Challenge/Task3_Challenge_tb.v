`timescale 1ms/1ms
`include "Task3_Challenge.v"

module task3_challenge_tb;
    
    reg clk;
    reg rst;
    wire red;
    wire green;

    task3_challenge uut(clk,rst,red,yellow,green);

    initial begin
        $dumpfile("Task3_Challenge_tb.vcd");
        $dumpvars(0,task3_challenge_tb);
    end

    initial clk = 0;
    always #500 clk = ~clk;

    initial begin
        #1000 rst = 1;
        #9000 rst = 0;
        #50000 $finish;
    end

endmodule