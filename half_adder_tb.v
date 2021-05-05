`timescale 1ns/1ns
`include "half_adder.v"

module half_adder_tb;
    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0,half_adder_tb);
    end

    reg  a_tb,b_tb;
    wire sum_tb,c_out_tb;

    half_adder half_adder1
    (
        .a(a_tb),
        .b(b_tb),
        .sum(sum_tb),
        .c_out(c_out_tb)
    );

    initial begin
        a_tb = 1'b0;
        b_tb = 1'b0;
        #5
        a_tb = 1'b0;
        b_tb = 1'b1;
        #5
        a_tb = 1'b1;
        b_tb = 1'b0;
        #5
        a_tb = 1'b1;
        b_tb = 1'b1;
        #40
        $display("Test Completed!");
        $finish;
    end
    
endmodule