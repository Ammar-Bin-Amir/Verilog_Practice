/*
Design a 2:1 mux using the following language constructs:
Construct
---------
Ternary Operator
Case statement
If else block
Combinatorial For loop
And-or tree
*/

module day13 (
    input a, b, sel,
    output out_ternary_operator, out_and_or_tree,
    output reg out_case_statement, out_if_else_block, out_combinational_for_loop
);

    // Ternary Operator
    assign out_ternary_operator = sel ? b : a;

    // Case Statement
    always @(*) begin
        case (sel)
            0: out_case_statement = a;
            1: out_case_statement = b; 
            default: out_case_statement = a;
        endcase
    end

    // If Else Block
    always @(*) begin
        if (sel) begin
            out_if_else_block = b;
        end
        else begin
            out_if_else_block = a;
        end
    end

    // Combinational For Loop
    wire [1:0] sel_i, in_i;
    wire out_i = 0;

    assign sel_i[0] = ~sel;
    assign sel_i[1] = sel;

    assign in_i[0] = a;
    assign in_i[1] = b;

    always @(*) begin
        for (integer i = 0; i < 1 ; i = i + 1) begin
            out_combinational_for_loop = (sel_i[i] & in_i[i]) | out_i;
        end
    end
    

    // And Or Tree
    assign out_and_or_tree = (~sel & a) | (sel & b);
endmodule