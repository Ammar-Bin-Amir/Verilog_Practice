// Design and verify a sequence detector to detect the following sequence: 1110_1101_1011
// Overlapping sequences should be detected

module day12 (
    input clk, rst, in,
    output out
);

    reg [11:0] current, next;

    always @(posedge clk) begin
        if (rst) begin
            current <= 0;
        end
        else begin
            current <= next;
        end
    end

    always @(*) next = {current[10:0],in};
    assign out = (current[11:0] == 12'b1110_1101_1011);

endmodule