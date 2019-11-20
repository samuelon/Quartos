module pedestrian(D, Clock, Q);
input D, Clock;

Output Q;

// turn on the led or off
always@ ( posedge Clock)
	if (D)
	Q = D;
	else 
	Q = 0;
endmodule
