
# RISCV 3 stage pipelined processor core
Fully implemented 3 staged pipelined RISC-V processor with hazard detection unit. Hazard detection unit solves the hazards by stalling and forwarding technique. CSR and MRET Instructions are also supported as they can configure and manage all the interrupt/exceptions.  

## Instruction Memory
The memory used for instructions in Xilinx parametrizable memory (xpm). We have used the following instatiation of xpm:  

```
   xpm_memory_spram #(
       .ADDR_WIDTH_A(10),             // DECIMAL
       .AUTO_SLEEP_TIME(0),           // DECIMAL
       .BYTE_WRITE_WIDTH_A(32),       // DECIMAL
       .ECC_MODE("no_ecc"),           // String
       .MEMORY_INIT_FILE("machine_codes.mem"), // String
       .MEMORY_INIT_PARAM("0"),       // String
       .MEMORY_OPTIMIZATION("true"),  // String
       .MEMORY_PRIMITIVE("block"),     // String
       .MEMORY_SIZE(2048),            // DECIMAL
       .MESSAGE_CONTROL(0),           // DECIMAL
       .READ_DATA_WIDTH_A(32),        // DECIMAL
       .READ_LATENCY_A(1),            // DECIMAL
       .READ_RESET_VALUE_A("0"),      // String
       .USE_MEM_INIT(1),              // DECIMAL
       .WAKEUP_TIME("disable_sleep"), // String
       .WRITE_DATA_WIDTH_A(32),       // DECIMAL
       .WRITE_MODE_A("read_first")    // String
    )
    xpm_memory_spram_inst (
       .dbiterra(dbiterra),             // 1-bit output: Status signal to indicate double bit error occurrence
                                        // on the data output of port A.
 
       .douta(inst_o),                   // READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
       .sbiterra(sbiterra),             // 1-bit output: Status signal to indicate single bit error occurrence
                                        // on the data output of port A.
 
       .addra({pc_final[9:2], 2'b0}),    // ADDR_WIDTH_A-bit input: Address for port A write and read operations.
       .clka(clk_i),                     // 1-bit input: Clock signal for port A.
       .dina(dina),                     // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
       .ena(1'b1),                       // 1-bit input: Memory enable signal for port A. Must be high on clock
                                        // cycles when read or write operations are initiated. Pipelined
                                        // internally.
 
       .injectdbiterra(injectdbiterra), // 1-bit input: Controls double bit error injection on input data when
                                        // ECC enabled (Error injection capability is not available in
                                        // "decode_only" mode).
 
       .injectsbiterra(injectsbiterra), // 1-bit input: Controls single bit error injection on input data when
                                        // ECC enabled (Error injection capability is not available in
                                        // "decode_only" mode).
 
       .regcea(1'b1),                 // 1-bit input: Clock Enable for the last register stage on the output
                                        // data path.
 
       .rsta(rsta),                     // 1-bit input: Reset signal for the final port A output register stage.
                                        // Synchronously resets output port douta to the value specified by
                                        // parameter READ_RESET_VALUE_A.
 
       .sleep(sleep),                   // 1-bit input: sleep signal to enable the dynamic power saving feature.
       .wea(1'b0)                        // WRITE_DATA_WIDTH_A-bit input: Write enable vector for port A input
                                        // data port dina. 1 bit wide when word-wide writes are used. In
                                        // byte-wide write configurations, each bit controls the writing one
                                        // byte of dina to address addra. For example, to synchronously write
                                        // only bits [15-8] of dina when WRITE_DATA_WIDTH_A is 32, wea would be
                                        // 4'b0010.
 
    );
```
## Update Instruction Memory

1. Go to the directory where .bit (bitstream file) is present:  

```
cd "path/to/the/folder/where/.bit/file/is/present"
```
Usually .bit file is in the folder <project_name.runs/impl_1>  

2. Place .mem file of updated instructions in that folder where .bit file is present.  

3. To update instructions from instruction memory, we do not need to synthesize our design rtl again. Rather, we have to update the bitstream file for this.  
Run the following command in tcl console of Xilinx Vivado (as we are using Nexys A7 FPGA of Xilinx):   

```
updatemem -force -debug -bit name_of_top_module.bit -meminfo name_of_top_module.mmi -data name_of_mem_file.mem -proc xpm_memory_spram_inst/xpm_memory_base_inst -out out.bit  
```

New bit stream file will be generated with name out.bit  
If you face issue using this, you can go to the link https://docs.xilinx.com/r/en-US/ug1580-updatemem/Using-UpdateMEM  

Also you can visit https://docs.xilinx.com/r/en-US/ug1580-updatemem/Using-XPM-Memory-in-Vivado  for how to use xpm in vivado.


## Author
- [@Ahsan Ali](https://github.com/AhsanAliUet)
