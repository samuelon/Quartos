module GatedDlatch(D,Clk,Q);
input D, Clk;
output Q;

wire D_1,D_2,Qa,Qb;

nand(D_a,D,Clk);
nand(D_b,~D, Clk);

nand(Qa,Qb,D_a );
nand(Qb,Qa,D_b);

assign Q = Qa;

endmodule