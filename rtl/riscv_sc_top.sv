//top file of single cycle riscv

module riscv_sc_top #(
   parameter DW = 32,
   parameter REG_SIZE = 32,
   parameter NO_OF_REGS_REG_FILE = 32,
   parameter REGW = $clog2(REG_SIZE),
   parameter MEM_SIZE_IN_KB = 1,
   parameter NO_OF_REGS = MEM_SIZE_IN_KB * 1024 / 4,
   parameter ADDENT = 4

)(
   input  logic clk_i,
   input  logic rst_i
);

   logic [DW-1:0] pc_next;
   logic [DW-1:0] pc;
   logic [DW-1:0] inst_o;

   logic [6:0] opcode;
   assign opcode = inst_o[6:0];   //declaration and assignment on the same line is prohibited
   
   logic [REGW-1:0] rs1;
   assign rs1 = inst_o[19:15];
   
   logic [REGW-1:0] rs2;
   assign rs2 = inst_o[24:20];
   
   logic [REGW-1:0] rd;
   assign rd = inst_o[11:7];
   
   logic [2:0] func3;
   assign func3 = inst_o[14:12];
   
   logic [6:0] func7;
   assign func7 = inst_o[31:25];

   logic [DW-1:0] rdata1;
   logic [DW-1:0] rdata2;
   logic [DW-1:0] alu_result;
   logic [DW-1:0] scr_b;              //signal to support I-type

   //control signals
   logic          reg_write;
   logic          mem_write;
   logic [2:0]    imm_src;
   logic          alu_src;
   logic [1:0]    wb_sel;
   logic [1:0]    alu_op;

   //extend unit signls
   logic [DW-1:0] imm_ext;

   //alu signals
   logic [DW-1:0] alu_operand_1;
   logic [2:0]    alu_control;

   //data memory signals
   logic [REG_SIZE-1:0] rdata_data_mem;
   logic [DW-1:0]       addr_data_mem;
   logic [DW-1:0]       data_l_o;
   logic [DW-1:0]       data_s_o;

   //write back signals
   logic [REG_SIZE-1:0] data_wb;
   logic [REG_SIZE-1:0] pc_plus_4;

   //branch condition checker
   logic br_taken;

   //
   logic [DW-1:0] pc_target;

pc #(
   .DW(DW)
)i_pc(
   .clk_i(clk_i),
   .rst_i(rst_i),
   .pc_next(pc_target),
   .pc(pc)
);

mux_2x1 #(           //the mux to select PC+4 or PC+Target
   .DW(DW)
)i_mux_pc(
   .in0(pc_next),
   .in1(alu_result),
   .s(br_taken),

   .out(pc_target)
);

adder #(
   .DW(DW),
   .ADDENT(ADDENT)
)i_adder(
   .in(pc),
   .out(pc_next)
);

inst_mem #(
   .REG_SIZE(REG_SIZE),
   .MEM_SIZE_IN_KB(MEM_SIZE_IN_KB),
   .NO_OF_REGS(NO_OF_REGS)
)i_inst_mem(
   .addr_i(pc),
   .inst_o(inst_o)
);

reg_file #(
   .REG_SIZE(REG_SIZE),
   .NO_OF_REGS(NO_OF_REGS_REG_FILE),
   .REGW(REGW)
)i_reg_file(
   .clk_i(clk_i),
   .rst_i(rst_i),

   .we(reg_write),
   .raddr1_i(rs1),
   .rdata1_o(rdata1),

   .raddr2_i(rs2),
   .rdata2_o(rdata2),

   .waddr_i(rd),
   .wdata_i(data_wb)
);

imm_generator #(
   .DW(DW)
)i_imm_generator(
   .inst(inst_o),
   .s(imm_src),
   .imm_ext(imm_ext)
);

mux_2x1 #(
   .DW(DW)
)i_mux_i_type(
   .in0(rdata2),
   .in1(imm_ext),
   .s(alu_src),
   .out(scr_b)
);

branch_checker #(
   .REG_SIZE(REG_SIZE)
)i_branch_checker(
   .rdata1(rdata1),
   .rdata2(rdata2),
   .opcode(opcode),
   .func3(func3),
   .br_taken(br_taken)
);

mux_2x1 #(
   .DW(DW)
)i_mux_branch_pc(
   .in0(pc),
   .in1(rdata1),
   .s(!br_taken),                //according to Sir M. Tahir
   .out(alu_operand_1)
);

// alu #(   //non-reduced hardware
//    .DW(DW)
// )i_alu(
//    .opcode(opcode),
//    .func3(func3),
//    .func7_5(func7[5]),
//    .alu_operand_1_i(alu_operand_1),
//    .alu_operand_2_i(scr_b),
//    .alu_result_o(alu_result)
// );

alu_decoder #(
   .DW(DW)
)i_alu_decoder(
   .opcode(opcode),
   .func3(func3),
   .func7_5(func7[5]),

   .alu_control(alu_control)
);

alu_new #(   //reduced hardware
   .DW(DW)
)i_alu_new(
   .opcode(opcode),
   .func7_5(func7[5]),

   .alu_operand_1_i(alu_operand_1),
   .alu_operand_2_i(scr_b),
   .alu_control(alu_control),
   .alu_result_o(alu_result)
);

lsu #(
   .DW(DW)
)i_lsu(
   .opcode(opcode),
   .func3(func3),

   .addr_in(alu_result),
   .addr_out(addr_data_mem),    

   .data_s(rdata2),
   .data_s_o(data_s_o),

   .data_l(rdata_data_mem),
   .data_l_o(data_l_o)
);

data_mem #(
   .REG_SIZE(REG_SIZE),
   .MEM_SIZE_IN_KB(MEM_SIZE_IN_KB),
   .NO_OF_REGS(NO_OF_REGS)
)i_data_mem(
   .clk_i(clk_i),
   .rst_i(rst_i),
   .we(mem_write),
   .cs(1'b0),         //Only one data memory, so always select it
   .addr_i(addr_data_mem),
   .wdata_i(data_s_o),
   .rdata_o(rdata_data_mem)
);

adder #(
   .DW(DW),
   .ADDENT(ADDENT)
)i_adder_j(
   .in(pc),
   .out(pc_plus_4)
);

mux_4x1 #(
   .DW(DW)
)i_mux_wb(
   .in0(alu_result),
   .in1(data_l_o),
   .in2(pc_plus_4),        //for jumps and non-jumps (Branches also)
   .in3(32'h0),
   .s(wb_sel),
   .out(data_wb)
);

main_decoder i_main_decoder(
   .opcode(opcode),
   
   .reg_write(reg_write),
   .mem_write(mem_write),
   .imm_src(imm_src),
   .alu_src(alu_src),
   .wb_sel(wb_sel),

   .alu_op(alu_op)
);

endmodule