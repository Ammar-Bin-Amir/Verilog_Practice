// Design and verify a 4-bit linear feedback shift register where the bit[0] of the register is driven by the XOR of the LFSR register bit[1] and bit[3]

module day7 (
    input clk, rst,
    output [3:0] out
);
    
    reg [3:0] current, next;

    always @(posedge clk) begin
        if (rst) begin
            current <= 4'hE;
        end
        else begin
            current <= next;
        end
    end

    always @(*) begin
        next = {current[2:0],current[1] ^ current[3]};
    end

    assign out = current;

endmodule