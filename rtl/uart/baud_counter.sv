module baud_counter #(
   parameter CLOCK = 100e6,        //100MHz
   parameter BAUD_RATE = 20000000,  //to get baud counter = 5, just for simulation
   parameter int BAUD_COUNTER = CLOCK/BAUD_RATE,
   parameter BRW = $clog2(BAUD_COUNTER + 1)     //Baud rate width, # of bit to store BAUD_COUNTER
)(
   input  logic           clk_i,
   input  logic           rst_i,
   input  logic           en,
   input  logic           clear_baud,
   output logic           counter_baud_of_o
);

logic [BRW-1:0] counter_value;
always_ff @ (posedge clk_i) begin
   if (rst_i || clear_baud) begin
      counter_value <= '0;
      counter_baud_of_o = 0;
   end if (en && (counter_value >= BAUD_COUNTER)) begin
      counter_baud_of_o <= 1'b1;
   end else if (en) begin
      counter_value <= counter_value + 1;
   end
end
endmodule