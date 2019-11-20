module RTLcount4bit(D,Clock, Q);
input D,Clock;
output reg [0:3]Q;

always@(posedge Clock)
begin
	Q[1]<=D;
	Q[2]<=Q[1];
	Q[3]<=Q[2];
	Q[4]<=Q[3];
end

endmodule
