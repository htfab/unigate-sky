// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module mux1 (
    input [1:0] in,
    input sel,
    output out
);

wire a, b;
assign {a, b} = in;

assign out = sel ? b : a;

endmodule


module mux2 (
    input [3:0] in,
    input [1:0] sel,
    output out
);

wire [1:0] a, b;
wire sh, sl, oa, ob;
assign {a, b} = in;
assign {sh, sl} = sel;

mux1 ma (
    .in(a),
    .sel(sh),
    .out(oa)
);

mux1 mb (
    .in(b),
    .sel(sh),
    .out(ob)
);

assign out = sl ? ob : oa;

endmodule


module mux3 (
    input [7:0] in,
    input [2:0] sel,
    output out
);

wire [3:0] a, b;
wire sl, oa, ob;
wire [1:0] sh;
assign {a, b} = in;
assign {sh, sl} = sel;

mux2 ma (
    .in(a),
    .sel(sh),
    .out(oa)
);

mux2 mb (
    .in(b),
    .sel(sh),
    .out(ob)
);

assign out = sl ? ob : oa;

endmodule


module mux4 (
    input [15:0] in,
    input [3:0] sel,
    output out
);

wire [7:0] a, b;
wire sl, oa, ob;
wire [2:0] sh;
assign {a, b} = in;
assign {sh, sl} = sel;

mux3 ma (
    .in(a),
    .sel(sh),
    .out(oa)
);

mux3 mb (
    .in(b),
    .sel(sh),
    .out(ob)
);

assign out = sl ? ob : oa;

endmodule

