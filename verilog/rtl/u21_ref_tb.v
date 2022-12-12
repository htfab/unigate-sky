// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module u21_ref_tb ();

integer i;
reg clk;
reg [11:0] func;
wire [1:0] pin = i;
reg [11:0] wiring;
wire [2:0] wtest;
wire [3:0] fcmp = {func[9], func[6], func[3], func[0]};
wire [7:0] fres = {func[11], func[10], func[8], func[7], func[5], func[4], func[2], func[1]};
wire assert = (wiring[3*i+:3] == wtest) && (fres == 8'b0);

wire [2:0] O = 3'b000;
wire [2:0] I = 3'b001;
wire [2:0] a = 3'b010;
wire [2:0] b = 3'b011;

u21_ref dut (
    .clk(clk),
    .func(fcmp),
    .pin(pin),
    .wiring(wtest)
);

always #1 clk ^= 1;

initial begin
    clk <= 0;
    for (i=0; i<4; i=i+1) begin
        #2 func <= {O, O, O, O}; wiring <= {O, O, O, O}; #4 $display(assert);
        #2 func <= {O, O, O, I}; wiring <= {a, b, a, O}; #4 $display(assert);
        #2 func <= {O, O, I, O}; wiring <= {b, a, O, O}; #4 $display(assert);
        #2 func <= {O, O, I, I}; wiring <= {b, O, O, O}; #4 $display(assert);
        #2 func <= {O, I, O, O}; wiring <= {a, b, O, O}; #4 $display(assert);
        #2 func <= {O, I, O, I}; wiring <= {a, O, O, O}; #4 $display(assert);
        #2 func <= {O, I, I, O}; wiring <= {b, O, a, O}; #4 $display(assert);
        #2 func <= {O, I, I, I}; wiring <= {b, a, a, O}; #4 $display(assert);
        #2 func <= {I, O, O, O}; wiring <= {b, a, a, I}; #4 $display(assert);
        #2 func <= {I, O, O, I}; wiring <= {I, b, a, O}; #4 $display(assert);
        #2 func <= {I, O, I, O}; wiring <= {I, a, O, O}; #4 $display(assert);
        #2 func <= {I, O, I, I}; wiring <= {a, b, I, O}; #4 $display(assert);
        #2 func <= {I, I, O, O}; wiring <= {I, b, O, O}; #4 $display(assert);
        #2 func <= {I, I, O, I}; wiring <= {b, a, I, O}; #4 $display(assert);
        #2 func <= {I, I, I, O}; wiring <= {a, b, a, I}; #4 $display(assert);
        #2 func <= {I, I, I, I}; wiring <= {I, O, O, O}; #4 $display(assert);
    end
    $finish;
end

endmodule

