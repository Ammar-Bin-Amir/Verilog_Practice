/*

HIGH on 0

a   b   o
---------
0   0   1
0   1   0
1   0   0
1   1   0

*/

module nor_gate #(parameter N = 2) (
    input [N-1:0] in,
    output out
);

    assign out = ~(|in);
    
endmodule