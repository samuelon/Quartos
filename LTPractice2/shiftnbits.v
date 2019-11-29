module shiftnbits(L,R,w,Clk,Q);
parameter n = 16;
input [n-1:0]R;
input L,w, Clk;
output reg [n-1:0] Q;
integer k;

always@(posedge Clk)
begin
	if (L)
		Q <= R;
	else begin
		for (k = 0; k < n-1;k = k+1) begin
			Q[k] <= Q[k+1];
			Q[n-1] <= w;
		end
	end
end 

endmodule



// left 1 means shift to the left
// right 1 means shift to the left
///5.13 Write Verilog code for a universal shift register with n bits.