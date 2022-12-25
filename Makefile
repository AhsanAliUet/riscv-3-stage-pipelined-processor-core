
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
RTL_FILE21 = csr_ops
RTL_FILE22 = csr_decoder

RTL_FILE23 = peripherals_bus

RTL_FILE24 = clock_div

RTL_FILE25 = ssd

UART_FILE1 = baud_counter
UART_FILE2 = bit_counter
UART_FILE3 = shift_register
UART_FILE4 = uart_fsm
UART_FILE5 = uart_tx
UART_FILE6 = uart_riscv_contr

UART_PATH = rtl/uart/


TB_FILE1  = tb_riscv_pipelined_top
TB_FILE2 = tb_clock_div
TB_PATH   = sim/
RTL_PATH  = rtl/
WAVE_PATH = docs/
WAVE_NAME = dump

TB_TARGET = tb_riscv_pipelined_top

conv_to_machine:  #converts assembly code to machine code

#this make does not call this makefile but in that folder
	cd docs/assembly_to_machine/ && $(MAKE)

gen_mem_file: conv_to_machine
	cp "sim/machine_codes.txt" "sim/machine_codes.mem"

compile:
	vlog -work work -vopt -sv -stats=none $(TB_PATH)$(TB_FILE1).sv $(TB_PATH)$(TB_FILE2).sv $(RTL_PATH)$(RTL_FILE1).sv $(RTL_PATH)$(RTL_FILE2).sv $(RTL_PATH)$(RTL_FILE3).sv $(RTL_PATH)$(RTL_FILE4).sv $(RTL_PATH)$(RTL_FILE5).sv $(RTL_PATH)$(RTL_FILE6).sv $(RTL_PATH)$(RTL_FILE7).sv $(RTL_PATH)$(RTL_FILE8).sv $(RTL_PATH)$(RTL_FILE9).sv $(RTL_PATH)$(RTL_FILE10).sv $(RTL_PATH)$(RTL_FILE11).sv $(RTL_PATH)$(RTL_FILE12).sv $(RTL_PATH)$(RTL_FILE13).sv $(RTL_PATH)$(RTL_FILE14).sv $(RTL_PATH)$(RTL_FILE15).sv $(RTL_PATH)$(RTL_FILE16).sv $(RTL_PATH)$(RTL_FILE17).sv $(RTL_PATH)$(RTL_FILE18).sv $(RTL_PATH)$(RTL_FILE19).sv $(RTL_PATH)$(RTL_FILE20).sv $(RTL_PATH)$(RTL_FILE21).sv $(RTL_PATH)$(RTL_FILE22).sv $(RTL_PATH)$(RTL_FILE23).sv $(UART_PATH)$(UART_FILE1).sv $(UART_PATH)$(UART_FILE2).sv $(UART_PATH)$(UART_FILE3).sv $(UART_PATH)$(UART_FILE4).sv $(UART_PATH)$(UART_FILE5).sv $(UART_PATH)$(UART_FILE6).sv $(RTL_PATH)$(RTL_FILE24).sv $(RTL_PATH)$(RTL_FILE25).sv

simulate:
	vsim -c -voptargs="+acc" work.$(TB_TARGET) -do "run -all; quit -sim; quit;"

wave:
	gtkwave $(WAVE_PATH)$(WAVE_NAME).vcd
	
run: conv_to_machine compile gen_mem_file
	make simulate
