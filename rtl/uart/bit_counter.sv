module bit_counter #(
   parameter BITS_TO_COUNT = 9
)(
   input  logic           clk_i,
   input  logic           rst_i,
   input  logic           clear,
   output logic           counter_of_o
);

logic [15:0] counter_value = 0;
always_ff @ (posedge clk_i, posedge rst_i, posedge clear) begin
   if (rst_i || clear) begin
      counter_value <= 16'b0;
      counter_of_o <= 0;
   end if (counter_value >= BITS_TO_COUNT) begin
      counter_of_o <= 1'b1;
   end else begin
      counter_value <= counter_value + 1;
   end
end
endmodule