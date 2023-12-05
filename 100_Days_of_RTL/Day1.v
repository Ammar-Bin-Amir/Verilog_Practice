// Design and verify a 2:1 mux

module day1 (
    input a, b, sel,
    output out
);

    assign out = sel ? b : a;

endmodule