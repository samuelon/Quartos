module testeverything(D,Clk,Resetn,Q);
input D, Clk, Resetn;
output reg Q;

always @( posedge Clk or negedge Resetn);
begin
	if (!Resetn) begin \\aclr
		Q<=0;
	end else begin
		Q<=D;
	end
end

endmodule
//------------------------------------------------------

module nbitreg(R,Clk,Resetn,Q);
parameter n = 16;
input Clk, Resetn;
input [n-1:0]R;
output reg [n-1:0]Q;

always@(posedge Clk)
begin
	if (!Resetn)
		Q <= 0;
	else
		Q<=R;
end

endmodule

//---------------------------------------
module nshiftreg(In,R,L,Clk,Resetn,Q)

parameter n = 4;
input In, L, Clk, Resetn;
input [n-1:0]R;
output reg [n-1:0]Q;
integer k;

always@(posedge Clk)
begin
	if (!Resetn)
		Q <= 0;
	else if (L) begin
		Q<=R;
	end else begin
		Q[n-1] <= In;
		
		for (k = 0 ; k < n-1; k = k + 1)
		begin
			Q[k] = [k+1];
		end
	end
end

endmodule

//------------------------------------------
module TFF(T, Clk, Resetn, Q);

input T, Clk, Resetn;

output reg Q;

always @( posedge Clk or negedge Resetn)
begin
	if(!Resetn) begin
		Q <= 0;
	end else if (T) begin
		Q <= ~Q;
	end
end

endmodule

//----------------------------
module TFFupcount(T, Clk, Resetn, Q)
input T, Clk, Resetn;

output [3:0]Q;
and(T1, Q[0],Q[1]);
and(T2, T1, Q[2]);
TFF stage0 (T, Clk, Resetn, Q[0]);
TFF stage1 (Q[0], Clk, Resetn,Q[1]);
TFF stage2 (T1, Clk, Resetn, Q[2]);
TFF stage3 (T2, Clk, Resetn, Q[3]);

endmodule


//-------------------------------
module asynupcount(Clk, Resetn,Q);

input Clk, Resetn;

output reg [3:0]Q;

always@(posedge Clk or negedge Resetn)
begin
	if(!Resetn) // aclr
		Q<= 0;
	else
		Q<= Q + 1;
end

//------------------------------------
module Dflipflop (D, Clk, Resetn,Q);
input D, Clk, Resetn;

output reg Q;

always@(posedge Clk or negedge Resetn)
begin
	if (!Resetn)
		Q <=0;
	else
		Q <= D;
end

endmodule

//==----------------------------------------
module asyncounterD(D, Clk, Resetn, Q);

input D, Clk, Resetn;

output [3:0]Q;
xor(D1, Q[1],Q[0]);
and(D2,Q[2],D1);
and())



Dflipflop stage0 (D, Clk, Resetn, Q[0]);
Dflipflop stage1 (~Q[0], Clk, Resetn, Q[1]);
Dflipflop stage2 (D, Clk, Resetn, Q[2]);
Dflipflop stage3 (D, Clk, Resetn, Q[3]);











