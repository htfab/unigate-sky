// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module u41_fullref (
    input [15:0] func,
    input [3:0] pin,
    output [2:0] wiring
);

parameter U41_FULLREF_LEN = 65536;
(* rom_style = "block" *)
reg [29:0] u41_fullref_data [0:U41_FULLREF_LEN-1];
initial $readmemb("u41_fullref.mem", u41_fullref_data);

wire [29:0] wfull = u41_fullref_data[func];
assign wiring = wfull[3*pin+:3];

endmodule

