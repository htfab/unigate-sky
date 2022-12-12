// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module u31_ref (
    input [7:0] func,
    input [2:0] pin,
    output [2:0] wiring
);

parameter U31_REF_LEN = 256;
(* rom_style = "block" *)
reg [17:0] u31_ref_data [0:U31_REF_LEN-1];
initial $readmemb("u31_ref.mem", u31_ref_data);

wire [17:0] wfull = u31_ref_data[func];
assign wiring = wfull[3*pin+:3];

endmodule

