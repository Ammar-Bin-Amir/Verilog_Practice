/*

LOW on 1

a   b   o
---------
0   0   1
0   1   1
1   0   1
1   1   0

*/

module nand_gate #(parameter N = 2)(
    input [N-1:0] in,
    output out
);
    
    assign out = ~(&in);

endmodule