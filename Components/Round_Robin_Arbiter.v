module round_robin_arbiter (
    input clk,
    input rst,
    input [2:0] requests,
    output reg [2:0] grants
);

    reg [1:0] count;

    always @(posedge clk) begin
        if (rst) begin
            grants <= 0;
            count <= 0;
        end
        else begin
            if (count == 2) begin
                count <= 0;
            end
            else begin
                if (requests != 0) begin
                    count <= count + 1;
                end
                else begin
                    count <= 0;
                end
            end
        end
    end

    always @(*) begin
        case (count)
            1: begin
                if (requests[0] == 1) begin
                    grants = 3'b001;
                end
                else if (requests[1] == 1) begin
                    grants = 3'b010;
                end
                else if (requests[2] == 1) begin
                    grants = 3'b100;
                end
            end
            2: begin
                if (requests[0] == 1) begin
                    if (requests[1] == 1) begin
                        grants = 3'b010;
                    end
                    else if (requests[2] == 1) begin
                        grants = 3'b100;
                    end
                end
                else if (requests[1] == 1) begin
                    if (requests[2] == 1) begin
                        grants = 3'b100;
                    end
                end
            end
            0: begin
                if (requests[0] == 1) begin
                    if (requests[1] == 1) begin
                        if (requests[2] == 1) begin
                            grants = 3'b100;
                        end
                    end
                end
            end
            // default: 
        endcase
    end
    
endmodule
