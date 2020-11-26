`include "./lut/lut4.sim.v"
`include "./ff/ff.sim.v"
`include "./mux/mux.sim.v"

module CLB (
    input  wire CLK,
    input  wire [3:0] IA,
    input  wire [3:0] IB,
    output wire O
);

    // "A" LUT
    (* PACK="ALUT_TO_FF" *)
    wire oa;

    LUT4 ALUT (
        .I(IA),
        .O(oa)
    );

    // "B" LUT
    (* PACK="BLUT_TO_FF" *)
    wire ob;

    LUT4 BLUT (
        .I(IB),
        .O(ob)
    );

    // Routing mux
    wire d;

    MUX LUT_MUX (
        .I0 (oa),
        .I1 (ob),
        .O  (d)
    );

    // Flip-flop
    FF FF (
        .CLK (CLK),
        .D   (d),
        .Q   (O)
    );

endmodule
