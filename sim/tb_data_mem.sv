//test bench for data memory

module tb_data_mem();
   parameter REG_SIZE = 32;
   parameter MEM_SIZE_IN_KB = 1;
   parameter NO_OF_REGS = MEM_SIZE_IN_KB * 1024 / 4;

   logic                clk_i;
   logic                rst_i;
   logic                we;
   logic [REG_SIZE-1:0] addr_i;     //PC will be given in place of it
   logic [REG_SIZE-1:0] wdata_i;
   logic [REG_SIZE-1:0] rdata_o;

data_mem #(
   .REG_SIZE(REG_SIZE),
   .MEM_SIZE_IN_KB(MEM_SIZE_IN_KB),
   .NO_OF_REGS(NO_OF_REGS)
)i_data_mem(
   .clk_i(clk_i),
   .rst_i(rst_i),
   .we(we),
   .addr_i(addr_i),
   .wdata_i(wdata_i),
   .rdata_o(rdata_o)
);

   initial begin
      clk_i = 0;
      forever begin
         #5; clk_i = ~clk_i;
      end
   end

   initial begin
      #0; rst_i = 0;
      @(posedge clk_i); rst_i   = 1;
      @(posedge clk_i); rst_i   = 0;
      @(posedge clk_i); addr_i  = 0; we = 1; wdata_i = 5;
      @(posedge clk_i); addr_i  = 4; we = 1; wdata_i = 10;
      @(posedge clk_i); addr_i  = 8; we = 1; wdata_i = 12;
      // @(posedge clk_i); rst_i   = 1;
      // @(posedge clk_i); rst_i   = 0;
      @(posedge clk_i); addr_i  = 12; wdata_i = 19;
      @(posedge clk_i); addr_i  = 16; wdata_i = 20;
      @(posedge clk_i); addr_i  = 4;
      @(posedge clk_i); addr_i  = 8;
      @(posedge clk_i); addr_i  = 12;
      @(posedge clk_i); addr_i  = 8;
      @(posedge clk_i); addr_i  = 4;
      @(posedge clk_i); addr_i  = 8;
   end
endmodule