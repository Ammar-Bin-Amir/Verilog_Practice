`timescale 1ns/1ns
`include "Day13.v"

module day13_tb;
    
    reg a, b, sel;
    wire out_ternary_operator, out_case_statement, out_if_else_block, out_combinational_for_loop, out_and_or_tree;

    day13 uut(a,b,sel,out_ternary_operator,out_case_statement,out_if_else_block,out_combinational_for_loop,out_and_or_tree);

    initial begin
        $dumpfile("Day13_tb.vcd");
        $dumpvars(0,day13_tb);
    end

    initial begin
        #5 a = 0; b = 1; sel = 0;
        #5 a = 1; b = 0; sel = 0;
        #5 a = 0; b = 1; sel = 1;
        #5 a = 1; b = 0; sel = 1;
        #5 $finish;
    end

    initial $monitor("a=%b b=%b sel=%b outT=%b outC=%b outIf=%b outFor=%b out&|=%b", a, b, sel, out_ternary_operator, out_case_statement, out_if_else_block, out_combinational_for_loop, out_and_or_tree);

endmodule