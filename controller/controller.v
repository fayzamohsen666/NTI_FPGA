module controller(
  input wire zero,
  input wire [2:0] phase,
  input wire [2:0] opcode,
  
  output reg sel, 
  output reg rd, 
  output reg ld_ir, 
  output reg halt,
  output reg inc_pc, 
  output reg ld_ac, 
  output reg wr,
  output reg ld_pc, 
  output reg data_e 
);

  localparam integer HLT=0, SKZ=1, ADD=2, AND=3, XOR=4, LDA=5, STO=6, JMP=7;
  
  localparam integer INST_ADDR=0, INST_FETCH=1, INST_LOAD=2, IDLE=3, OP_ADDR=4, 
                     OP_FETCH=5, ALU_OP=6, STORE=7; 
					 
  always @(*) begin

    sel    = 0;
    rd     = 0;
    ld_ir  = 0;
    halt   = 0;
    inc_pc = 0;
    ld_ac  = 0;
    wr     = 0;
    ld_pc  = 0;
    data_e = 0;

    case (phase)

        INST_ADDR: 
            sel = 1;

        INST_FETCH: 
		  begin
            sel = 1;
            rd  = 1;
          end

        INST_LOAD: 
		  begin
            sel   = 1;
            rd    = 1;
            ld_ir = 1;
          end

        IDLE: 
		  begin
            sel   = 1;
            rd    = 1;
            ld_ir = 1;
          end

        OP_ADDR: 
		  begin
            halt   = (opcode == HLT);
            inc_pc = 1;
          end

        OP_FETCH: 
            rd = (opcode == ADD) ||
                 (opcode == AND) ||
                 (opcode == XOR) ||
                 (opcode == LDA);

        ALU_OP: 
		  begin
            rd = (opcode == ADD) ||
                 (opcode == AND) ||
                 (opcode == XOR) ||
                 (opcode == LDA);

            inc_pc  = (opcode == SKZ) && zero;
            ld_pc   = (opcode == JMP);
            data_e  = (opcode == STO);
          end

        STORE: 
		  begin
            rd = (opcode == ADD) ||
                 (opcode == AND) ||
                 (opcode == XOR) ||
                 (opcode == LDA);

            ld_ac = (opcode == ADD) ||
                    (opcode == AND) ||
                    (opcode == XOR) ||
                    (opcode == LDA);

            ld_pc  = (opcode == JMP);
            wr     = (opcode == STO);
            data_e = (opcode == STO);
          end

    endcase

  end

endmodule