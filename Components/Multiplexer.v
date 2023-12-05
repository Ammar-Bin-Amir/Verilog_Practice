/*

Select bits select the input to be given at output

sel   a   b   o
---------------
 0    0   1   0
 0    1   0   1
 1    0   1   1
 1    1   0   0

*/

module mux (
    input [3:0] in,
    input [1:0] sel,
    output reg out
);

    // always @(*) begin
    //     case (sel)
    //         0: out = in[0];
    //         1: out = in[1];
    //         2: out = in[2];
    //         3: out = in[3];
    //         default: out = 0;
    //     endcase
    // end

    always @(*) begin
        for (integer i = 0; i < 4; i = i + 1) begin
            out = (sel[i] & in[i]);
        end
    end

endmodule