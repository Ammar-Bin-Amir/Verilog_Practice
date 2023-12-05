/*

Inverter

a   0
-----
0   1
1   0

*/


module not_gate (
    input in,
    output out
);

    assign out = ~in;

endmodule