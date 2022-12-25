
module clock_div #(
    parameter  CLOCK_SYS     = 100e6,                   //frequency of input clock
    parameter  CLOCK_OUT     = 1e6,                     //frequency of output clock
    localparam int CNT_VALUE = CLOCK_SYS/CLOCK_OUT,     //value of the counter required to bring the clock down
    localparam CW            = $clog2(CNT_VALUE)        //how many bits will be used to make counter
) (
    input  logic clk_i,
    input  logic rst_i,
    output logic clk_o
);
    logic [CW-1:0] counter;

    always_ff @ (posedge clk_i) begin
        if (rst_i) begin
            clk_o   <= 0;
            counter <= '0;
        end
        else if (counter >= CNT_VALUE) begin
            counter <= '0;
            clk_o   <= ~clk_o;
        end
        else begin
            counter <= counter + 1;
        end
    end
endmodule