module DFF (
    input clk,d,
    output q,qn
);

    reg q;
    
    always @(posedge clk)
        begin
            q <= d;
        end

    assign qn = ~q;

endmodule

module RippleCounter4Bit (
    input clk,
    output [3:0] out
);

    wire q0, q1, q2, q3;
    wire qn0, qn1, qn2, qn3;

    DFF DFF0(clk,qn0,q0,qn0);
    DFF DFF1(q0,qn1,q1,qn1);
    DFF DFF2(q1,qn2,q2,qn2);
    DFF DFF3(q2,qn3,q3,qn3);

    assign out = {q3,q2,q1,q0};

endmodule