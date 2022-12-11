
//this module is used to generate interrupt signal

module csr # (
   parameter DW = 32
) (

   input  logic [DW-1:0] mstatus_reg,
   input  logic [DW-1:0] mie_reg,
   input  logic [DW-1:0] mip_reg,
   input  logic [DW-1:0] mtvec_reg,
   input  logic [DW-1:0] mcause_reg,

   output logic          intr,
   output logic [DW-1:0] where      //where we will go when interrupt comes


);
   //These 3 registers will generate interrupt signal, mstatus, mie, mip
   localparam MIE  = 3;   //index, corresponds to mie bit of mstatus_reg

   localparam MTIE = 7;   //index, corresponds to mtie bit of mie_reg
   localparam MEIE = 11;  //index, corresponds to meie bit of mie_reg

   localparam MTIP = 7;   //index, corresponds to mtip bit of mip_reg
   localparam MEIP = 11;  //index, corresponds to meip bit of mip_reg

   logic timer_intr_flag; //tells coming of local timer interrupt came or not
   logic exter_intr_flag; //tells coming of local externall interrupt came or not

   logic timer_intr_came; //if mie of mstatus_reg was set, now the interrupt goes to core
   logic exter_intr_came; //if mie of mstatus_reg was set, now the interrupt goes to core

   logic [30:0] exp_code;  //exception code
   assign exp_code = mcause_reg[30:0];

   logic [1:0] mode;
   assign mode = mtvec_reg[1:0];

   logic [29:0] base;
   assign base = mtvec_reg[31:2];



   always_comb begin  //local checking of interrupt coming
      if (mie_reg[MTIE] && mip_reg[MTIP]) begin
         timer_intr_flag = 1;
      end
      else begin
         timer_intr_flag = 0;
      end

      if (mie_reg[MEIE] && mip_reg[MEIP]) begin
         exter_intr_flag = 1;
      end
      else begin
         exter_intr_flag = 0;
      end
   end

   always_comb begin  //global checking of interrupt coming
      if (mstatus_reg[MIE] && timer_intr_flag) begin
         timer_intr_came = 1;
      end
      else begin
         timer_intr_came = 0;
      end

      if (mstatus_reg[MIE] && exter_intr_flag) begin
         exter_intr_came = 1;
      end
      else begin
         exter_intr_came = 0;
      end
   end

   always_comb begin  //check interrupt from any of the source
      if (timer_intr_came || exter_intr_came) begin
         intr = 1;
      end
      else begin
         intr = 0;
      end
   end

   always_comb begin
      assign where = mode[0] ? {2'b0, base}:
                               {2'b0, base} + ({1'b0, exp_code} << 2);
   end

endmodule