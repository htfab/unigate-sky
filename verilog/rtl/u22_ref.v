module u22_ref (
    input [3:0] func1,
    input [3:0] func2,
    input [2:0] pin,
    output [2:0] wiring
);

parameter U22_REF_LEN = 256;
(* rom_style = "block" *)
reg [17:0] u22_ref_data [0:U22_REF_LEN-1];
initial $readmemb("u22_ref.mem", u22_ref_data);

wire [7:0] func = {func1, func2};
wire [17:0] wfull = u22_ref_data[func];
assign wiring = wfull[3*pin+:3];

endmodule

