module TFF_resetn(T,Resetn,Clk,Q);
input T, Clk,Resetn;
output reg Q;



always@(negedge Resetn, posedge Clk)
begin
	if (!Resetn)
		Q<=0;
		
	else if ( T)
		Q<=~Q;
end

endmodule