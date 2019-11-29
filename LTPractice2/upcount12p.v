module upcount12p(Clk,Resetn,Q,Qn);
input Clk,Resetn;
output reg [3:0]Q;
output [3:0]Qn;
integer k;

always @ ( posedge Clk)
begin
	if(!Resetn)
		Q<=1'b0;
	else
			Q<= Q + 1;
end
assign Qn = ~Q;

endmodule