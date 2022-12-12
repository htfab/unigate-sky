// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module u41_ref (
    input [15:0] func,
    input [3:0] pin,
    output [2:0] wiring
);

wire [2:0] nwiring;
wire [15:0] nfunc;
wire [7:0] perm;

u41_norm norm (
    .func(func),
    .norm(nfunc),
    .perm(perm)
);

u41_rest rest (
    .perm(perm),
    .coord(nwiring),
    .ncoord(wiring)
);

parameter U41_RID1_LEN = 1024;
(* rom_style = "block" *)
reg [6:0] u41_rid1_data[0:U41_RID1_LEN-1];
initial $readmemb("u41_rid1.mem", u41_rid1_data);

parameter U41_RID2_LEN = 1440;
(* rom_style = "block" *)
reg [9:0] u41_rid2_data[0:U41_RID2_LEN-1];
initial $readmemb("u41_rid2.mem", u41_rid2_data);

parameter U41_IREF_LEN = 3984;
(* rom_style = "block" *)
reg [29:0] u41_iref_data[0:U41_IREF_LEN-1];
initial $readmemb("u41_iref.mem", u41_iref_data);

wire a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
assign {a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p} = nfunc;
wire [9:0] ria1 = {b, c, d, e, f, g, i, j, k, m};
wire [6:0] rid1 = u41_rid1_data[ria1];
wire [10:0] ria2 = {rid1, h, l, n, o};
wire [9:0] rid2 = u41_rid2_data[ria2];
wire [11:0] ifunc = {{1'b0, rid2} + (a ? 11'd996 : 11'b0), p};
wire [29:0] pwfull = u41_iref_data[ifunc];
assign nwiring = pwfull[3*pin+:3];

endmodule

