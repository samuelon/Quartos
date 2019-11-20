module TFlipFlop(T, Clock, Q);
input T, Clock;
output reg Q;

//always@(posedge Clock)
always@(posedge Clock)
	if (T)
		Q = ~Q;
		
endmodule