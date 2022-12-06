module ucomb (
    input [3:0] u21_in,
    input [5:0] u31_in,
    input [9:0] u41_in,
    input [5:0] u22_in,
    input u22_sel,
    output u21_out,
    output u31_out,
    output u41_out,
    output [1:0] u22_out,
    output mux_out
);

u21 u21_inst (
    .in(u21_in),
    .out(u21_out)
);

u31 u31_inst (
    .in(u31_in),
    .out(u31_out)
);

u41 u41_inst (
    .in(u41_in),
    .out(u41_out)
);

u22 u22_inst (
    .in(u22_in),
    .out(u22_out)
);

assign mux_out = u22_out[u22_sel];

endmodule

