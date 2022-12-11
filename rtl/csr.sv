//contains CSR registers and interrupt generation process from those registers

module csr #(
    parameter DW = 32,
    parameter ADDRW = 12

) (
    input  logic             clk_i,
    input  logic             rst_i,
    input  logic [ADDRW-1:0] addr,
    input  logic             we,
    input  logic             re,

    input  logic [DW-1:0]    pc_i,
    input  logic [DW-1:0]    data_i,

    input  logic             is_mret,
    output logic             intr_flag,
    output logic [DW-1:0]    data_o,
    output logic [DW-1:0]    epc_o

);

    logic [DW-1:0]    mstatus_o;
    logic [DW-1:0]    mie_o;
    logic [DW-1:0]    mtvec_o;
    logic [DW-1:0]    mepc_o;
    logic [DW-1:0]    mcause_o;
    logic [DW-1:0]    mip_o;


csr_regs # (
   .DW   (DW   ),
   .ADDRW(ADDRW)
) i_csr_regs(
   .clk_i    (clk_i    ),
   .rst_i    (rst_i    ),

   .intr_flag(intr_flag),
   .addr     (addr     ),
   .we       (we       ),
   .re       (re       ),

   .pc_i     (pc_i     ),
   .data_i   (data_i   ),

   .data_o   (data_o   ),

   //output from register file (read all registers in parallel)
   .mstatus_o(mstatus_o),
   .mie_o    (mie_o    ),
   .mtvec_o  (mtvec_o  ),
   .mepc_o   (mepc_o   ),
   .mcause_o (mcause_o ),
   .mip_o    (mip_o    )

);

csr_ops # (
   .DW(DW)
) i_csr_ops(

   .mstatus_reg(mstatus_o),
   .mie_reg    (mie_o    ),
   .mtvec_reg  (mtvec_o  ),
   .mepc_reg   (mepc_o   ),
   .mcause_reg (mcause_o ),
   .mip_reg    (mip_o    ),

   .is_mret    (is_mret  ),
   .intr_flag  (intr_flag),
   .where_to_go(epc_o    )

);


endmodule