module MasterSlaveDFF(D, Clock, Q);
input D, Clock;
output Q;

wire Qm,Qs;

GatedDlatch master (D, Clock, Qm);
GatedDlatch Slave ( Qm,~Clock, Qs);

assign Q = Qs;

endmodule