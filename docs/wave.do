onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_riscv_pipelined_top/clk_i
add wave -noupdate /tb_riscv_pipelined_top/rst_i
add wave -noupdate /tb_riscv_pipelined_top/print/instruction
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/clk_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/rst_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/pc_next
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/pc
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/inst_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/opcode_f
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/opcode_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/instr_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/opcode_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/func3
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/func7
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/rdata1
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/rdata2
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/alu_result
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/scr_b
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/reg_write
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/mem_write
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/imm_src
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/alu_src
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/alu_src_a
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/wb_sel
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/csr_we
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/csr_re
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/imm_ext
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/alu_operand_1
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/alu_control
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/rdata_data_mem
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/addr_data_mem
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/data_l_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/data_s_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/mask
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/data_wb
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/pc_plus_4
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/br_taken
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/pc_target
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/pc_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/pc_plus_4_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/alu_out_e
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/alu_out_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/write_data_e
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/write_data_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/rd_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/pc_plus_4_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/reg_write_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/reg_write_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/wb_sel_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/mem_write_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/func3_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/imm_ext_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/instr_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/imm_csr_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/imm_csr_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/pc_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/rs1_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/forward_a
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/forward_b
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/stall_fd
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/stall_mw
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/flush
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/going_in_alu_a
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/going_in_alu_b
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/epc
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/data_csr_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/csr_we_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/csr_re_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/intr
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pc/clk_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pc/rst_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pc/stall
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pc/pc_next
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pc/pc
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/clk_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/rst_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/stall
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/flush
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/instr_f
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/instr_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/pc_f
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/pc_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/pc_plus_4_f
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/pc_plus_4_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/imm_ext_f
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_1/imm_ext_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_pc/in0
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_pc/in1
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_pc/s
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_pc/out
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_adder/in
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_adder/out
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_inst_mem/addr_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_inst_mem/inst_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_reg_file/clk_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_reg_file/rst_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_reg_file/we
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_reg_file/raddr1_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_reg_file/rdata1_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_reg_file/raddr2_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_reg_file/rdata2_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_reg_file/waddr_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_reg_file/wdata_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_imm_generator/inst
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_imm_generator/s
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_imm_generator/imm_ext
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_i_type/in0
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_i_type/in1
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_i_type/s
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_i_type/out
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_branch_checker/rdata1
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_branch_checker/rdata2
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_branch_checker/opcode
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_branch_checker/func3
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_branch_checker/br_taken
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_branch_pc/in0
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_branch_pc/in1
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_branch_pc/s
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_branch_pc/out
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_decoder/opcode
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_decoder/func3
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_decoder/func7_5
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_decoder/alu_control
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_new/opcode
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_new/func7_5
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_new/alu_operand_1_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_new/alu_operand_2_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_new/alu_control
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_new/alu_result_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_new/operand_2
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_new/operand_2_srl_sra
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_alu_new/temp
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_forward_a/in0
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_forward_a/in1
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_forward_a/s
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_forward_a/out
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_forward_b/in0
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_forward_b/in1
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_forward_b/s
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_forward_b/out
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/clk_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/rst_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/stall
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/alu_out_e
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/alu_out_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/write_data_e
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/write_data_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/rd_e
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/rd_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/pc_plus_4_e
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/pc_plus_4_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/pc_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/pc_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/reg_write_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/wb_sel_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/mem_write_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/reg_write_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/wb_sel_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/mem_write_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/opcode_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/opcode_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/func3_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/func3_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/instr_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/instr_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/imm_csr_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/imm_csr_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/csr_we_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/csr_we_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/csr_re_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/csr_re_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/rs1_d
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_pipeline_reg_2/rs1_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/opcode
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/func3
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/addr_in
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/addr_out
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/data_s
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/data_s_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/data_l
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/data_l_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/mask
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/rdata_byte
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/rdata_hword
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_lsu/rdata_word
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_data_mem/clk_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_data_mem/rst_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_data_mem/we
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_data_mem/cs
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_data_mem/mask
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_data_mem/addr_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_data_mem/wdata_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_data_mem/rdata_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/clk_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/rst_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/intr
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/addr
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/we
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/re
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/data_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/pc_i
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/epc_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/data_o
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/mstatus_ff
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/mie_ff
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/mtvec_ff
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/mepc_ff
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/mcause_ff
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_csr_regs/mip_ff
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_adder_j/in
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_adder_j/out
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_wb/in0
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_wb/in1
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_wb/in2
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_wb/in3
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_wb/s
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_mux_wb/out
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/rs1_e
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/rs2_e
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/rd_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/reg_write_m
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/wb_sel_0
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/br_taken
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/forward_a
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/forward_b
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/stall_mw
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/stall_fd
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_forwarding_unit/flush
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/opcode
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/reg_write
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/mem_write
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/imm_src
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/alu_src
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/alu_src_a
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/wb_sel
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/csr_we
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/csr_re
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/jump
add wave -noupdate /tb_riscv_pipelined_top/i_riscv_pipelined_top/i_main_decoder/branch
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {6034 ns}
