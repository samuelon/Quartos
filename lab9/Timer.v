module Timer(Resetn,Clock,t_yellow,t_sec);
output reg t_yellow, t_sec;
input Resetn,Clock,State;
output reg [29:0]Q;

always @ (negedge Resetn, posedge Clock)
begin
	if (!Resetn )
		Q <= 29'b0;
//	else if (state == 1)
//		Q <= 29'b0;
	else if ( Q <= 29'H1FFFFFFF)
		Q <= Q + 1'b1;
	else
		Q<=Q;
end
		//up counter for n amount of values
assign t_yellow = Q[2];
assign t_sec = Q[3];

endmodule