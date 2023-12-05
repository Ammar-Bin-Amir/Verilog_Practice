// Design and verify various flavours of a D flip-flop

module day2 (
    input clk, rst, d,
    output reg q_no_rst, q_sync_rst, q_async_rst
);
    
    // No Reset
    always @(posedge clk) begin
        q_no_rst <= d;
    end

    // Synchronous Reset
    always @(posedge clk) begin
        if (rst) begin
            q_sync_rst <= 0;
        end
        else begin
            q_sync_rst <= d;
        end
    end

    // Asynchronous Reset
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q_async_rst <= 0;
        end
        else begin
            q_async_rst <= d;
        end
    end

endmodule