(* CLASS="routing" *)
(* MODES="I0;I1" *)
(* whitebox *)

module MUX (
    input  wire I0,
    input  wire I1,
    output wire O
);

    parameter MODE = "";

    generate if (MODE == "I0") begin
        assign O = I0;
    end else if (MODE == "I1") begin
        assign O = I1;
    end endgenerate

endmodule
