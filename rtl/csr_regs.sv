//CSR register file

module csr_regs # (
   parameter DW    = 32,
   parameter ADDRW = 12
) (
   input  logic             clk_i,
   input  logic             rst_i,

   input  logic             intr_flag,
   input  logic [ADDRW-1:0] addr,
   input  logic             we,
   input  logic             re,

   input  logic [DW-1:0]    pc_i,
   input  logic [DW-1:0]    data_i,

   output logic [DW-1:0]    data_o,

   //output from register file (read all registers in parallel)
   output logic [DW-1:0]    mstatus_o,
   output logic [DW-1:0]    mie_o,
   output logic [DW-1:0]    mtvec_o,
   output logic [DW-1:0]    mepc_o,
   output logic [DW-1:0]    mcause_o,
   output logic [DW-1:0]    mip_o

);

   // localparam NO_OF_REGS = 256;
   // logic [DW-1:0] csr_regs [0:NO_OF_REGS-1];    //totall 256 CSR registers

   parameter [ADDRW-1:0] MSTATUS_ADDR = 12'h300;
   parameter [ADDRW-1:0] MIE_ADDR     = 12'h304;
   parameter [ADDRW-1:0] MTVEC_ADDR   = 12'h305;
   parameter [ADDRW-1:0] MEPC_ADDR    = 12'h341;
   parameter [ADDRW-1:0] MCAUSE_ADDR  = 12'h342;
   parameter [ADDRW-1:0] MIP_ADDR     = 12'h344;

   //internal registers of CSR register file
   logic [DW-1:0] mstatus_ff;
   logic [DW-1:0] mie_ff;
   logic [DW-1:0] mtvec_ff;
   logic [DW-1:0] mepc_ff;
   logic [DW-1:0] mcause_ff;
   logic [DW-1:0] mip_ff;

   always_comb begin  //asynchrounus read from CSRs
      if (re) begin
         case(addr)
            MSTATUS_ADDR : data_o = mstatus_ff; //mstatus
            MIE_ADDR     : data_o = mie_ff;     //mie
            MTVEC_ADDR   : data_o = mtvec_ff;   //mtvec
            MEPC_ADDR    : data_o = mepc_ff;    //mepc
            MCAUSE_ADDR  : data_o = mcause_ff;  //mcause
            MIP_ADDR     : data_o = mip_ff;     //mip
         endcase
      end
      else begin
         data_o <= '0;
      end
   end

   always_ff @ (negedge clk_i, posedge rst_i) begin  //write at negative edge
      if (rst_i) begin
         mstatus_ff <= '0;
         mie_ff     <= '0;
         mtvec_ff   <= '0;
         mepc_ff    <= '0;
         mcause_ff  <= '0;
         mip_ff     <= '0;
      end

      else if (we) begin
         case(addr)
            MSTATUS_ADDR : mstatus_ff <= data_i;   //mstatus
            MIE_ADDR     : mie_ff     <= data_i;   //mie
            MTVEC_ADDR   : mtvec_ff   <= data_i;   //mtvec
            
            MEPC_ADDR    : begin
               if (intr_flag) begin
                  mepc_ff    <= pc_i;
               end
               else begin
                  mepc_ff    <= data_i;
               end
            end

            MCAUSE_ADDR  : mcause_ff  <= data_i;   //mcause
            MIP_ADDR     : mip_ff     <= data_i;   //mie
         endcase
      end

   end

   //read all the registers in parallel
   always_ff @ (posedge clk_i) begin
      if (rst_i) begin
         mstatus_o <= '0;
         mie_o     <= '0;
         mtvec_o   <= '0;
         mepc_o    <= '0;
         mcause_o  <= '0;
         mip_o     <= '0;
      end

      else begin
         mstatus_o <= mstatus_ff;
         mie_o     <= mie_ff;
         mtvec_o   <= mtvec_ff;
         mepc_o    <= mepc_ff;
         mcause_o  <= mcause_ff;
         mip_o     <= mip_ff;
      end
   end

   
   // always_comb begin
   //    if (intr) begin
   //       ra         = pc_i;               //PC of usual program is saved is ra
   //       epc_o      = handlder_addr;      //pc will go to handler
   //       flush_intr = 1;                  //flush the pipeline when interrupt comes
   //    end

   //    else begin
   //       ra         = pc_i;
   //       epc_o      = pc_i;
   //       flush_intr = 0;                 //no need to flush when no interrupt
   //    end
   // end
endmodule