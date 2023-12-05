module task1 #(parameter WIDTH = 5) (
    input clk, en, ld, rst,
    input [WIDTH-1:0] cnt_in,
    output reg [WIDTH-1:0] cnt_out
);

    always @(posedge clk) begin
        if (rst) begin
            cnt_out <= 0;
        end
        else begin
            if (ld) begin
                cnt_out <= cnt_in;
            end
            else begin
                if (en) begin
                    cnt_out <= cnt_out + 1;
                end
            end
        end
    end

endmodule