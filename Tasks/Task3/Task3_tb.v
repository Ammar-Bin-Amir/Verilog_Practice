`timescale 1ms/1ms
`include "Task3.v"

module task3_tb;
    
    reg clk;
    reg rst;
    wire red;
    wire green;

    task3 uut(clk,rst,red,yellow,green);

    initial begin
        $dumpfile("Task3_tb.vcd");
        $dumpvars(0,task3_tb);
    end

    initial clk = 0;
    always #500 clk = ~clk;

    initial begin
        #1000 rst = 1;
        #8000 rst = 0;
        #5000000 $finish;
    end

endmodule