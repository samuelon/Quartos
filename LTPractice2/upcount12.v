module upcount12(D,Clk,Resetn,Q);
//5.20
//5.20 Write Verilog code that represents a modulo-12 up-counter with synchronous reset.
input D,Clk,Resetn;
output reg [11:0]Q;

always @(posedge Clk)
begin
	if (!Resetn) begin
		Q<= 0;
	end else begin 
		Q <= Q + 1;
	end
end

endmodule