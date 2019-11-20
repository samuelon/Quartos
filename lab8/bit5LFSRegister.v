module bit5LFSRegister(D,Preset, Clock,Q);
input D,Clock, Preset;
output [0:4]Q;

flipflopp Q1 (D,Preset,Clock,Q[0]);

flipflopp Q2 (Q[0],Preset,Clock,Q[1]);

flipflopp Q3 (Q[1],Preset,Clock,Q[2]);

flipflopp Q4 (Q[2],Preset,Clock,Q[3]);

flipflopp Q5 (Q[3],Preset,Clock,Q[4]);

endmodule
