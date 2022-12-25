//Seven segment decoder

module ssd #(
    parameter  DW = 32,
    localparam NO_OF_SEGS = 8   //number of 7 segments are 8
)(
    input  logic                  clk,
    input  logic                  rst_i,

    input  logic [DW-1:0]         data_i,
    output logic [NO_OF_SEGS-1:0] anode, 
    output logic [6:0]            display   //because of a, b, c, d, e, f and g on 7 segs
);
    
    logic [17:0] timer1;    //timer1 is for segment selection
    logic        clk_seg;
    logic [2:0]  seg_count;
    logic [3:0]  data;
	
    always_ff @ (posedge clk) begin
        if (rst_i) begin
            timer1 <= '0;
        end

        else if (timer1 > 131072) begin
            timer1 <= '0;
        end

        else begin
            timer1  <= timer1 + 1;
            clk_seg <= timer1[17];  //17
        end

    end
     
    always_ff @ (posedge clk_seg)
    begin
        if (seg_count > 7) begin
            seg_count <= 0;
        end
        else begin
            seg_count <= seg_count + 1;
        end

        case(seg_count)
            0: begin anode <= 8'b11111110; data <= data_i[3:0];   end
            1: begin anode <= 8'b11111101; data <= data_i[7:4];   end
            2: begin anode <= 8'b11111011; data <= data_i[11:8];  end
            3: begin anode <= 8'b11110111; data <= data_i[15:12]; end
            4: begin anode <= 8'b11101111; data <= data_i[19:16]; end
            5: begin anode <= 8'b11011111; data <= data_i[23:20]; end
            6: begin anode <= 8'b10111111; data <= data_i[27:24]; end 
            7: begin anode <= 8'b01111111; data <= data_i[31:28]; end
        endcase
    end

    // Cathode patterns of the 7-segment 1 LED display 
    always_comb
    begin
        case(data)
        4'b0000: display = 7'b0000001; // "0"     
        4'b0001: display = 7'b1001111; // "1" 
        4'b0010: display = 7'b0010010; // "2" 
        4'b0011: display = 7'b0000110; // "3" 
        4'b0100: display = 7'b1001100; // "4" 
        4'b0101: display = 7'b0100100; // "5" 
        4'b0110: display = 7'b0100000; // "6" 
        4'b0111: display = 7'b0001111; // "7" 
        4'b1000: display = 7'b0000000; // "8"     
        4'b1001: display = 7'b0000100; // "9"
		4'b1010: display = 7'b0001000; // "A"     
        4'b1011: display = 7'b1100000; // "b"     
        4'b1100: display = 7'b0110001; // "C"     
        4'b1101: display = 7'b1000010; // "d"     
        4'b1110: display = 7'b0110000; // "E"     
        4'b1111: display = 7'b0111000; // "F"     
        
        default: display = 7'b1111110; // "-"
        endcase   
    end

endmodule
 
