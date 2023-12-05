/*

I3 is Highest Priority
I0 is Lowest Priority

Inputs are N
Outputs are log2(N)

I3 I2 I1 I0 Y1 Y0
-----------------
0  0  0  0  x  x
0  0  0  1  0  0
0  0  1  x  0  1
0  1  x  x  1  0
1  x  x  x  1  1

*/

module priority_encoder (
    input [3:0] in,
    output reg [1:0] out
);

    always @(*) begin
       casex (in)
        4'b0001: out = 2'b00;
        4'b001x: out = 2'b01;
        4'b01xx: out = 2'b10;
        4'b1xxx: out = 2'b11;
        default: out = 0;
       endcase 
    end
    
endmodule