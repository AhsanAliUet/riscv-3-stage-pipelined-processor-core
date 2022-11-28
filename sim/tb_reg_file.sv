//test bench for register file

module tb_reg_file ();
   parameter REG_SIZE = 32;
   parameter NO_OF_REGS = 32;
   parameter REGW = $clog2(REG_SIZE);
   logic                clk_i;
   logic                rst_i;

   logic                we;
   logic [REGW-1:0]     raddr1_i;
   logic [REG_SIZE-1:0] rdata1_o;

   logic [REGW-1:0]     raddr2_i;
   logic [REG_SIZE-1:0] rdata2_o;

   logic [REGW-1:0]     waddr_i;
   logic [REG_SIZE-1:0] wdata_i;

reg_file #(
   .REG_SIZE(REG_SIZE),
   .NO_OF_REGS(NO_OF_REGS),
   .REGW(REGW)
)i_reg_file(
   .clk_i(clk_i),
   .rst_i(rst_i),
   
   .we(we),
   .raddr1_i(raddr1_i),
   .rdata1_o(rdata1_o),

   .raddr2_i(raddr2_i),
   .rdata2_o(rdata2_o),

   .waddr_i(waddr_i),
   .wdata_i(wdata_i)
);

   initial begin
      clk_i = 0;
      forever begin
         #5; clk_i = ~clk_i;
      end
   end

   initial begin
      #0; rst_i = 1;
      @(posedge clk_i); rst_i  = 0;
      @(posedge clk_i); waddr_i  = 1; wdata_i = 5;
      @(posedge clk_i); waddr_i  = 2; wdata_i = 8;
      @(posedge clk_i);
      @(posedge clk_i);
      if (i_reg_file.reg_file[1] == 5) begin
         $monitor("Test is passed");
      end else begin
         $monitor("Test is failed");
      end
      @(posedge clk_i); rst_i  = 1;
      @(posedge clk_i); rst_i  = 0;
      @(posedge clk_i); waddr_i  = 3; wdata_i = 19;
      @(posedge clk_i); waddr_i  = 4; wdata_i = 20;
      @(posedge clk_i); raddr1_i = 1;
      @(posedge clk_i); raddr2_i = 2;
      @(posedge clk_i); raddr1_i = 3;
      @(posedge clk_i); raddr2_i = 4;
      @(posedge clk_i); raddr1_i = 1;
      @(posedge clk_i); raddr2_i = 2;
   end


endmodule