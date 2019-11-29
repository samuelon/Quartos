module countupdown(Clk,upDown,Resetn,Q);
parameter n = 4;
input Clk,upDown,Resetn;
output reg [n-1:0]Q;

always@(posedge Clk)
begin	
	if (!Resetn)
		Q <= 1'b0;
	else
		Q <= Q + (upDown ? 1 : -1); // 1 is positive 0 is negative
end

endmodule		