// Design and verify a simple shift register

module day6 (
    input clk, rst, in,
    output [3:0] out
);
    
    reg [3:0] current;
    reg [3:0] next;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current <= 0;
        end
        else begin
            current <= next;
        end
    end

    always @(*) next = {current[2:0], in};
    assign out = current;

endmodule