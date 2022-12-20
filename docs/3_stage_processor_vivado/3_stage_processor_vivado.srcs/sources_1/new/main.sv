`timescale 1ns / 1ps

module main(

    );
    
   xpm_memory_spram #(
       .ADDR_WIDTH_A(10),             // DECIMAL
       .AUTO_SLEEP_TIME(0),           // DECIMAL
       .BYTE_WRITE_WIDTH_A(32),       // DECIMAL
       .ECC_MODE("no_ecc"),           // String
       .MEMORY_INIT_FILE("imem.mem"), // String
       .MEMORY_INIT_PARAM("0"),       // String
       .MEMORY_OPTIMIZATION("true"),  // String
       .MEMORY_PRIMITIVE("auto"),     // String
       .MEMORY_SIZE(2048),            // DECIMAL
       .MESSAGE_CONTROL(0),           // DECIMAL
       .READ_DATA_WIDTH_A(32),        // DECIMAL
       .READ_LATENCY_A(1),            // DECIMAL
       .READ_RESET_VALUE_A("0"),      // String
       .USE_MEM_INIT(1),              // DECIMAL
       .WAKEUP_TIME("disable_sleep"), // String
       .WRITE_DATA_WIDTH_A(32),       // DECIMAL
       .WRITE_MODE_A("read_first")    // String
    )
    xpm_memory_spram_inst (
       .dbiterra(dbiterra),             // 1-bit output: Status signal to indicate double bit error occurrence
                                        // on the data output of port A.
 
       .douta(inst_o),                   // READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
       .sbiterra(sbiterra),             // 1-bit output: Status signal to indicate single bit error occurrence
                                        // on the data output of port A.
 
       .addra({pc_next[9:2], 2'b0}),    // ADDR_WIDTH_A-bit input: Address for port A write and read operations.
       .clka(clka),                     // 1-bit input: Clock signal for port A.
       .dina(dina),                     // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
       .ena(1'b1),                       // 1-bit input: Memory enable signal for port A. Must be high on clock
                                        // cycles when read or write operations are initiated. Pipelined
                                        // internally.
 
       .injectdbiterra(injectdbiterra), // 1-bit input: Controls double bit error injection on input data when
                                        // ECC enabled (Error injection capability is not available in
                                        // "decode_only" mode).
 
       .injectsbiterra(injectsbiterra), // 1-bit input: Controls single bit error injection on input data when
                                        // ECC enabled (Error injection capability is not available in
                                        // "decode_only" mode).
 
       .regcea(1'b1),                 // 1-bit input: Clock Enable for the last register stage on the output
                                        // data path.
 
       .rsta(rsta),                     // 1-bit input: Reset signal for the final port A output register stage.
                                        // Synchronously resets output port douta to the value specified by
                                        // parameter READ_RESET_VALUE_A.
 
       .sleep(sleep),                   // 1-bit input: sleep signal to enable the dynamic power saving feature.
       .wea(1'b0)                        // WRITE_DATA_WIDTH_A-bit input: Write enable vector for port A input
                                        // data port dina. 1 bit wide when word-wide writes are used. In
                                        // byte-wide write configurations, each bit controls the writing one
                                        // byte of dina to address addra. For example, to synchronously write
                                        // only bits [15-8] of dina when WRITE_DATA_WIDTH_A is 32, wea would be
                                        // 4'b0010.
 
    );
endmodule
