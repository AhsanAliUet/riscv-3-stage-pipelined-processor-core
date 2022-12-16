
//this module is used to assert some signals of uart like byte_ready, transmit byte,
//chip select of uart etc

module uart_riscv_contr (
    input  logic cs_uart,
    input  logic done_uart,
    output logic byte_ready,  //byte is read to transmit
    output logic t_byte       //transfer the byte which is ready
);

    always_comb begin
        if (cs_uart && !done_uart) begin
            byte_ready = 1;
            t_byte     = 1;
        end
        else begin
            byte_ready = 0;
            t_byte     = 0;
        end
    end

endmodule