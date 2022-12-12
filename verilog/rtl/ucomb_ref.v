// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module ucomb_ref (
    input [1:0] sel,
    input [15:0] func,
    input [3:0] pin,
    output [5:0] wpin
);

wire u21_valid = (func[15:4] == 12'b0) && (pin < 4'd4);
wire u31_valid = (func[15:8] == 8'b0) && (pin < 4'd6);
wire u41_valid = pin < 4'd10;
wire u22_valid = (func[15:8] == 8'b0) && (pin < 4'd6);

wire [2:0] u21_wiring;
wire [2:0] u31_wiring;
wire [2:0] u41_wiring;
wire [2:0] u22_wiring;

u21_ref u21_ref_inst (
    .func(func[3:0]),
    .pin(pin[1:0]),
    .wiring(u21_wiring)
);

u31_ref u31_ref_inst (
    .func(func[7:0]),
    .pin(pin[2:0]),
    .wiring(u31_wiring)
);

u41_ref u41_ref_inst (
    .func(func),
    .pin(pin),
    .wiring(u41_wiring)
);

u22_ref u22_ref_inst (
    .func1(func[3:0]),
    .func2(func[7:4]),
    .pin(pin[2:0]),
    .wiring(u22_wiring)
);

reg valid;
reg [2:0] wiring;

always @ (*) begin
    case (sel)
        2'b00 : begin
            valid = u21_valid;
            wiring = u21_wiring;
            end
        2'b01: begin
            valid = u31_valid;
            wiring = u31_wiring;
            end
        2'b10: begin
            valid = u41_valid;
            wiring = u41_wiring;
            end
        2'b11: begin
            valid = u22_valid;
            wiring = u22_wiring;
            end
    endcase
end

assign wpin[0] = valid & (wiring == 3'b000);
assign wpin[1] = valid & (wiring == 3'b001);
assign wpin[2] = valid & (wiring == 3'b010);
assign wpin[3] = valid & (wiring == 3'b011);
assign wpin[4] = valid & (wiring == 3'b100);
assign wpin[5] = valid & (wiring == 3'b101);

endmodule

