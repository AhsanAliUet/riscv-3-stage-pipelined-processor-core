//This module implements the FSM of UART
module uart_fsm
(
   input  logic clk_i,
   input  logic rst_i,
   input  logic en,
   input  logic byte_ready_i,
   input  logic t_byte_i,

   input  logic counter_of_i,
   input  logic counter_baud_of_i,

   output logic start_o,
   output logic clear_o,
   output logic shift_o,
   output logic clear_baud_o,
   output logic load_xmt_dreg_o,
   output logic load_xmt_shfreg_o
);
   parameter S0 = 2'b00;
   parameter S1 = 2'b01;
   parameter S2 = 2'b10;

   logic [1:0] state;
   logic [1:0] next_state;

always_ff @(posedge clk_i, posedge rst_i) begin
   if (rst_i) begin
      state <= S0;
   end else if (en) begin
      state <= next_state;
   end
end

always_comb begin
   case(state)
      S0: begin
         if (!byte_ready_i) begin
            next_state = S0;

            clear_baud_o = 1;
            clear_o = 1;
            load_xmt_dreg_o = 1;
            load_xmt_shfreg_o = 0;
            start_o = 0;
            shift_o = 0;
         end else begin
            next_state = S1;
            
            clear_baud_o = 1;
            clear_o = 1;
            load_xmt_dreg_o = 0;
            load_xmt_shfreg_o = 0;
            start_o = 0;
            shift_o = 0;
         end
      end
      S1: begin
         if (!t_byte_i) begin
            next_state = S1;
            clear_baud_o = 1;
            clear_o = 1;
            load_xmt_dreg_o = 0;
            load_xmt_shfreg_o = 1;
            start_o = 0;
            shift_o = 0;
         end else begin
            next_state = S2;
            clear_baud_o = 1;
            clear_o = 1;
            load_xmt_dreg_o = 0;
            load_xmt_shfreg_o = 0;
            start_o = 0;
            shift_o = 0;
         end   
      end
      S2: begin
         if (counter_of_i && !counter_baud_of_i) begin
            next_state = S2;
            clear_baud_o = 0;
            clear_o = 0;
            load_xmt_dreg_o = 0;
            load_xmt_shfreg_o = 0;
            start_o = 1;
            shift_o = 0;
         end else if (!counter_of_i && counter_baud_of_i) begin
            next_state = S2;
            clear_baud_o = 0;
            clear_o = 0;
            load_xmt_dreg_o = 0;
            load_xmt_shfreg_o = 0;
            start_o = 1;
            shift_o = 1;
         end 
         else if (counter_of_i && counter_baud_of_i) begin
            next_state = S0;
         end
      end
   endcase
end
endmodule

