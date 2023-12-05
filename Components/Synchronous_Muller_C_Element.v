/*

Output will be LOW if all bits of input are low and would remain LOW until all bits are HIGH
Output will be HIGH if all bits of input are HIGH and would remain HIGH until all bits are LOW

  In  Out         In  Out
---------       ---------
0 0 0  0        1 1 1  1
0 0 1  0        1 1 0  0
0 1 0  0        1 0 1  0
0 1 1  0        1 0 0  0
1 0 0  0        0 1 1  0
1 0 1  0        0 1 0  0
1 1 0  0        0 0 1  0
1 1 1  1        0 0 0  0

*/

module synchronous_muller_c_element (
    input clk,
    input rst,
    input [2:0] in,
    output reg out
);
    
    always @(posedge clk) begin
        if (rst) begin
            out <= 0;
        end
        else begin
            if (in == 3'b111) begin
                out <= 1;
            end
            if (in == 3'b000) begin
                out <= 0;
            end
        end
    end

endmodule