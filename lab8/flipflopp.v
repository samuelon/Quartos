module flipflopp (D,Preset, Clock, Q);
input D, Clock,Preset;
output reg Q;


//addition preset value
always@(negedge Preset, posedge Clock)
	if (!Preset)
		Q<= 1;
	else
	Q = D;

endmodule