module pipeline_reg_2 #(
   parameter DW = 1
)(
   input  clk_i,
   input  rst_i,
   
   input  [DW-1:0] alu_out_e,          //alu_out in execute stage
   output [DW-1:0] alu_out_m,          //alu_out in memory stage

   input  [DW-1:0] write_data_e,       //write_data in execute stage
   output [DW-1:0] write_data_m,       //write_data in memory stage

   input  [DW-1:0] rd_e,               //destination register in execute stage
   output [DW-1:0] rd_m,               //destination register in memory stage

   input  [DW-1:0] pc_plus_4_e,        //PC plus 4 in execute stage
   output [DW-1:0] pc_plus_4_m,        //PC plus 4 in memory stage

);

   always_ff @ (posedge clk_i, posedge rst_i) begin : pipelined_register
      if (rst_i) begin : reset_block
         alu_out_m    <= '0;
         write_data_m <= '0;
         rd_m         <= '0;
         pc_plus_4_m  <= '0;
      end : reset_block

      else begin : to_next_stage
         alu_out_m    <= alu_out_e;
         write_data_m <= write_data_e;
         rd_m         <= rd_e;
         pc_plus_4_m  <= pc_plus_4_e;
      end : to_next_stage
      
   end : pipelined_register
endmodule