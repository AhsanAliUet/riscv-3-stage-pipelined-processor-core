
RTL_FILE1  = adder
RTL_FILE2  = alu_decoder
RTL_FILE3  = alu_new
RTL_FILE4  = alu
RTL_FILE5  = branch_checker
RTL_FILE6  = data_mem
RTL_FILE7  = riscv_pkg
RTL_FILE8  = imm_generator
RTL_FILE9  = inst_mem
RTL_FILE10 = lsu
RTL_FILE11 = main_decoder
RTL_FILE12 = mux_2x1
RTL_FILE13 = mux_4x1
RTL_FILE14 = pc
RTL_FILE15 = pipeline_reg_1
RTL_FILE16 = pipeline_reg_2
RTL_FILE17 = reg_file
RTL_FILE18 = riscv_pipelined_top
RTL_FILE19 = forwarding_unit

RTL_FILE20 = csr_regs

TB_FILE1  = tb_riscv_pipelined_top
TB_PATH   = sim/
RTL_PATH  = rtl/

compile:
	vlog -work work -vopt -sv -stats=none $(TB_PATH)$(TB_FILE1).sv $(RTL_PATH)$(RTL_FILE1).sv $(RTL_PATH)$(RTL_FILE2).sv $(RTL_PATH)$(RTL_FILE3).sv $(RTL_PATH)$(RTL_FILE4).sv $(RTL_PATH)$(RTL_FILE5).sv $(RTL_PATH)$(RTL_FILE6).sv $(RTL_PATH)$(RTL_FILE7).sv $(RTL_PATH)$(RTL_FILE8).sv $(RTL_PATH)$(RTL_FILE9).sv $(RTL_PATH)$(RTL_FILE10).sv $(RTL_PATH)$(RTL_FILE11).sv $(RTL_PATH)$(RTL_FILE12).sv $(RTL_PATH)$(RTL_FILE13).sv $(RTL_PATH)$(RTL_FILE14).sv $(RTL_PATH)$(RTL_FILE15).sv $(RTL_PATH)$(RTL_FILE16).sv $(RTL_PATH)$(RTL_FILE17).sv $(RTL_PATH)$(RTL_FILE18).sv $(RTL_PATH)$(RTL_FILE19).sv $(RTL_PATH)$(RTL_FILE20).sv

simulate:
	vsim -c -voptargs="+acc" work.$(TB_FILE1) -do "run -all; quit -sim; quit;"

run:
	make compile
	make simulate
