module bit5LFSRegister(D,Clock,Q);
input D, Clock;
output [0:3]Q;

flipflop Q1 (D,Clock,Q[0]);

flipflop Q2 (Q[0],Clock,Q[1]);

flipflop Q3 (Q[1],Clock,Q[2]);

flipflop Q4 (Q[2],Clock,Q[3]);

endmodule
