module hwy(Clock, Resetn, S,P,Z);
input Clock, Resetn, S,P;

output Z;

//y is the current state
//Y is the next state
reg [2:1]y,Y;

//A is green
//B is Yellow
//R is Red

parameter[2:1] A = 2'b00, B = 2'b01, C = 2'b10;

//efine the sequential block

always @ ( negedge Resetn, posedge Clock)
	if ( Resetn == 0) y <= A;
else
		case(y)
			A : if (!S & !P) y <= A;
				 
				 else y <= B;
			B : 		y <= C;
		//must have a timer
			C : 		y <= A;