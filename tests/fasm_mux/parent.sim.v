`include "./gate/gate.sim.v"
`include "./mux/mux.sim.v"

module PARENT (
    input  wire [3:0] I,
    output wire [1:0] O
);

    // A gate that can be bypassed by a mux with FASM annotation
    wire a;

    (* FASM_PREFIX="GATE" *)    
    GATE gate_a (
        .I0 (I[0]),
        .I1 (I[1]),
        .O  (a)
    );

    (* FASM *)
    MUX mux_with_fasm (
        .I0 (I[0]),
        .I1 (a),
        .O  (O[0])
    );

    // A gate that can be bypassed by a mux without FASM annotation
    wire b;
    GATE gate_b (
        .I0 (I[2]),
        .I1 (I[3]),
        .O  (b)
    );

    MUX mux_without_fasm (
        .I0 (I[2]),
        .I1 (b),
        .O  (O[1])
    );

endmodule
