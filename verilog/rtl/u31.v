// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module u31 (
    input [5:0] in,
    output out
);

wire a, b, c, d, e, f;
assign {a, b, c, d, e, f} = in;

wire x = (((a^~b)&c)|(d^e))^((d|~a)&b)^f;

assign out = x;

endmodule

