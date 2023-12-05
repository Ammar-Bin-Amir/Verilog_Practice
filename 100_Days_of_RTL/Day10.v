// Design and verify a counter which supports loading a value

module day10 (
    input clk, rst, load, 
    input [3:0] in,
    output reg [3:0] out
);
    
    always @(posedge clk) begin
        if (rst) begin
            out <= 0;
        end
        else begin
            if (load) begin
                out <= in;
            end
            else begin
                out <= out + 1;
            end
        end
        if (out == 4'b1111) begin
            out <= 0;
        end
    end

endmodule