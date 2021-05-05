module half_adder 
(
    a,b,        // inputs
    sum,c_out    // outputs
);

    input  wire a,b;
    output wire sum,c_out;

    assign sum = a ^ b;
    assign c_out = a & b;
    
endmodule