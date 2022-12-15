module tb_alu_new();
   parameter      DW = 32;
   logic          func7_5;
   logic [DW-1:0] alu_operand_1_i;
   logic [DW-1:0] alu_operand_2_i;
   logic [2:0]    alu_control;
   logic [DW-1:0] alu_result_o;


`timescale 1ns/1ps
alu_new #(
   .DW(DW)
)i_alu_new(
   .func7_5(func7_5),

   .alu_operand_1_i(alu_operand_1_i),
   .alu_operand_2_i(alu_operand_2_i),
   .alu_control(alu_control),
   .alu_result_o(alu_result_o)
);

   initial begin
      alu_operand_1_i = 34; alu_operand_2_i = 3; func7_5 = 0; alu_control = 0;
      #10; alu_control = 1;
      #10; alu_control = 2;
      #10; alu_control = 3;
      #10; alu_control = 4;
      #10; alu_control = 5;
      #10; func7_5 = 1; alu_operand_1_i = 23; alu_operand_2_i = 4;
      #10; alu_operand_1_i = 100; alu_operand_2_i = 5;
      #10; alu_operand_1_i = 1111; alu_operand_2_i = 2;
      #10; alu_operand_1_i = 9999; alu_operand_2_i = 1;
      #10; alu_operand_1_i = 101010; alu_operand_2_i = 3;
      #10; alu_control = 6;
      #10; alu_control = 7;
   end

endmodule