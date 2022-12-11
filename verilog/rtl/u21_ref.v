module u21_ref (
    input [3:0] func,
    input [1:0] pin,
    output [2:0] wiring
);

parameter U21_REF_LEN = 16;
(* rom_style = "block" *)
reg [11:0] u21_ref_data [0:U21_REF_LEN-1];
initial $readmemb("u21_ref.mem", u21_ref_data);

wire [11:0] wfull = u21_ref_data[func];
assign wiring = wfull[3*pin+:3];

endmodule

