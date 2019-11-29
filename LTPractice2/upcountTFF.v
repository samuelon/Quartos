module upcountTFF(T,Clk,Rstn,Q);

input Clk, Rstn, T;
output [3:0]Q;

//TFlipflop(T, Clk, Resetn, Q);	
TFlipflop stage0 (T,Clk,Rstn,Q[0]);
TFlipflop stage1 (T,~Q[0],Rstn,Q[1]);
TFlipflop stage2 (T,~Q[1],Rstn,Q[2]);

endmodule