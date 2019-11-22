module Timer(Rstn,Clk, stChgd, t_yellow,t_sec);

output wire t_yellow, t_sec;
input stChgd, Rstn,Clk;

reg [29:0] Q;

always @ (negedge Rstn, posedge Clk)
begin
	if (!Rstn )					//aclr
		Q <= 30'b0;
	else if (stChgd == 1'b1)
		Q <= 30'b0;
	else if ( Q < 30'h3FFFFFFF)
		Q <= Q + 1'b1;
	else
		Q<=Q;
end
		//up counter for n amount of values
//assign t_yellow = Q[2];	for QSIM sims only
//assign t_sec = Q[3];

assign t_yellow = Q[28];
assign t_sec = Q[29];

endmodule