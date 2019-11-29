module TFFupcountSyn(T, Clk, Resetn, Q);
input T, Clk, Resetn;
output [3:0]Q;

//TFlipflop(T, Clk, Resetn, Q);
//Takes in the values T1 = Q0,Q1

and(T1, Q[0],Q[1]);
and(T2, T2, Q[2]);

TFlipflop stage0 (T, Clk, Resetn, Q[0]);
TFlipflop stage1 (Q[0], Clk, Resetn,Q[1] );
TFlipflop stage2 (T1, Clk, Resetn, Q[2]);
TFlipflop stage3 (T2, Clk, Resetn, Q[3]);

endmodule