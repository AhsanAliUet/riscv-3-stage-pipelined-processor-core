module lsu #(
   parameter DW = 32
)(
   input  logic [6:0]    opcode,
   input  logic [2:0]    func3,

   input  logic [DW-1:0] addr_in,     //from alu out
   output logic [DW-1:0] addr_out,    //to mem

   input  logic [DW-1:0] data_s,      //data to be stored
   output logic [DW-1:0] data_s_o,    //data to be stored manipulated by LSU

   input  logic [DW-1:0] data_l,      //data to be loaded
   output logic [DW-1:0] data_l_o     //data to be loaded manipulated by LSU
);

   assign addr_out = addr_in;

   always_comb begin
      if (opcode ==  7'b0000011) begin            //LOADS
         case (func3)
            3'b000: data_l_o = {{24{data_l[7]}},  data_l[7:0] };  //LB
            3'b001: data_l_o = {{16{data_l[15]}}, data_l[15:0]};  //LH
            3'b010: data_l_o = {                  data_l      };  //LW
            3'b100: data_l_o = {{24{1'b0}},       data_l[7:0] };  //LBU
            3'b101: data_l_o = {{16{1'b0}},       data_l[15:0]};  //LHU
         endcase

      end else if (opcode == 7'b0100011) begin   //STORE
         case(func3)
            3'b000: data_s_o = {{24{1'b0}},  data_s[7:0] }; //SB
            3'b001: data_s_o = {{16{1'b0}},  data_s[15:0]}; //SH
            3'b010: data_s_o = {             data_s      }; //SW
         endcase
      end
   end
endmodule