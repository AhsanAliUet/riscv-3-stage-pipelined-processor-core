//this module is used to generate immediate of csr to 
//support CSRRWI

module csr_imm #(
    parameter DW = 32
)(
    input  logic [DW-1:0] inst,
    output logic [DW-1:0] imm_csr
);

    always_comb begin
        if (inst[6:0] == 7'b1110011) begin   //check the opcode if it is a CSR instruction
            imm_csr = {27'b0, inst[19:15]};  //zero extended immediate
        end
        else begin
            imm_csr = '0;
        end
    end


endmodule