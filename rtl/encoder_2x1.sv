
module encoder_2x1 #(
    parameter W = 1
)(
    input  logic in0,
    input  logic in1,

    output logic out,
);

    always_comb begin
        if (in0) begin
            out = 0;
        end
        else if (in1) begin
            out = 1;
        end
        else begin
            out = 0;   //giving priority to in0
        end
    end


endmodule