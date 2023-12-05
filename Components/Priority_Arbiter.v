/*

R0 is Lowest Priority
R2 is Highest Priority

Inputs are N 
Outputs are N

R2 R1 R0 G2 G1 G0
-----------------
0  0  0  0  0  0
0  0  1  0  0  1
0  1  0  0  1  0
0  1  1  0  0  1
1  0  0  1  0  0
1  0  1  0  0  1
1  1  0  0  1  0
1  1  1  0  0  1

*/

module priority_arbiter (
    input clk,
    input rst,
    input [2:0] requests,
    output reg [2:0] grants
);

    always @(posedge clk) begin
       if (rst) begin
        grants = 0;
       end
       else begin
        case (requests)
        3'b000: grants = 3'b000;
        3'b001: grants = 3'b001;
        3'b010: grants = 3'b010;
        3'b011: grants = 3'b001;
        3'b100: grants = 3'b100;
        3'b101: grants = 3'b001;
        3'b110: grants = 3'b010;
        3'b111: grants = 3'b001;
        default: grants = 0;
       endcase
       end
    end
    
endmodule