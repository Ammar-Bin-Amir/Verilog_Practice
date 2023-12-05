`timescale 1ns/1ns
`include "Task2.v"

module task2_tb;
    
    reg clk, rst_, zero;
    reg [2:0] opcode;
    wire mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr;

    task2 uut(clk, rst_, zero, opcode,mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr);

    initial begin
        $dumpfile("Task2_tb.vcd");
        $dumpvars(0,task2_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        #10 rst_ = 0; zero = 0; opcode = 0;
        #10 opcode = 1;
        #10 opcode = 2;
        #10 opcode = 3;
        #10 opcode = 4;
        #10 opcode = 5;
        #10 opcode = 6;
        #10 opcode = 7;
        #10 rst_ = 1; zero = 1; opcode = 0;
        #10 opcode = 1;
        #10 opcode = 2;
        #10 opcode = 3;
        #10 opcode = 4;
        #10 opcode = 5;
        #10 opcode = 6;
        #10 opcode = 7;
        #50 opcode = 0;
        #10 opcode = 2;
        #10 opcode = 3;
        #10 opcode = 4;
        #50 opcode = 5;
        #10 opcode = 1;
        #10 opcode = 7;
        #60 opcode = 7;
        #10 opcode = 6;
        $finish;
    end

    initial $monitor("clk=%b rst_=%b zero=%b opcode=%b mem_rd=%b load_ir=%b halt=%b inc_pc=%b load_ac=%b load_pc=%b mem_wr=%b", clk, rst_, zero, opcode, mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr);

endmodule