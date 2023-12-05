module task2 (
    input clk, rst_, zero, 
    input [2:0] opcode,
    output reg mem_rd, load_ir, halt, inc_pc, load_ac, load_pc, mem_wr
);

    parameter HLT = 0;
    parameter SKZ = 1;
    parameter ADD = 2;
    parameter AND = 3;
    parameter XOR = 4;
    parameter LDA = 5;
    parameter STO = 6;
    parameter JMP = 7;

    reg [2:0] current_state, next_state;

    parameter INST_ADDR = 3'b000;
    parameter INST_FETCH = 3'b001;
    parameter INST_LOAD = 3'b010;
    parameter IDLE = 3'b011;
    parameter OP_ADDR = 3'b100;
    parameter OP_FETCH = 3'b101;
    parameter ALU_OP = 3'b110;
    parameter STORE = 3'b111;
    
    always @(posedge clk or negedge rst_) begin
        if (!rst_) begin
            current_state <= INST_ADDR;
        end
        else begin
           current_state <= next_state;
        end
    end

    always @(*) begin
        case (current_state)
            INST_ADDR: begin
                next_state = INST_FETCH;
                mem_rd = 0;
                load_ir = 0;
                halt = 0;
                inc_pc = 0;
                load_ac = 0;
                load_pc = 0;
                mem_wr = 0;
            end
            INST_FETCH: begin
                next_state = INST_LOAD;
                mem_rd = 1;
                load_ir = 0;
                halt = 0;
                inc_pc = 0;
                load_ac = 0;
                load_pc = 0;
                mem_wr = 0;
            end
            INST_LOAD: begin
                next_state = IDLE;
                mem_rd = 1;
                load_ir = 1;
                halt = 0;
                inc_pc = 0;
                load_ac = 0;
                load_pc = 0;
                mem_wr = 0;
            end
            IDLE: begin
                next_state = OP_ADDR;
                mem_rd = 1;
                load_ir = 1;
                halt = 0;
                inc_pc = 0;
                load_ac = 0;
                load_pc = 0;
                mem_wr = 0;
            end
            OP_ADDR: begin
                next_state = OP_FETCH;
                mem_rd = 0;
                load_ir = 0;
                if (opcode == HLT) halt = 1;
                else halt = 0;
                inc_pc = 1;
                load_ac = 0;
                load_pc = 0;
                mem_wr = 0;
            end
            OP_FETCH: begin
                next_state = ALU_OP;
                if ((opcode == ADD) || (opcode == AND) || (opcode == XOR) || (opcode == LDA)) mem_rd = 1;
                else mem_rd = 0;
                load_ir = 0;
                halt = 0;
                inc_pc = 0;
                load_ac = 0;
                load_pc = 0;
                mem_wr = 0;
            end
            ALU_OP: begin
                next_state = STORE;
                if ((opcode == ADD) || (opcode == AND) || (opcode == XOR) || (opcode == LDA)) mem_rd = 1;
                else mem_rd = 0;
                load_ir = 0;
                halt = 0;
                if ((opcode == SKZ) && (zero)) inc_pc = 1;
                else inc_pc = 0;
                if ((opcode == ADD) || (opcode == AND) || (opcode == XOR) || (opcode == LDA)) load_ac = 1;
                else load_ac = 0;
                if (opcode == JMP) load_pc = 1;
                else load_pc = 0;
                mem_wr = 0;
            end
            STORE: begin
                next_state = INST_ADDR;
                if ((opcode == ADD) || (opcode == AND) || (opcode == XOR) || (opcode == LDA)) mem_rd = 1;
                else mem_rd = 0;
                load_ir = 0;
                halt = 0;
                if (opcode == JMP) inc_pc = 1;
                else inc_pc = 0;
                if ((opcode == ADD) || (opcode == AND) || (opcode == XOR) || (opcode == LDA)) load_ac = 1;
                else load_ac = 0;
                if (opcode == JMP) load_pc = 1;
                else load_pc = 0;
                if (opcode == STO) mem_wr = 1; 
            end
            default: next_state = INST_ADDR;
        endcase
    end

endmodule