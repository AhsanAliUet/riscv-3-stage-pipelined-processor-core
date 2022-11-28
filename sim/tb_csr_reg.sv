
module tb_csr_reg();

   parameter DW = 32;
   parameter ADDRW = 12;

   logic             clk_i;
   logic             rst_i;

   logic [DW-1:0]    instruction;
   logic             intr;         //interrupt signal
   logic [ADDRW-1:0] addr;
   logic             we;
   logic             re;

   logic [DW-1:0]    data_i;

   logic [DW-1:0]    pc_i;
   logic [DW-1:0]    epc_o;

   logic [DW-1:0]    data_o;


   task driver();
      addr <= 12'h300;
      addr <= 12'h304;
      addr <= 12'h305;
      addr <= 12'h300;
      addr <= 12'h300;
      addr <= 12'h300;
   endtask

   task monitor();
   endtask

   task scorboard();
   endtask
endmodule