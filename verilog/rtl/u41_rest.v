module u41_rest (
    input [7:0] perm,
    input [2:0] coord,
    output [2:0] ncoord
);

wire s;
wire [1:0] ps, pt;
assign {s, ps} = coord - 3'd2;
assign pt = s ? ps : (perm[2*(3'd3-ps)+:2]);
assign ncoord = {s, pt} + 3'd2;

endmodule

