# RISC-V 3 stage pipeline Processor

In this repository, 3 stage pipelined Processor is implemented in
System Verilog. It has support of the following instruction:

i) R, I, B, S, LOADS, J and U types  
ii) CSR instructions

Moreover, it can also handle data hazards with forwarding and stalling. Flushing is also supported.  
  
Full documentation is given in docs folder.
# How to use this project
Clone the repository:

`https://github.com/AhsanAliUet/riscv-3-stage-pipelined-processor-core.git`  

Go the the folder sim. Write your assembly code in the file asm_code.s which you want to test on this processor. Note that assembly code should be error free.

Open powershell, bash or any other terminal and write:  

`make run`  

This will run your assembly program on this 3 stage processor. And also, will show you the results of register file and data memory on the terminal.  

If you want to see the waves which are produced by Processor as a result of your assembly program, just type:

`make wave`  

this will show you all the waves in gtkwave.  
If you find any issue regarding anything related to the processor, you can reach me at  

|Name|Email|
|----|-----|
|Ahsan|ahsan.uet.ee.115@gmail.com|

# Author
- [@Ahsan Ali](https://github.com/AhsanAliUet)
