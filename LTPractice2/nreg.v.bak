module nreg(D,Clk,Resetn,Q);
parameter n = 16;

input Clk, Resetn;
input [n-1: 0]D;

output reg [n-1:0]Q;

always@(negedge Resetn or posedge Clk)
begin
	if ( !Resetn) begin
		Q <= 0;
		
	end else begin
		Q <= D;
	end
end

endmodule