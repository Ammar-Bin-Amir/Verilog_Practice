/*

HIGH on different

a   b   0
---------
0   0   0
0   1   1
1   0   1
1   1   0

*/

module xor_gate #(parameter N = 2)(
    input [N-1:0] in,
    output out
);
    
    assign out = ^in;

endmodule