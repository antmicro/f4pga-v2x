(* CLASS="lut" *)
(* whitebox *)
module LUT_CELL (I, O);

    (* PORT_CLASS="lut_in" *)
    input  wire [3:0] I;

    (* PORT_CLASS="lut_out" *)
    output wire       O;

    parameter [15:0] INIT = 16'b0;
    assign O = INIT[I];

endmodule
