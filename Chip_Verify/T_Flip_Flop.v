module TFF (
    input clk, t,
    output reg q
);

    initial q = 0;

    always @ (posedge clk)
        if (t)
            q <= ~q;
        else
            q <= q;
    
    always @ (negedge clk)
        if (t)
            q = 1;
        else
            q = 0;

endmodule