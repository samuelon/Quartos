module highway(Resetn,Clock,S,P,Z);
input Clock, Reset, w;
output reg [2:0]z;
//y is the present state
//Y is the next state

input S,P
reg[2:1]y,Y;
reg [16:0]LEDR;
reg [6:0]LEDG;
assign z[0]

 

parameter[3:0] hwy_G = 2'b0001, hwy_Y = 2'b0010, hwy_R = 2'b0011;
parameter[3:0] sec_G = 2'b0100, sec_Y = 2'b0101, sec_R = 2'b0110;
parameter[3:0] ped_G = 2'b0111, ped_Y = 2'b1000, ped_R = 2'b1001;
//state for each road
//Define the next state combinational circuit

always@(*)
begin
	case(y)
	hwy_G:LEDG[6] = 1'b1; // green light hwy
			LEDG[4] = 1'b0;
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b0;
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b0;
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b0;
		if(t_sec == 1'b1 || P == 1'b1 || S == 1'b1)
				Y = hwy_Y;
		else //p_present || s_present == 1'b1);
				Y = hwy_G;
	hwy_Y:LEDG[6] = 1'b0;
			LEDG[4] = 1'b0;
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b1; // yellow light hwy
			LEDR[14] = 1'b0;
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b0;
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b0;
		if (t_yellow == 1'b1)
				Y = hwy_R;
		else 
				Y = hwy_Y;
	hwy_R:LEDG[6] = 1'b0;
			LEDG[4] = 1'b0;
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; // red light hwy
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b0;
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b0;
		if ( S == 1'b0 && P == 1'b1)
			begin
			tflipflop check(S,Clock,Q);
			if (Q)
			Y = sec_G;
			else
			Y = ped_G;
			end
		else if (S)
			Y = sec_G;
		else if (P)
			Y = ped_G;
	sec_G:LEDG[6] = 1'b0;
			LEDG[4] = 1'b0; //Green light Sec_G
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; 
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b0;
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b0;
			//if there is an extra car, then prolong the time
			//else per norm
		if ( )
			
			
			
			
			
			
			