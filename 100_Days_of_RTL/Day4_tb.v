`timescale 1ns/1ns
`include "Day4.v"

module day4_tb;
    
    reg [7:0] in1, in2; 
    reg [2:0] opcode;
    wire [7:0] out;

    day4 uut(in1,in2,opcode,out);

    initial begin
        $dumpfile("Day4_tb.vcd");
        $dumpvars(0,day4_tb);
    end

    initial begin
        in1 = $random;
        in2 = $random;
        opcode = 0;
    end

    initial begin
        #10 opcode = 1;
        #10 opcode = 2;
        #10 opcode = 3;
        #10 opcode = 4;
        #10 opcode = 5;
        #10 opcode = 6;
        #10 opcode = 7;
    end

    initial $monitor("in1=%b in2=%b opcode=%b out=%b", in1, in2, opcode, out);

endmodule