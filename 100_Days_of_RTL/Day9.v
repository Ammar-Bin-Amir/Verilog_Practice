// Design and verify a parameterized binary to gray code converter

module day9 #(parameter W = 3)(
    input [W-1:0] binary_in,
    output [W-1:0] gray_out
);

/*
    always @(*) begin
        case (binary_in)
            0: gray_out <= 3'b000;
            1: gray_out <= 3'b001;
            2: gray_out <= 3'b011;
            3: gray_out <= 3'b010;
            4: gray_out <= 3'b110;
            5: gray_out <= 3'b111;
            6: gray_out <= 3'b101;
            7: gray_out <= 3'b100;
        endcase
    end
*/

    assign gray_out[W-1] = binary_in[W-1];                    // MSB 100
    assign gray_out[W-2] = binary_in[W-2+1] ^ binary_in[W-2]; // 010
    assign gray_out[W-3] = binary_in[W-3+1] ^ binary_in[W-3]; // 001

endmodule