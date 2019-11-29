module JKFlipFlop(J, K, Clk, Q);

input J, K, Clk;
//J acts as a set(Data)
//K acts like a Resetn
output reg Q;

always @(posedge Clk)
begin
	if (J == 1'b1 && K == 1'b0)
		Q <= 1'b1;
	else if (J == 1'b0 && K == 1'b1)
		Q <= 1'b0;
	else if (J == 1'b1 && K == 1'b1)
		Q <= ~Q;
	else 
	// J == K == 0
		Q <= Q;
end 

endmodule