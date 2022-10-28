//top file of single cycle riscv

module riscv_pipelined_top #(
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

   logic [6:0] opcode_f;
   logic [6:0] opcode_m;
   assign opcode_f = inst_o[6:0];   //declaration and assignment on the same line is prohibited
   
   logic [DW-1:0] instr_d;
   logic [6:0] opcode_d;
   assign opcode_d = instr_d[6:0];   //declaration and assignment on the same line is prohibited
   // logic [REGW-1:0] rs1;
   // assign rs1 = instr_d[19:15];
   
   // logic [REGW-1:0] rs2;
   // assign rs2 = instr_d[24:20];
   
   // logic [REGW-1:0] rd;
   // assign rd = instr_d[11:7];
   
   logic [2:0] func3;
   assign func3 = inst_o[14:12];
   
   logic [6:0] func7;
   // assign func7 = inst_o[31:25];
   assign func7 = instr_d[31:25];

   logic [DW-1:0] rdata1;
   logic [DW-1:0] rdata2;
   logic [DW-1:0] alu_result;
   logic [DW-1:0] scr_b;              //signal to support I-type

   //control signals
   logic          reg_write;
   logic          mem_write;
   logic [2:0]    imm_src;
   logic          alu_src;
   logic          alu_src_a;
   logic [1:0]    wb_sel;
   // logic [1:0]    alu_op;

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

   logic [3:0]          mask;

   //write back signals
   logic [REG_SIZE-1:0] data_wb;
   logic [REG_SIZE-1:0] pc_plus_4;

   //branch condition checker
   logic br_taken;

   //
   logic [DW-1:0] pc_target;

   //pipelined signals
   logic [DW-1:0] pc_d;
   // logic [DW-1:0] instr_f;
   // logic [DW-1:0] instr_d;
   // logic [DW-1:0] pc_plus_4_f;
   logic [DW-1:0] pc_plus_4_d;

   logic [DW-1:0] alu_out_e;
   logic [DW-1:0] alu_out_m;
   logic [DW-1:0] write_data_e;
   logic [DW-1:0] write_data_m;
   // logic [DW-1:0] rd_e;
   logic [REGW-1:0] rd_m;
   // logic [DW-1:0] pc_plus_4_e;
   logic [DW-1:0] pc_plus_4_m;

   logic reg_write_d;
   logic reg_write_m;
   // logic [1:0] wb_sel_d;
   logic [1:0] wb_sel_m;
   // logic mem_write_d;
   logic mem_write_m;

   logic [2:0] func3_m;

   logic [DW-1:0] imm_ext_d;

   logic [DW-1:0] instr_m;
   //forwarding unit signals
   logic forward_a;
   logic forward_b;
   logic [DW-1:0] going_in_alu_a;
   logic [DW-1:0] going_in_alu_b;

pc #(
   .DW(DW)
)i_pc(
   .clk_i(clk_i),
   .rst_i(rst_i),
   .pc_next(pc_target),
   .pc(pc)
);

pipeline_reg_1 #(
   .DW(DW)
)i_pipeline_reg_1(
   .clk_i      (clk_i),
   .rst_i      (rst_i),
   
   .instr_f    (inst_o),       //instruction in fetch stage
   .instr_d    (instr_d),      //instruction in decode stage

   .pc_f       (pc),           //PC in fetch stage
   .pc_d       (pc_d),         //PC in decode stage

   .pc_plus_4_f(pc_plus_4),    //PC plus 4 in fetch stage
   .pc_plus_4_d(pc_plus_4_d),   //PC plus 4 in decode stage
   .imm_ext_f(imm_ext),
   .imm_ext_d(imm_ext_d)

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
   // .rst_i(rst_i),
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

   .we(reg_write_m),
   .raddr1_i(instr_d[19:15]),
   .rdata1_o(rdata1),

   .raddr2_i(instr_d[24:20]),
   .rdata2_o(rdata2),

   .waddr_i(rd_m),
   .wdata_i(data_wb)
);

imm_generator #(
   .DW(DW)
)i_imm_generator(
   .inst(instr_d),   //inst_o
   .s(imm_src),
   .imm_ext(imm_ext)
);

mux_2x1 #(
   .DW(DW)
)i_mux_i_type(
   .in0(going_in_alu_b),
   .in1(imm_ext),   //imm_ext_d
   .s(alu_src),
   .out(scr_b)
);

