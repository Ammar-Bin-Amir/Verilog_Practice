`timescale 1ns/1ns
`include "Test.v"

module Test_tb;

reg A;
wire B;

Test uut(A,B);

initial begin
    $dumpfile("Test_tb.vcd");
    $dumpvars(0,Test_tb);

    A = 0;
    #20

    A = 1;
    #20

    $display("Test Completed!");
end
endmodule