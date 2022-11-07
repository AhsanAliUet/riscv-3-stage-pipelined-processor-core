//test bench for top file of riscv

module tb_riscv_pipelined_top();
   parameter DW = 32;
   parameter REG_SIZE = 32;
   parameter NO_OF_REGS_REG_FILE = 32;
   parameter REGW = $clog2(REG_SIZE);
   parameter MEM_SIZE_IN_KB = 1;
   parameter NO_OF_REGS = MEM_SIZE_IN_KB * 1024 / 4;
   parameter ADDENT = 4;

   logic clk_i;
   logic rst_i;

riscv_pipelined_top #(
   .DW(DW),
   .REG_SIZE(REG_SIZE),
   .NO_OF_REGS_REG_FILE(NO_OF_REGS_REG_FILE),
   .REGW(REGW),
   .MEM_SIZE_IN_KB(MEM_SIZE_IN_KB),
   .NO_OF_REGS(NO_OF_REGS),
   .ADDENT(ADDENT)

)i_riscv_pipelined_top(
   .clk_i(clk_i),
   .rst_i(rst_i)
);

   initial begin
      clk_i = 0;
      forever begin
         #5; clk_i = ~clk_i;
      end
   end

   initial begin
      fork
         reset();
      join
   end

   task reset();
                        rst_i <=    0;
      @(posedge clk_i); rst_i <= #1 1;   //#4, because we do want instruction to come if there is reset
                    #7; rst_i <= #1 0;
   endtask

   initial begin
      repeat(100) begin
         $display("PC = %3d, Instr = %8h, forward_a = %0b, forward_b = %0b, reg_write = %0b", i_riscv_pipelined_top.pc_d, i_riscv_pipelined_top.instr_d, i_riscv_pipelined_top.forward_a, i_riscv_pipelined_top.forward_b, i_riscv_pipelined_top.reg_write_m);
         $display("Instruction: %8h, asm: %s\n\n", i_riscv_pipelined_top.instr_d, print(i_riscv_pipelined_top.instr_d));
         @(posedge clk_i);
      end
   end

   initial begin
      #200;
      //seeing the contents of register file
      $display("=============== Register file is: ===============");
      for (int i=0; i<21; i++) begin
         $display("x%0d = 0x%8h", i, i_riscv_pipelined_top.i_reg_file.reg_file[i]);
      end

      // #200;
      //seeing the contents of data memory
      $display("\n\n=============== Data memory is: ===============");
      for (int i=0; i<21; i++) begin
         $display("x%0d = 0x%8h", i, i_riscv_pipelined_top.i_data_mem.data_mem[i]);
      end

      #2000;
      $finish;
   end

   function string print(logic [DW-1:0] instruction);
      string as;
      case(instruction)
         32'h00400193: as = "addi x3, x0, 4";
         32'h0801c463: as = "blt x3, x0, 136";
         32'h00000033: as = "add x0, x0, x0";
         32'h06018e63: as = "beq x3, x0, 124";
         32'h00200093: as = "addi x1, x0, 2";
         32'h06118e63: as = "beq x3, x1, two";
         32'h00300233: as = "add x4, x0, x3";
         32'h00300133: as = "add x2, x0, x3";
         32'h00128293: as = "addi x5, x5, 1";
         32'hfff10113: as = "addi x2, x2, -1";
         32'h004001b3: as = "add x3, x0, x4";
         32'h0280006f: as = "j multiply";
         32'hfe1116e3: as = "bne x2, x1, find";
         32'h0480006f: as = "j stop";
         32'h00320233: as = "add x4, x4, x3";
         32'h002003b3: as = "add x7, x0, x2";
         32'hfff38393: as = "addi x7, x7, -1";
         32'hfe539ce3: as = "bne x7, x5, multiply1";
         32'hfcdff06f: as = "j done";
         32'h00100213: as = "addi x4, x0, 1";

      endcase
      print = as;
   endfunction
endmodule