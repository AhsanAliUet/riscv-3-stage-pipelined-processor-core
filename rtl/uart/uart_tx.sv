
module uart_tx #(
   parameter DW = 8,
   parameter CLOCK = 100e6,       //FPGA's clock frequency 
   parameter BAUD_RATE = 80000000,  
   parameter int BAUD_COUNTER = CLOCK/BAUD_RATE,
   parameter BRW = $clog2(BAUD_COUNTER + 1),
   parameter BITS_TO_COUNT = 8   
)(
   input                 clk_i,
   input                 rst_i,
   input  logic          cs,
   input  logic [DW-1:0] data_i,
   input  logic          byte_ready_i,
   input  logic          t_byte_i,
   output logic          Tx,
   output logic          done_uart
);

   logic serial_o;
   logic clear_baud;       //output from FSM
   logic counter_baud_of;
   logic counter_of;
   logic clear;            //bit counter clear, output from FSM to bit counter
   logic start;            //to assert Transmiting the data_i
   logic shift;            //output from FSM
   logic load_xmt_shfreg;
   logic load_xmt_dreg;

shift_register # (
   .DW(DW)
) i_shift_register (
   .clk_i      (clk_i          ),
   .rst_i      (rst_i          ),
   .en         (cs             ),
   .data_i     (data_i         ),
   .shift_i    (shift          ),    //from FSM
   .load_byte_i(load_xmt_shfreg),
   .serial_o   (serial_o       )     //single bit serial out from shift register
);

baud_counter #(
   .CLOCK    (CLOCK    ),
   .BAUD_RATE(BAUD_RATE)
) i_baud_counter(
   .clk_i            (clk_i          ),
   .rst_i            (rst_i          ),
   .en               (cs             ),
   .clear_baud       (clear_baud     ),
   .counter_baud_of_o(counter_baud_of)
);

bit_counter #(
   .BITS_TO_COUNT(BITS_TO_COUNT)
) i_bit_counter (
   .clk_i       (clk_i     ),
   .rst_i       (rst_i     ),
   .en          (cs        ),
   .clear       (clear     ),   //clear signal from FSM
   .counter_of_o(counter_of)
);

uart_fsm i_uart_fsm(
   .clk_i            (clk_i          ),
   .rst_i            (rst_i          ),
   .en               (cs             ),
   .byte_ready_i     (byte_ready_i   ),
   .t_byte_i         (t_byte_i       ),

   .counter_of_i     (counter_of     ),     //from bit counter
   .counter_baud_of_i(counter_baud_of),   //from overflow of baud counter

   .start_o          (start          ),
   .clear_o          (clear          ),
   .shift_o          (shift          ),
   .clear_baud_o     (clear_baud     ),
   .load_xmt_dreg_o  (load_xmt_dreg  ),
   .load_xmt_shfreg_o(load_xmt_shfreg),
   .done             (done_uart      )
);

   always_comb begin
      if (cs) begin
         if (start) begin
            Tx = serial_o;
         end
         else begin
            Tx = 1;
         end
      end

      else begin
         Tx = 1;
      end
   end

endmodule