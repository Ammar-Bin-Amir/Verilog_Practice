`timescale 1ns/1ns
`include "half_adder.v"

module full_adder_tb;
    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0,full_adder_tb);
    end

    reg  a_tb,b_tb,c_in_tb;
    wire sum1_tb,sum2_tb,c_out1_tb,c_out2_tb,c_out3_tb;
    
    half_adder half_adder2
    (
        .a(a_tb),
        .b(b_tb),
        .sum(sum1_tb),
        .c_out(c_out1_tb)
    );
    half_adder half_adder3
    (
        .a(sum1_tb),
        .b(c_in_tb),
        .sum(sum2_tb),
        .c_out(c_out2_tb)
    );

    initial begin
        a_tb = 1'b0;
        b_tb = 1'b0;
        c_in_tb = 1'b0;
        #5
        a_tb = 1'b0;
        b_tb = 1'b1;
        c_in_tb = 1'b0;
        #5
        a_tb = 1'b1;
        b_tb = 1'b0;
        c_in_tb = 1'b0;
        #5
        a_tb = 1'b1;
        b_tb = 1'b1;
        c_in_tb = 1'b0;
        #5
        a_tb = 1'b0;
        b_tb = 1'b0;
        c_in_tb = 1'b1;
        #5
        a_tb = 1'b0;
        b_tb = 1'b1;
        c_in_tb = 1'b1;
        #5
        a_tb = 1'b1;
        b_tb = 1'b0;
        c_in_tb = 1'b1;
        #5
        a_tb = 1'b1;
        b_tb = 1'b1;
        c_in_tb = 1'b1;
        #40
        $display("Test Completed!");
        $finish;
    end

    assign c_out3_tb = c_out1_tb | c_out2_tb;

endmodule