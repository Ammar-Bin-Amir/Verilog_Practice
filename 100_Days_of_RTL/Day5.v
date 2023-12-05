// Design and verify an 8-bit odd counter

module day5 (
    input clk, rst,
    output reg [7:0] out
);
    
    always @(posedge clk) begin
        if (rst) begin
            out <= 1;
        end
        else begin
            out <= out + 2;
        end
    end

endmodule