module shiftnbitp(L,R,Clk,In,Q);
parameter n = 4;
input [n-1:0]R;
input Clk,L,In;
output reg [n-1:0]Q;
integer k;
//right to left
always@(posedge Clk)
begin
	if (L) begin
		Q <= R;
	end else begin
		Q[n-1]<= In;
		for ( k = n-2 ; k >= 0 ; k = k - 1) begin
			Q[k] <= Q[k+1];
		end
	end
end
endmodule


//left ot right
/*always@(posedge Clk)
begin
	if (L) begin
		Q <= R;
		
	end else begin
		for (k = 0; k < n -1 ; k = k + 1) begin
		Q[k] <= Q[k+1];
		end
	end
		Q[n-1] = In;
end

endmodule
*/		