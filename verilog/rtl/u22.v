module u22 (
    input [5:0] in,
    output [1:0] out
);

wire a, b, c, d, e, f;
assign {a, b, c, d, e, f} = in;

wire x = (((a&~b)^c^d)&(c|e|a))^((b^a^f)|(d&~c));
wire y = (((a&~b)^c^d)&(c|e|~a))^((b^a)|(d&~c)|e);

assign out = {x, y};

endmodule

