module tflipflop(T,Clock,Q);
input T, Clock;
output reg Q;

always@(posedge Clock)
begin
	if(T)
		Q = ~Q;
end

endmodule