branch_checker #(
   .REG_SIZE(REG_SIZE)
)i_branch_checker(
   .rdata1(going_in_alu_a),    //rdata1
   .rdata2(going_in_alu_b),    //rdata2
   .opcode(opcode_d),
   .func3(instr_d[14:12]),   //func3_d and not func3
   .br_taken(br_taken)
);

mux_2x1 #(
   .DW(DW)
)i_mux_branch_pc(
   .in0(pc_d),
   .in1(going_in_alu_a),   //rdata1
   .s(alu_src_a),                //according to Sir M. Tahir
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
   .opcode(opcode_d),  //opcode
   .func3(func3),
   .func7_5(func7[5]),

   .alu_control(alu_control)
);

alu_new #(   //reduced hardware
   .DW(DW)
)i_alu_new(
   .opcode(opcode_d),   //opcode
   .func7_5(func7[5]),

   .alu_operand_1_i(alu_operand_1),
   .alu_operand_2_i(scr_b),
   .alu_control(alu_control),
   .alu_result_o(alu_result)
);

mux_2x1 #(
   .DW(DW)
)i_mux_forward_a(
   .in0(rdata1),
   .in1(alu_out_m),
   .s(forward_a),
   .out(going_in_alu_a)
);
mux_2x1 #(
   .DW(DW)
)i_mux_forward_b(
   .in0(rdata2),
   .in1(alu_out_m),
   .s(forward_b),
   .out(going_in_alu_b)
);

pipeline_reg_2 #(
   .DW(DW),
   .REGW(REGW)
)i_pipeline_reg_2(
   .clk_i        (clk_i),
   .rst_i        (rst_i),
   
   .alu_out_e    (alu_result),
   .alu_out_m    (alu_out_m),

   .write_data_e (rdata2),
   .write_data_m (write_data_m),

   .rd_e         (instr_d[11:7]),
   .rd_m         (rd_m),

   .pc_plus_4_e  (pc_plus_4_d),    //because decode and execute stages are same
   .pc_plus_4_m  (pc_plus_4_m),

   .reg_write_d  (reg_write),
   .wb_sel_d     (wb_sel),
   .mem_write_d  (mem_write),

   .reg_write_m  (reg_write_m),
   .wb_sel_m     (wb_sel_m),
   .mem_write_m  (mem_write_m),

   .opcode_d(opcode_d),
   .opcode_m(opcode_m),

   .func3_d(func3),
   .func3_m(func3_m),

   .instr_d(instr_d),
   .instr_m(instr_m)
);


lsu #(
   .DW(DW)
)i_lsu(
   .opcode(instr_m[6:0]),
   .func3(instr_m[14:12]),        //func3

   .addr_in(alu_out_m),    //alu_result
   .addr_out(addr_data_mem),    

   .data_s(write_data_m),
   .data_s_o(data_s_o),

   .data_l(rdata_data_mem),
   .data_l_o(data_l_o),
   .mask(mask)
);

data_mem #(
   .REG_SIZE(REG_SIZE),
   .MEM_SIZE_IN_KB(MEM_SIZE_IN_KB),
   .NO_OF_REGS(NO_OF_REGS)
)i_data_mem(
   .clk_i(clk_i),
   .rst_i(rst_i),
   .we(mem_write_m),
   .cs(1'b0),         //Only one data memory, so always select it
   .mask(mask),
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
   .in0(alu_out_m),   //alu_result
   .in1(data_l_o),
   .in2(pc_plus_4_m),        //for jumps and non-jumps (Branches also)
   .in3(32'h0),
   .s(wb_sel_m),
   .out(data_wb)
);

forwarding_unit
i_forwarding_unit(
   .rs1_e(instr_d[19:15]),
   .rs2_e(instr_d[24:20]),
   .rd_m(instr_m[11:7]),
   .reg_write_m(reg_write_m),
   .forward_a(forward_a),
   .forward_b(forward_b)
);

main_decoder i_main_decoder(
   .opcode(opcode_d),   //opcode
   
   .reg_write(reg_write),
   .mem_write(mem_write),
   .imm_src(imm_src),
   .alu_src(alu_src),
   .alu_src_a(alu_src_a),
   .wb_sel(wb_sel)
);

endmodule