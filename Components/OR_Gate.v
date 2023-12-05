/*

LOW on 0

a   b   o
---------
0   0   0
0   1   1
1   0   1
1   1   1

*/

module or_gate #(parameter N = 2)(
    input [N-1:0] in,
    output out
);
    
    assign out = |in;

endmodule