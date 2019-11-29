module JKFlipFlop(J, K, Clk, Q);

input J, K, Clk;
//J acts as a set(Data)
//K acts like a Resetn
output reg Q;

always @(posedge Clk)
begin
	if (J)
		Q <= J;
	else if (K)
		Q <= 0;
	else if (J == 1'b1 && K == 1'b1)
		Q <= ~Q;
	else
		Q <= Q;
end 

endmodule