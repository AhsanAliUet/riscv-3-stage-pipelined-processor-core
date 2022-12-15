
package csr_pkg;

   typedef struct csr_pkg {
      logic [11:0] addr_mstatus,
      logic [11:0] addr_mie,
      logic [11:0] addr_mtvec,
      logic [11:0] addr_mepc,
      logic [11:0] addr_mcause,
      logic [11:0] addr_mip

   } csr_reg_addr_t;
endpackage