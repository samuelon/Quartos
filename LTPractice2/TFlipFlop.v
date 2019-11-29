module TFlipflop(T, Clk, Resetn, Q);

input T, Clk, Resetn;

output reg Q;

always@(posedge Clk or negedge Resetn)
begin
	if (!Resetn) begin
		Q <= 0;
	end else if (T) begin
		Q <= ~Q;
	end 

end

endmodule
		