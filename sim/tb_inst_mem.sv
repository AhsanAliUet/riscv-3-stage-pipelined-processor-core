//test bench for instruction memory

module tb_inst_mem();
   parameter REG_SIZE = 32;
   parameter MEM_SIZE_IN_KB = 1;   //size of the instruction memory
   parameter NO_OF_REGS = MEM_SIZE_IN_KB * 1024 / 4;    //4 bytes in 32 bits

   logic [REG_SIZE-1:0] addr_i;     //PC will be given in place of it
   logic [REG_SIZE-1:0] inst_o;


inst_mem #(
   .REG_SIZE(REG_SIZE),
   .MEM_SIZE_IN_KB(MEM_SIZE_IN_KB),
   .NO_OF_REGS(NO_OF_REGS)
)i_inst_mem(
   .addr_i(addr_i),     //PC will be given in place of it
   .inst_o(inst_o)
);

   initial begin
      #0; addr_i = 0;
      #5; addr_i = 4;
      #5; addr_i = 8;
      #5; addr_i = 12;
   end

endmodule