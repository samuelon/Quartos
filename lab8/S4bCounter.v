module S4bCounter(T, Clock, Q);
input T, Clock;
output [0:4]Q;

TFlipFlop Q0 ( T, Clock, Q[0]);

TFlipFlop Q1 ( Q[0], Clock, Q[1]);

and(Q0Q1, Q[0],Q[1] );
TFlipFlop Q2 ( Q0Q1, Clock, Q[2]);

and(Q0Q2, Q0Q1,Q[2] );
TFlipFlop Q3 ( Q0Q2, Clock, Q[3]);

and(Q0Q3, Q0Q2,Q[3] );
TFlipFlop Q4 ( Q0Q3, Clock, Q[4]);

endmodule
