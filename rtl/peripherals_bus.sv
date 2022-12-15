//this is the module by which all peripherals will be connected

module peripherals_bus #(
    parameter  DW             = 32,
    parameter  MEM_SIZE_IN_KB = 1,                           //size of the data memory in kBs
    localparam NO_OF_REGS     = MEM_SIZE_IN_KB * 1024 / 4,   //4 bytes in 32 bits
    localparam ADDRW          = $clog2(NO_OF_REGS)
) (
    input  logic [DW-1:0]    data_load_i,    //data to load from peripherals (input side of bus)
    output logic [DW-1:0]    data_load_o,    //data to load at peripherals (output side of the bus)

    input  logic [DW-1:0]    addr_i,
    output logic [ADDRW-1:0] addr_o,

    input  logic [DW-1:0]    data_store_i,   //data to store at peripherals (input side of bus)
    output logic [DW-1:0]    data_store_o,   //data to be stored at peripherals (output side of bus)

    input  logic [3:0]       mask_dm_i,      //for data memory
    output logic [3:0]       mask_dm_o       //for data memory

    output logic             cs_dm,          //chip select of data memory
    output logic             cs_uart         //chip select of data memory

);

    always_comb begin
        addr_o    = addr_i[ADDRW+1:2];      //because last 2 LSBs are to access bytes (byte accesible)
        mask_dm_o = mask_dm_i;
    end

    always_comb begin
        cs_dm   = addr_i[ADDRW+2];
        cs_uart = addr_i[ADDRW+3];
    end


endmodule