/*

Set and Reset on Clock High

j   k   q   qn  Comments
------------------------
0   0   0   1   No Change
0   1   0   1   Reset
1   0   1   0   Set
1   1   x   x   Toggle

*/

module jk_ff (
    input clk,
    input rst,
    input j,
    input k,
    output reg q,
    output qn
);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            q <= 0;
        end
        else begin
            if (~j && ~k) q <= q;   // No Change
            if (~j && k) q <= 0;    // Reset
            if (j && ~k) q <= 1;    // Set
            if (j && k) q <= ~q;    // Toggle
        end
    end

    assign qn = ~q;
    
endmodule