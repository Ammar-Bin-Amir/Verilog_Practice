/*

Select bits select the output to give the input

sel   i   x   y
---------------
 0    0   0   0
 0    1   1   0
 1    1   0   1
 1    0   0   0

*/

module demux (
    input in,
    input [1:0] sel,
    output reg [3:0] out
);
    
    // always @(*) begin
    //     case (sel)
    //         0: out[0] = in;
    //         1: out[1] = in;
    //         2: out[2] = in;
    //         3: out[3] = in;
    //         default: out = 0;
    //     endcase
    // end

    always @(*) begin
        for (integer i = 0; i < 4; i = i + 1) begin
            out[i] = (sel[i] & in);
        end
    end

endmodule