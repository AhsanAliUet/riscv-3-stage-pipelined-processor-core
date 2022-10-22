module pipeline_reg_2 #(
   parameter DW = 32,
   parameter REGW = $clog2(DW)
)(
   input  logic clk_i,
   input  logic rst_i,
   
   input  logic [DW-1:0]   alu_out_e,          //alu_out in execute stage
   output logic [DW-1:0]   alu_out_m,          //alu_out in memory stage

   input  logic [DW-1:0]   write_data_e,       //write_data in execute stage
   output logic [DW-1:0]   write_data_m,       //write_data in memory stage

   input  logic [REGW-1:0] rd_e,               //destination register in execute stage
   output logic [REGW-1:0] rd_m,               //destination register in memory stage

   input  logic [DW-1:0]   pc_plus_4_e,        //PC plus 4 in execute stage
   output logic [DW-1:0]   pc_plus_4_m,        //PC plus 4 in memory stage

   input  logic            reg_write_d,        //decode and execute are same so suffix _d or _e are same 
   input  logic [1:0]      wb_sel_d,
   input  logic            mem_write_d,

   output logic            reg_write_m,
   output logic [1:0]      wb_sel_m,
   output logic            mem_write_m,

   input  logic [6:0]      opcode_d,
   output logic [6:0]      opcode_m,
   
   input  logic [2:0]      func3_d,
   output logic [2:0]      func3_m,

   input  logic [DW-1:0]   instr_d,
   output logic [DW-1:0]   instr_m
);

   always_ff @ (posedge clk_i, posedge rst_i) begin : pipelined_register
      if (rst_i) begin : reset_block
         alu_out_m    <= '0;
         write_data_m <= '0;
         rd_m         <= '0;
         pc_plus_4_m  <= '0;
         reg_write_m  <= '0;
         wb_sel_m     <= '0;
         mem_write_m  <= '0;
         opcode_m     <= '0;
         func3_m      <= '0;
         instr_m      <= '0;
      end : reset_block

      else begin : to_next_stage
         alu_out_m    <= alu_out_e;
         write_data_m <= write_data_e;
         rd_m         <= rd_e;
         pc_plus_4_m  <= pc_plus_4_e;
         reg_write_m  <= reg_write_d;
         wb_sel_m     <= wb_sel_d;
         mem_write_m  <= mem_write_d;
         opcode_m     <= opcode_d;
         func3_m      <= func3_d;
         instr_m      <= instr_d;
      end : to_next_stage
      
   end : pipelined_register
endmodule