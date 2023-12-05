/*

Set and Reset on Clock High

s   r   q   qn  Comments
------------------------
0   0   0   1   No Change
0   1   0   1   Reset
1   0   1   0   Set
1   1   x   x   Invalid

*/

module sr_ff (
    input clk, rst, s, r,
    output reg q, 
    output qn
);
    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            q <= 0;
        end
        else begin
            if (~s && ~r) q <= q;   // No Change
            if (s && ~r) q <= 1;    // Set
            if (~s && r) q <= 0;    // Reset 
        end
    end

    assign qn = ~q;

endmodule