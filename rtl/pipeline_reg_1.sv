module pipeline_reg_1 #(
   parameter DW = 32
)(
   input  logic clk_i,
   input  logic rst_i,
   
   input  logic [DW-1:0] instr_f,      //instruction in fetch stage
   output logic [DW-1:0] instr_d,      //instruction in decode stage

   input  logic [DW-1:0] pc_f,         //PC in fetch stage
   output logic [DW-1:0] pc_d,         //PC in decode stage

   input  logic [DW-1:0] pc_plus_4_f,  //PC plus 4 in fetch stage
   output logic [DW-1:0] pc_plus_4_d,  //PC plus 4 in decode stage
   input  logic [DW-1:0] imm_ext_f,
   output logic [DW-1:0] imm_ext_d

);

   always_ff @ (posedge clk_i, posedge rst_i) begin : pipelined_register
      if (rst_i) begin : reset_block
         instr_d     <= '0;
         pc_d        <= '0;
         pc_plus_4_d <= '0;
         imm_ext_d   <= '0;
      end : reset_block

      else begin : to_next_stage
         instr_d     <= instr_f;
         pc_d        <= pc_f;
         pc_plus_4_d <= pc_plus_4_f;
         imm_ext_d   <= imm_ext_f;
      end : to_next_stage

   end : pipelined_register
endmodule