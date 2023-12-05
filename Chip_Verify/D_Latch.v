module DLatch (
    input en, d, rst,
    output reg q
);

    always @ (en or d or rst)
        if (rst)
            q <= 0;
        else
            if (en)
                q <= d;
            else
                q <= q;

endmodule