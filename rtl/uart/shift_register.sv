module shift_register #(
   parameter DW = 8
)(
   input clk_i,
   input rst_i,     //active high

   input  logic [DW-1:0] data_i,
   input  logic          shift_i,
   input  logic          load_byte_i,
   output logic          serial_o     //single bit serial out from shift register
);

logic [DW-1:0] data_storage;
// logic [DW-1:0] shifted_data;          //Stores right shifted data

always_ff @ (posedge clk_i, posedge rst_i) begin
   if (rst_i) begin
      data_storage <= 0;
   end else if (load_byte_i) begin
      data_storage <= data_i;
   end else if (shift_i) begin
      data_storage <= data_storage >> 1;
   end
end

// assign shifted_data = {1'b0, data_storage[DW-1:1]};  //right shift
assign serial_o = data_storage[0];

endmodule