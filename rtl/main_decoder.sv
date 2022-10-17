//a part of the controller of processor

module main_decoder (
   input  logic [6:0] opcode,
   
   output logic       reg_write,
   output logic       mem_write,
   output logic [2:0] imm_src,
   output logic       alu_src,
   output logic [1:0] wb_sel,

   output logic [1:0] alu_op       //used to alu_decoder module
);
   logic       jump;
   logic       branch;

always_comb begin
   case(opcode)
      7'b0000011: begin             //lw
         reg_write = 1'b1;
         mem_write = 1'b0;
         imm_src   = 3'b000;
         alu_src   = 1'b1;
         wb_sel    = 2'b01;
         branch    = 1'b0;
         jump      = 1'b0;

      end
      7'b0100011: begin            //sw
         reg_write = 1'b0;
         mem_write = 1'b1;
         imm_src   = 3'b001;
         alu_src   = 1'b1;
         wb_sel    = 2'b00;       //don't care, write what you want
         branch    = 1'b0;
         jump      = 1'b0;

      end
      7'b0110011: begin            //R
         reg_write = 1'b1;
         mem_write = 1'b0;
         imm_src   = 3'b000;         //it is don't care ideally
         alu_src   = 1'b0;
         wb_sel    = 2'b00;
         branch    = 1'b0;
         jump      = 1'b0;

      end
      7'b1100011: begin            //B
         reg_write = 1'b0;
         mem_write = 1'b0;
         imm_src   = 3'b010;
         alu_src   = 1'b1;
         wb_sel    = 2'b00;
         branch    = 1'b1;
         jump      = 1'b0;

      end
      7'b0010011: begin            //I
         reg_write = 1'b1;
         mem_write = 1'b0;
         imm_src   = 3'b000;
         alu_src   = 1'b1;
         wb_sel    = 2'b00;
         branch    = 1'b0;
         jump      = 1'b0;


      end

      7'b0110111 , 7'b0010111: begin            //U-type
         reg_write = 1'b1;
         mem_write = 1'b0;
         imm_src   = 3'b100;
         alu_src   = 1'b1;
         wb_sel    = 2'b00;
         branch    = 1'b0;
         jump      = 1'b0;

      end
   
      7'b1101111: begin            //Jal 
         reg_write = 1'b1;
         mem_write = 1'b0;
         imm_src   = 3'b011;
         alu_src   = 1'b1;
         wb_sel    = 2'b10;
         branch    = 1'b0;
         jump      = 1'b1;

      end
      7'b1100111: begin         //Jalr
         reg_write = 1'b1;
         mem_write = 1'b0;
         imm_src   = 3'b000;
         alu_src   = 1'b1;
         wb_sel    = 2'b10;
         branch    = 1'b0;
         jump      = 1'b0;
      end
   endcase
end


endmodule