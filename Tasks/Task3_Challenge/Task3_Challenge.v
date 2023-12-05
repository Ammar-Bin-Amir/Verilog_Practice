/*

Design a One-Way Traffic Control System:
> On RESET every light would be LOW
> RED light will remain HIGH for 30s after that YELLOW light would be HIGH
> YELLOW light will remain HIGH for 3s along with RED light after that GREEN light would be HIGH
> GREEN light will remain HIGH for 30s after that YELLOW light would be HIGH
> YELLOW light will remain HIGH for 3s after that RED light would be HIGH

*/

module task3_challenge (
    input clk,
    input rst,
    output reg red,
    output reg yellow,
    output reg green
);
    
    localparam DISABLE = 3'b000;
    localparam STOP = 3'b001;
    localparam READY_TO_GO = 3'b010;
    localparam GO = 3'b011;
    localparam READY_TO_STOP = 3'b100;

    reg [2:0] current_state, next_state;
    
    always @(posedge clk) begin
        if (rst) begin
            current_state <= DISABLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case (current_state)
            DISABLE: begin
                red = 0;
                yellow = 0;
                green = 0;
                next_state <= STOP;
            end
            STOP: begin
                red = 1;
                yellow = 0;
                green = 0;
                next_state = READY_TO_GO;
            end
            READY_TO_GO: begin
                red = 1;
                yellow = 1;
                green = 0;
                next_state = GO;
            end
            GO: begin
                red = 0;
                yellow = 0;
                green = 1;
                next_state = READY_TO_STOP;
            end
            READY_TO_STOP: begin
                red = 0;
                yellow = 1;
                green = 0;
                next_state = STOP;
            end
            default: next_state <= DISABLE;
        endcase
    end

endmodule