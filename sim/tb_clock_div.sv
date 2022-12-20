
module tb_clock_div ();
    parameter  CLOCK_SYS     = 100e6;
    parameter  CLOCK_OUT     = 1e6;

    logic clk_i;
    logic rst_i;
    logic clk_o;

clock_div #(
    .CLOCK_SYS(CLOCK_SYS),
    .CLOCK_OUT(CLOCK_OUT)
) i_clock_div(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .clk_o(clk_o)
);

    initial begin
        clk_i = 0;
        forever begin
            #5 clk_i = ~clk_i;
        end
    end

    initial begin
                          rst_i <=    0;
        @(posedge clk_i); rst_i <= #1 1;
        @(posedge clk_i); rst_i <= #1 0;

    end

    initial begin
        $dumpfile("docs//dump.vcd");
        $dumpvars;

        #100000;
        $finish;
    end
endmodule