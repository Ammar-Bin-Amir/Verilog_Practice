// Design and verify a parameterized binary to one-hot converter

module day8 (
    input [3:0] binary_in,
    output [15:0] one_hot_out
);
    
    assign one_hot_out = 1 << binary_in;

endmodule