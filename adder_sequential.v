module adder_sequential 
(
    clk,     // clock
    a,b,     // inputs
    c        // outputs
);

    input wire        clk;
    input wire [31:0] a,b;
    output reg [31:0] c;

    always @(posedge clk) begin
        c <= a + b;       
    end

endmodule