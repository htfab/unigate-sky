// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module ucomb_full_tb ();

integer i;
reg [3:0] func;
wire [1:0] subs = i;
reg [3:0] wiring;
wire a, b;
assign {a, b} = subs;
wire dut_out, mux_out;
wire assert = dut_out == mux_out;

wire O = 1'b0;
wire I = 1'b1;

wire [4:0] dut_out_hi;
ucomb_full dut (
    .in({23'b10011000000000000000100, wiring}),
    .out({dut_out_hi, dut_out})
);

mux2 mux (
    .in(func),
    .sel(subs),
    .out(mux_out)
);

initial begin
    for (i=0; i<4; i=i+1) begin
        #1 func = {O, O, O, O}; wiring = {O, O, O, O}; #1 $display(assert);
        #1 func = {O, O, O, I}; wiring = {a, b, a, O}; #1 $display(assert);
        #1 func = {O, O, I, O}; wiring = {b, a, O, O}; #1 $display(assert);
        #1 func = {O, O, I, I}; wiring = {b, O, O, O}; #1 $display(assert);
        #1 func = {O, I, O, O}; wiring = {a, b, O, O}; #1 $display(assert);
        #1 func = {O, I, O, I}; wiring = {a, O, O, O}; #1 $display(assert);
        #1 func = {O, I, I, O}; wiring = {b, O, a, O}; #1 $display(assert);
        #1 func = {O, I, I, I}; wiring = {b, a, a, O}; #1 $display(assert);
        #1 func = {I, O, O, O}; wiring = {b, a, a, I}; #1 $display(assert);
        #1 func = {I, O, O, I}; wiring = {I, b, a, O}; #1 $display(assert);
        #1 func = {I, O, I, O}; wiring = {I, a, O, O}; #1 $display(assert);
        #1 func = {I, O, I, I}; wiring = {a, b, I, O}; #1 $display(assert);
        #1 func = {I, I, O, O}; wiring = {I, b, O, O}; #1 $display(assert);
        #1 func = {I, I, O, I}; wiring = {b, a, I, O}; #1 $display(assert);
        #1 func = {I, I, I, O}; wiring = {a, b, a, I}; #1 $display(assert);
        #1 func = {I, I, I, I}; wiring = {I, O, O, O}; #1 $display(assert);
        #1 wiring = {O, O, I, I}; #1 $display({dut_out_hi, dut_out} == 6'd4);
    end
end

endmodule

