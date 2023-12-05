`timescale 1ns/1ps
`include "N_Bit_Bi_Directional_Shift_Register.v"

module ShiftRegister_tb;

    parameter MSB = 16;
    reg clk, en, dir, d, rst;
    wire [MSB-1:0] out;

    ShiftRegister #(MSB) uut(clk, en, dir, d, rst, out);

    initial begin
        $dumpfile("N_Bit_Bi_Directional_Shift_Register_tb.vcd");
        $dumpvars(0,ShiftRegister_tb);
    end

    initial
        begin
            clk <= 0;
            en <= 0;
            dir <= 0;
            d <= 'h1;
            rst <= 0;
        end
    
    always #5 clk = ~clk;

    initial
        begin
            rst <= 0;
            #20 rst <= 1;
            en <= 1;
            repeat (7) @ (posedge clk) d <= ~d;
            #10 dir <= 1;
            repeat (7) @ (posedge clk) d <= ~d;
            repeat (7) @ (posedge clk);
            $finish;
        end

    initial $monitor("clk=%b en=%b dir=%b d=%b rst=%b out=%b", clk, en, dir, d, rst, out);

endmodule