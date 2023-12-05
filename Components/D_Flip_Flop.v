/*

Delay on Clock High

d   q   qn  Comments
--------------------
0   0   1   No Change
1   1   1   Delay

*/

module d_ff (
    input clk, rst, d,
    output reg q,
    output qn
);
    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end

    assign qn = ~q;

endmodule