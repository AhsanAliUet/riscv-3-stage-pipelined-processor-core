
module tb_csr_reg();

   parameter DW = 32;
   parameter ADDRW = 12;

   logic             clk_i;
   logic             rst_i;

   logic             intr;         //interrupt signal
   logic [ADDRW-1:0] addr;
   logic             we;
   logic             re;

   logic [DW-1:0]    data_i;

   logic [DW-1:0]    pc_i;
   logic [DW-1:0]    epc_o;

   logic [DW-1:0]    data_o;

csr_regs # (
   .DW   (DW),
   .ADDRW(ADDRW)
) i_csr_reg(
   .clk_i      (clk_i),
   .rst_i      (rst_i),

   .intr       (intr),
   .addr       (addr),
   .we         (we),
   .re         (re),

   .data_i     (data_i),

   .pc_i       (pc_i),
   .epc_o      (epc_o),

   .data_o     (data_o)
);

   initial begin
      clk_i = 0;
      forever begin
         #5; clk_i = ~clk_i;
      end
   end

   initial begin
      #0  rst_i = 0; 
      #5; rst_i = 1;
      #5; rst_i = 0;
      re = 0; we = 1; data_i = 32'hABCDEF12;
      addr = 12'h300;
      #5; addr = 12'h304;
      #5; addr = 12'h305;
      #5; addr = 12'h341;
      #5; addr = 12'h342;
      #5; addr = 12'h344;

      #5; 
      re = 1; we = 0;
   end
   task driver();

      re   <= 0;
      we   <= 1;

      data_i <= 32'hAABCDEFA;

      addr <= 12'h300;
      addr <= 12'h304;
      addr <= 12'h305;
      addr <= 12'h341;
      addr <= 12'h342;
      addr <= 12'h344;

      re   <= 1;
      we   <= 0;

   endtask

   task monitor();
      for (int i = 0; i < 6; i++) begin
         $display("x%d = %h", i, data_o);
      end
   endtask

   task scorboard();
   endtask
endmodule