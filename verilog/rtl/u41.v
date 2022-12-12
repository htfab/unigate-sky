// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module u41 (
    input [9:0] in,
    output out
);

wire a, b, c, d, e, f, g, h, i, j;
assign {a, b, c, d, e, f, g, h, i, j} = in;

wire x = ((((a|b)&(c|~d))^(e&f)^(g&h))&(((f^d)|(i^~h))^(g|b)^(~h|b)))^
         ((((e|~g)^j^f)&(e|~g)&(e^~b))|((a^b)&~j&~c)|(j&~i)|h|d)^
         ((((a^d)&c&~f)^(e|~g)^(h&~b))&((a&~b)|j|g)&(g|f)&~e&i)^
         (((j&~g)|(a^~b))&((i&d)|~a|~f))^((~c|i)&(i|b))^((j|f)&~h&a);

assign out = x;

endmodule

