module ucomb_full (
    input [26:0] in,
    output [5:0] out
);

wire [5:0] ucomb_out;
wire [5:0] ucomb_ref_out;

ucomb ucomb_inst (
    .u21_in(in[3:0]),
    .u31_in(in[9:4]),
    .u41_in(in[19:10]),
    .u22_in(in[25:20]),
    .u22_sel(in[26]),
    .u21_out(ucomb_out[0]),
    .u31_out(ucomb_out[1]),
    .u41_out(ucomb_out[2]),
    .u22_out(ucomb_out[4:3]),
    .mux_out(ucomb_out[5])
);

ucomb_ref ucomb_ref_inst (
    .sel(in[5:4]),
    .func(in[21:6]),
    .pin(in[25:22]),
    .wpin(ucomb_ref_out)
);

wire refmode = in[3:0] == 4'b0011 && in[26] == 1'b1;
assign out = refmode ? ucomb_ref_out : ucomb_out;

endmodule

