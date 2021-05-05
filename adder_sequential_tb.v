`timescale 1ns/1ns
`include "adder_sequential.v"

module adder_sequential_tb;
    initial begin
        $dumpfile("adder_sequential_tb.vcd");
        $dumpvars(0,adder_sequential_tb);
    end

    reg         clk_tb;
    reg  [31:0] a_tb , b_tb;
    wire [31:0] c_tb;

    adder_sequential adder_sequential1
    (
        .clk(clk_tb),
        .a(a_tb),
        .b(b_tb),
        .c(c_tb)
    );

    initial begin
        clk_tb = 1'b0;
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

    always #2 clk_tb <= ~clk_tb;

endmodule