// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module u21 (
    input [3:0] in,
    output out
);

wire a, b, c, d;
assign {a, b, c, d} = in;

wire x = (a&~b)^c^d;

assign out = x;

endmodule

