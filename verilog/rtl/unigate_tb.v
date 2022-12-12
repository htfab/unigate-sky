// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module unigate_tb ();

reg clk;
wire [26:0] inputs;
wire [5:0] outputs;

wire wbs_ack_o_ignore;
wire [31:0] wbs_dat_o_ignore;
wire [127:0] la_data_out_ignore;
wire [31:0] io_out_ignore;
wire [37:0] io_oeb_ignore;
wire [2:0] irq_ignore;

unigate dut (
    .wb_clk_i(clk),
    .wb_rst_i(1'b0),
    .wbs_stb_i(1'b0),
    .wbs_cyc_i(1'b0),
    .wbs_we_i(1'b0),
    .wbs_sel_i(4'b0),
    .wbs_dat_i(32'b0),
    .wbs_adr_i(32'b0),
    .wbs_ack_o(wbs_ack_o_ignore),
    .wbs_dat_o(wbs_dat_o_ignore),
    .la_data_in(128'b0),
    .la_data_out(la_data_out_ignore),
    .la_oenb(128'b0),
    .io_in({6'b0, inputs, 5'b0}),
    .io_out({outputs, io_out_ignore}),
    .io_oeb(io_oeb_ignore),
    .irq(irq_ignore)
);

wire refmode;
wire [1:0] sel;
wire g, h, i, j, k, l, m, n, o, p;
wire q, r, s, t, u, v, w;

wire [3:0] u21_in = (sel == 2'b00) ? {g, h, i, j} : 4'b0;
wire [5:0] u31_in = (sel == 2'b01) ? {g, h, i, j, k, l} : 6'b0;
wire [9:0] u41_in = (sel == 2'b10) ? {g, h, i, j, k, l, m, n, o, p} : 10'b0;
wire [5:0] u22_in = (sel == 2'b11) ? {g, h, i, j, k, l} : 6'b0;
wire u22_sel = (sel == 2'b11) ? m : 1'b0;
wire [26:0] ucomb_in = {u22_sel, u22_in, u41_in, u31_in, u21_in};
wire [15:0] func;
wire [3:0] pin;
wire [26:0] ucomb_ref_in = {1'b1, pin, func, sel, 4'b0011};
assign inputs = refmode ? ucomb_ref_in : ucomb_in;

wire [5:0] ucomb_out = outputs;
wire u21_out, u31_out, u41_out, mux_out;
wire [1:0] u22_out;
assign {mux_out, u22_out, u41_out, u31_out, u21_out} = ucomb_out;
wire [5:0] wpin_ref = ucomb_out;



reg a, b, c, d;

//assign refmode = 1'b0;
//assign sel = 2'b00;
//assign {g, h, i, j} = {b, a, a, 1'b0};
//wire res = u21_out;

//assign refmode = 1'b0;
//assign sel = 2'b10;
//assign {g, h, i, j, k, l, m, n, o, p} = {d, 1'b1, c, 1'b1, b, 1'b1, a, 1'b1, 1'b1, 1'b0};
//wire res = u41_out;

//assign refmode = 1'b0;
//assign sel = 2'b10;
//assign {g, h, i, j, k, l, m, n, o, p} = {b, 1'b1, 1'b1, d, c, 1'b0, 1'b1, b, 1'b0, a};
//wire res = u41_out;

//assign refmode = 1'b1;
//assign sel = 2'b00;
//assign func = 4'b1000;
//assign pin = {d, c, b, a};
//wire [5:0] res = wpin_ref;

//assign refmode = 1'b1;
//assign sel = 2'b10;
//assign func = 16'b0110100110010110;
//assign pin = {d, c, b, a};
//wire [5:0] res = wpin_ref;

assign refmode = 1'b1;
assign sel = 2'b10;
assign func = 16'b1000000000000000;
assign pin = {d, c, b, a};
wire [5:0] res = wpin_ref;

integer tc;
always #1 clk ^= 1;

initial begin
    clk <= 0;
    for (tc=0; tc<16; tc=tc+1) begin
        #100
        a <= (tc & 1'b1);
        b <= ((tc >> 1) & 1'b1);
        c <= ((tc >> 2) & 1'b1);
        d <= ((tc >> 3) & 1'b1);
        #100
        $display("%b%b%b%b %b", a, b, c, d, res);
    end
    #100
    $finish;
end

endmodule

