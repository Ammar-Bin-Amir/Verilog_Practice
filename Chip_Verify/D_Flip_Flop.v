module DFF (
    input clk, rst, d,
    output q
);

    reg q;

    always @ (posedge clk)
        if (!rst)
            q <= 0;
        else
            q <= d;

endmodule