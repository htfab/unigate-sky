// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2022 Tamas Hubai

`default_nettype none

module u41_norm (
    input [15:0] func,
    output [15:0] norm,
    output [7:0] perm
);

wire a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
assign {a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p} = func;

wire [15:0] func00 = {a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p};
wire [15:0] func01 = {a, b, c, d, i, j, k, l, e, f, g, h, m, n, o, p};
wire [15:0] func02 = {a, b, e, f, c, d, g, h, i, j, m, n, k, l, o, p};
wire [15:0] func03 = {a, b, i, j, c, d, k, l, e, f, m, n, g, h, o, p};
wire [15:0] func04 = {a, b, e, f, i, j, m, n, c, d, g, h, k, l, o, p};
wire [15:0] func05 = {a, b, i, j, e, f, m, n, c, d, k, l, g, h, o, p};
wire [15:0] func06 = {a, c, b, d, e, g, f, h, i, k, j, l, m, o, n, p};
wire [15:0] func07 = {a, c, b, d, i, k, j, l, e, g, f, h, m, o, n, p};
wire [15:0] func08 = {a, e, b, f, c, g, d, h, i, m, j, n, k, o, l, p};
wire [15:0] func09 = {a, i, b, j, c, k, d, l, e, m, f, n, g, o, h, p};
wire [15:0] func10 = {a, e, b, f, i, m, j, n, c, g, d, h, k, o, l, p};
wire [15:0] func11 = {a, i, b, j, e, m, f, n, c, k, d, l, g, o, h, p};
wire [15:0] func12 = {a, c, e, g, b, d, f, h, i, k, m, o, j, l, n, p};
wire [15:0] func13 = {a, c, i, k, b, d, j, l, e, g, m, o, f, h, n, p};
wire [15:0] func14 = {a, e, c, g, b, f, d, h, i, m, k, o, j, n, l, p};
wire [15:0] func15 = {a, i, c, k, b, j, d, l, e, m, g, o, f, n, h, p};
wire [15:0] func16 = {a, e, i, m, b, f, j, n, c, g, k, o, d, h, l, p};
wire [15:0] func17 = {a, i, e, m, b, j, f, n, c, k, g, o, d, l, h, p};
wire [15:0] func18 = {a, c, e, g, i, k, m, o, b, d, f, h, j, l, n, p};
wire [15:0] func19 = {a, c, i, k, e, g, m, o, b, d, j, l, f, h, n, p};
wire [15:0] func20 = {a, e, c, g, i, m, k, o, b, f, d, h, j, n, l, p};
wire [15:0] func21 = {a, i, c, k, e, m, g, o, b, j, d, l, f, n, h, p};
wire [15:0] func22 = {a, e, i, m, c, g, k, o, b, f, j, n, d, h, l, p};
wire [15:0] func23 = {a, i, e, m, c, k, g, o, b, j, f, n, d, l, h, p};

wire [7:0] perm00 = {2'd0, 2'd1, 2'd2, 2'd3};
wire [7:0] perm01 = {2'd0, 2'd1, 2'd3, 2'd2};
wire [7:0] perm02 = {2'd0, 2'd2, 2'd1, 2'd3};
wire [7:0] perm03 = {2'd0, 2'd3, 2'd1, 2'd2};
wire [7:0] perm04 = {2'd0, 2'd2, 2'd3, 2'd1};
wire [7:0] perm05 = {2'd0, 2'd3, 2'd2, 2'd1};
wire [7:0] perm06 = {2'd1, 2'd0, 2'd2, 2'd3};
wire [7:0] perm07 = {2'd1, 2'd0, 2'd3, 2'd2};
wire [7:0] perm08 = {2'd2, 2'd0, 2'd1, 2'd3};
wire [7:0] perm09 = {2'd3, 2'd0, 2'd1, 2'd2};
wire [7:0] perm10 = {2'd2, 2'd0, 2'd3, 2'd1};
wire [7:0] perm11 = {2'd3, 2'd0, 2'd2, 2'd1};
wire [7:0] perm12 = {2'd1, 2'd2, 2'd0, 2'd3};
wire [7:0] perm13 = {2'd1, 2'd3, 2'd0, 2'd2};
wire [7:0] perm14 = {2'd2, 2'd1, 2'd0, 2'd3};
wire [7:0] perm15 = {2'd3, 2'd1, 2'd0, 2'd2};
wire [7:0] perm16 = {2'd2, 2'd3, 2'd0, 2'd1};
wire [7:0] perm17 = {2'd3, 2'd2, 2'd0, 2'd1};
wire [7:0] perm18 = {2'd1, 2'd2, 2'd3, 2'd0};
wire [7:0] perm19 = {2'd1, 2'd3, 2'd2, 2'd0};
wire [7:0] perm20 = {2'd2, 2'd1, 2'd3, 2'd0};
wire [7:0] perm21 = {2'd3, 2'd1, 2'd2, 2'd0};
wire [7:0] perm22 = {2'd2, 2'd3, 2'd1, 2'd0};
wire [7:0] perm23 = {2'd3, 2'd2, 2'd1, 2'd0};

wire [15:0] funcA, funcB, funcC, funcD, funcE, funcF, funcG, funcH, funcI, funcJ, funcK, funcL,
            funcM, funcN, funcO, funcP, funcQ, funcR, funcS, funcT, funcU, funcV, funcW, funcX;
wire [7:0] permA, permB, permC, permD, permE, permF, permG, permH, permI, permJ, permK, permL,
           permM, permN, permO, permP, permQ, permR, permS, permT, permU, permV, permW, permX;

assign {funcA, permA} = (func00 <= func01) ? {func00, perm00} : {func01, perm01};
assign {funcB, permB} = (func02 <= func03) ? {func02, perm02} : {func03, perm03};
assign {funcC, permC} = (func04 <= func05) ? {func04, perm04} : {func05, perm05};
assign {funcD, permD} = (func06 <= func07) ? {func06, perm06} : {func07, perm07};
assign {funcE, permE} = (func08 <= func09) ? {func08, perm08} : {func09, perm09};
assign {funcF, permF} = (func10 <= func11) ? {func10, perm10} : {func11, perm11};
assign {funcG, permG} = (func12 <= func13) ? {func12, perm12} : {func13, perm13};
assign {funcH, permH} = (func14 <= func15) ? {func14, perm14} : {func15, perm15};
assign {funcI, permI} = (func16 <= func17) ? {func16, perm16} : {func17, perm17};
assign {funcJ, permJ} = (func18 <= func19) ? {func18, perm18} : {func19, perm19};
assign {funcK, permK} = (func20 <= func21) ? {func20, perm20} : {func21, perm21};
assign {funcL, permL} = (func22 <= func23) ? {func22, perm22} : {func23, perm23};

assign {funcM, permM} = (funcA <= funcB) ? {funcA, permA} : {funcB, permB};
assign {funcN, permN} = (funcC <= funcD) ? {funcC, permC} : {funcD, permD};
assign {funcO, permO} = (funcE <= funcF) ? {funcE, permE} : {funcF, permF};
assign {funcP, permP} = (funcG <= funcH) ? {funcG, permG} : {funcH, permH};
assign {funcQ, permQ} = (funcI <= funcJ) ? {funcI, permI} : {funcJ, permJ};
assign {funcR, permR} = (funcK <= funcL) ? {funcK, permK} : {funcL, permL};

assign {funcS, permS} = (funcM <= funcN) ? {funcM, permM} : {funcN, permN};
assign {funcT, permT} = (funcO <= funcP) ? {funcO, permO} : {funcP, permP};
assign {funcU, permU} = (funcQ <= funcR) ? {funcQ, permQ} : {funcR, permR};

assign {funcV, permV} = (funcS <= funcT) ? {funcS, permS} : {funcT, permT};
assign {funcW, permW} = {funcU, permU};

assign {funcX, permX} = (funcV <= funcW) ? {funcV, permV} : {funcW, permW};

assign {norm, perm} = {funcX, permX};

endmodule

