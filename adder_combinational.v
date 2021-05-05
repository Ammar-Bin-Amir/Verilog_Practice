module adder_combinational
(
    a , b ,     // inputs
    c           // output
);
    
    input  wire a,b;
    output wire c;

    assign c = a + b;

endmodule