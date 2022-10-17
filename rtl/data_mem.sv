//data memory for the processor
module data_mem #(
   parameter REG_SIZE = 32,
   parameter MEM_SIZE_IN_KB = 1,   //size of the instruction memory
   parameter NO_OF_REGS = MEM_SIZE_IN_KB * 1024 / 4    //4 bytes in 32 bits
)(
   input  logic                clk_i,
   input  logic                rst_i,
   input  logic                we,
   input  logic                cs,
   input  logic [REG_SIZE-1:0] addr_i,     //PC will be given in place of it
   input  logic [REG_SIZE-1:0] wdata_i,
   output logic [REG_SIZE-1:0] rdata_o
);

   logic [REG_SIZE-1:0] data_mem [0:NO_OF_REGS-1];
   
   assign rdata_o = data_mem[addr_i[REG_SIZE-1:2]];  //making it byte addressible

   always_ff @ (posedge clk_i, posedge rst_i) begin
      if (rst_i) begin
         for (int i = 0; i < NO_OF_REGS; i = i + 1) begin
            data_mem[i] <= '0;
         end
      end else if (we && !cs) begin
         data_mem[addr_i[REG_SIZE-1:0]] <= wdata_i;
      end

   end
endmodule
