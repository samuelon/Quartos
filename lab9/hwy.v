module hwy(Clock, Resetn, Q,S,P,Z);
input Clock, Resetn, S,P;
//Z[0] is secondary
//Z[1] is pedestrian
output [0:1]Z;
output reg Q;

//y is the current state
//Y is the next state
reg [2:1]y;

//A is green
//B is Yellow
//R is Red

parameter[2:1] A = 2'b00, B = 2'b01, C = 2'b10;

//efine the sequential block

always @ ( negedge Resetn, posedge Clock)
	if ( Resetn == 0) y <= A;
else
		case(y)
			//when s=0 and p=0 do nothing
			A : if (!S & !P) 	y <= A;
			//and input Timer(4,Resetn,Clock,Q) once it finishes then change to A
				 else y <= B;
			// input Timer(4/2,Resetn, Clock, Q) once it finishes then change to C	 
			B : 		y <= C;
			
			C : 		y <= A;
			
			default: y <= 2'bxx;
		endcase
		
//create T flipflop use it to track who went last
//1 represents secondary went last
//0 represents pedestrian went last
//if 1 is last then pedestrian ywllow light runs therefore z[1] = 1 and you toggle the tflipflop to show that pedestrian went last
//if 0 is last then secondary will run therefoer z[0] = 1 and you toggle the tflipflop to show the secondary went last.

if ( Z[0] == 1 && Z[1] == 1)

tflipflop check (Z[1],Clock,Resetn,Q);
//flipflop is toggled therefore if it is 0 then run secondary if it is 1 run yellow 
//
if (Q)
	pedestrian LightOn (Q,Clock, Resetn,Q);
	//turn on LED with the Q value
	//use a counter to count down how long it's been
	pedestrian LightOff (~Q, clock, Reset, Q);
else 
	secondary LightOn ()
assign 