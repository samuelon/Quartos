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
wire t_sec, t_yellow;
 
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
			LEDR[10] = 1'b1; // red light sec
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b1; // red light ped
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
			LEDR[10] = 1'b1; //redlight sec
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b1; //red ligth ped
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
			LEDR[10] = 1'b1; //red light sec
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b1; //red light ped
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
			LEDG[4] = 1'b1; //Green light Sec_G
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; // redlight hwy 
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b0;
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b1; //red light ped
			//if there is an extra car, then prolong the time
			//else per norm
		if (C_detected == 1'b1 )
			if (t_sec == 1'b1 )
				Y = sec_Y;
		else if ( t _yellow == 1)
			Y = sec_Y;
	
	sec_Y:LEDG[6] = 1'b0;
			LEDG[4] = 1'b0;
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; //red light hwy
			LEDR[12] = 1'b1; // Yellow light Sec_Y
			LEDR[10] = 1'b0;
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b1; //redlight ped
			if ( t_yellow)
			Y = sec_R;
			else
			Y = sec_Y;
	sec_R:LEDG[6] = 1'b0;
			LEDG[4] = 1'b0; 
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; //red light hwy
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b1; // Red Light sec_R
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b1; //red light ped
			//create case for if the line up was ped next
			//if ... go to ped_G else
			Y = hwy_G;
	ped_G:LEDG[6] = 1'b0;
			LEDG[4] = 1'b0; 
			LEDG[2] = 1'b1; // Green Light ped_G
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; //red light hwy
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b1; //red light sec
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b0;
			if (t_sec == 1) // green max time
			Y = ped_Y;
			else
			Y = ped_G;
	ped_Y:LEDG[6] = 1'b0;
			LEDG[4] = 1'b0;
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; //red light hwy
			LEDR[12] = 1'b0; 
			LEDR[10] = 1'b1; //red light sec
			LEDR[8] = 1'b1; // Yellow light ped_Y
			LEDR[6] = 1'b0;
			if ( t_yellow == 1)
			Y = ped_R;
			else
			Y = ped_Y;
	ped_R:LEDG[6] = 1'b0;
			LEDG[4] = 1'b0;
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; // red light hwy 
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b1; // red light sec
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b1; // Red light ped_R
			//make case for if sec is pushed etc.
			Y = hwy_G;
	endcase
//Define the sequential block
always@(negedge Resetn, posedge Clock)
	if ( Resetn == 0)  y <=hwy_G;
	else y <= Y;
	
//Define pedestrian and Secondary operator
always@(negedge Resetn, posedge Clock)
	if (Resetn == 0)
	begin
		P <= 0;
		C <= 0;
	end
	
	

endmodule

			
			
			
			
			