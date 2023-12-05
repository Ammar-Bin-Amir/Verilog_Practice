// Design and verify a rising and falling edge detector

module day3 (
    input clk, rst, in,
    output rising_out, falling_out, out
);
    
    reg out;

    always @(posedge clk) begin
        if (rst) begin
            out <= 0;
        end
        else begin
            out <= in;
        end
    end

    // Rising edge when delayed signal is 0 but current is 1
    assign rising_out = ~out & in;
    /*
    in out ~out &
    0   0   1   0
    0   1   0   0
    1   0   1   1
    1   1   0   0
    */

    // Falling edge when delayed signal is 1 but current is 0
    assign falling_out = out & ~in;
    /*
    in out ~in  &
    0   0   1   0
    0   1   1   1
    1   0   0   0
    1   1   0   0
    */

endmodule