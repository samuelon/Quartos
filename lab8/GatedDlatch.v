module GatedDlatch(D,Clk,Q);
input D, Clk;
output reg Q;

always@(D,Clk)
	if(Clk)
		Q=D;
endmodule

//
//wire D_1,D_2,Qa,Qb;
//
////S
//nand(D_a,D,Clk);
//
////R
//nand(D_b,~D, Clk);
//
////S_Qb
//nand(Qa,Qb,D_a );
//
////R_Qa
//nand(Qb,Qa,D_b);
//
////result
//assign Q = Qa;
