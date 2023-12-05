// Design and verify a parameterized fixed priority arbiter
// Output should be produced in a single cycle
// Output must be one-hot

module day14 (
    input [2:0] requests,
    output [2:0] grants
);
    /*
    always @(*) begin
        case (requests)
            3'b000: grants = 3'b000;
            3'b001: grants = 3'b001;
            3'b010: grants = 3'b010;
            3'b011: grants = 3'b001;
            3'b100: grants = 3'b100;
            3'b101: grants = 3'b001;
            3'b110: grants = 3'b010;
            3'b111: grants = 3'b001;
            default: grants = 3'bxxx;
        endcase
    end
    */
    
    assign grants[0] = requests[0];

    genvar i;
    always @(*) begin
        grants[0] = requests[0];
        for (i = 1; i <= 3; i = i + 1) begin
           grants[i] = requests[i] & ~(|grants(i-1:0));
        end
    end
endmodule