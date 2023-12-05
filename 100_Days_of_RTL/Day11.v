// Design and verify a 4-bit parallel to serial converter with valid and empty indications

module day11 (
    input clk, rst,
    input [3:0] parallel_in,
    output reg serial_out, empty, valid
);
    
    reg [3:0] shift, next;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift <= 0;
        end
        else begin
            shift <= next;
        end
    end

    always @(*) begin
        next = empty ? parallel_in : {1'b0,shift[3:1]};
    end

    always @(*) begin
        serial_out = shift[0];
    end

    reg [2:0] current_state, next_state;

    always @(posedge clk or negedge rst) begin
        if (rst) begin
            current_state <= 0;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        next_state = (current_state == 4) ? 0 : current_state + 1;
        empty = (current_state == 0);
        valid = ~empty;
    end

endmodule