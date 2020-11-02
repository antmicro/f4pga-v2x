`include "../lut_cell/lut_cell.sim.v"

(* FASM_LUT="LUT_INIT" *)
module SINGLE(
    input  wire [3:0] I,
    output wire       O
);

    parameter [15:0] INIT = 16'd0;

    // The LUT
    LUT_CELL # (
        .INIT (INIT),
    )
    lut
    (
        .I (I),
        .O (O)
    );

endmodule
