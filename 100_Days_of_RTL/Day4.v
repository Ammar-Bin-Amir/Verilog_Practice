/*
Design and verify a 8-bit ALU which supports the following encoded operations:

Encoding	Operation	Comment
3'b000	    ADD	        -
3'b001	    SUB	        -
3'b010	    SLL	        Vector a should left shift using bits 2:0 of vector b
3'b011	    LSR	        Vector a should right shift using bits 2:0 of vector b
3'b100	    AND	        -
3'b101	    OR	        -
3'b110	    XOR	        -
3'b111	    EQL	        Output should be 1 when equal otherwise 0
*/

module day4 (
    input [7:0] in1, in2,
    input [2:0] opcode,
    output reg [7:0] out
);
    
    parameter ADD = 3'b000;
    parameter SUB = 3'b001;
    parameter SLL = 3'b010;
    parameter LSR = 3'b011;
    parameter AND = 3'b100;
    parameter OR = 3'b101;
    parameter XOR = 3'b110;
    parameter EQL = 3'b111;

    always @(*) begin
        case (opcode)
            ADD: out = in1 + in2;
            SUB: out = in1 - in2;
            SLL: out = in1[7:0] << in2[2:0];
            LSR: out = in1[7:0] >> in2[2:0];
            AND: out = in1 & in2;
            OR: out = in1 | in2;
            XOR: out = in1 ^ in2;
            EQL: out = (in1 == in2) ? 1 : 0;
        endcase
    end

endmodule