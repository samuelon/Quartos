module upcountTFF(T,Clock,Q);
input T, Clock;
output [0:3]Q;
//4 bit counter
TFlipFlop Q0(T, Clock, Q[0]);
TFlipFlop Q1(T, ~Q[0], Q[1]);
TFlipFlop Q2(T, ~Q[1], Q[2]);
TFlipFlop Q3(T, ~Q[2], Q[3]);

endmodule