`timescale 1ns/1ns
`include "Priority_Encoder.v"

module priority_encoder_tb;
    
    reg [3:0] in;
    wire [1:0] out;

    priority_encoder uut(in,out);

    initial begin
        $dumpfile("Priority_Encoder_tb.vcd");
        $dumpvars(0,priority_encoder_tb);
    end

    initial begin
        #10 in = 4'b0000;
        #10 in = 4'b0001;
        #10 in = 4'b0011;
        #10 in = 4'b0101;
        #10 in = 4'b1111;
        #100 $finish;
    end

    initial $monitor("in=%b out=%b", in, out);

endmodule