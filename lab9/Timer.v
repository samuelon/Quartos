module Timer(T,Resetn,Clock,Q);
input Resetn,Clock;
input [31:0]T;

output reg Q;

always @ (negedge Resetn, posedge Clock)
if (!Resetn )
	Q<=0;
else 
	Q<= Q - 1;

//down counter for n amount of values

endmodule