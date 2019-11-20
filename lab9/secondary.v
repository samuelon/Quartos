module secondary(D, T, Clock, Resetn,Z);
input Clock, Resetn;
input [31:0]T;
//where D[0] repesents 1 car and D[1] repesents more than one car
input [0:1]D;
output [0:1]Z;

assign t_secondary = T;
assign t_secondary = 2*T;

//y is the current state
reg [2:1]y;

//A is green
//B is Yellow
//C is Red

parameter[2:1] A = 2'b00, B = 2'b01, C = 2'b10;

//efine the sequential block

always @ ( negedge Resetn, posedge Clock)
	if ( Resetn == 0) y <= A;
else
		case(y)
			//when D = 0 do nothing
			C : if (!D[0]) 	y <= C;				 
				 
				 else if (D[1])
				//timer for max amount of green time called t_secondary
						y < = A;
				//timer for min amount of time, t_yellow
				 else	 y <= A;
			// input Timer(4/2,Resetn, Clock, Q) once it finishes then change to C	 
			B : 		y <= C;
			
			A : 		y <= A;
			
			default: y <= 2'bxx;
		endcase