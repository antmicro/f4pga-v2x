`include "../lut_cell/lut_cell.sim.v"

(* FASM_LUT *)
module SPLIT(
    input  wire [3:0] I,
    output wire [1:0] O
);

    genvar i;
    generate for (i=0; i<2; i=i+1) begin

        // Lut fraction
        LUT_CELL lut (
            .I (I),
            .O (O[i])
        );

    end endgenerate

endmodule
