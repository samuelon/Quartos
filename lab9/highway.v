module highway(Resetn,Clock,CarSec,CarPres,PedReq);

input Clock, Resetn;
input CarPres,PedReq,CarSec;

//currSt present state
//nextSt next state
reg[3:0]currSt,nextSt;

reg pedStr, carStr; 

reg [16:0]LEDR;
reg [6:0]LEDG;

reg carPednSrvd;  				// 1 car serviced. 0 ped is serviced. 

wire stateChg; 

wire tSec, tYel;

parameter[3:0] hwy_G = 4'b0001, hwy_Y = 4'b0010, hwy_R = 4'b0011;
parameter[3:0] sec_G = 4'b0100, sec_Y = 4'b0101, sec_R = 4'b0110;
parameter[3:0] ped_G = 4'b0111, ped_Y = 4'b1000, ped_R = 4'b1001;
//state for each road
//Define the next state combinational circuit

Timer my_timer (Resetn, Clock, stateChg, tYel, tSec);

assign stateChg = currSt ^ nextSt; 

initial begin
carPednSrvd = 1'b0; 
end

always@(*)
begin
	case(currSt)
	hwy_G:begin
			LEDG[6] = 1'b1; // green light hwy
			LEDG[4] = 1'b0;
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b0;
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b1; // red light sec
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b1;	// red light ped
			
		if(tSec == 1'b1 && ( pedStr == 1'b1 || carStr == 1'b1)) 
				nextSt = hwy_Y;
		else //p_present || s_present == 1'b1);
				nextSt = hwy_G;
	end
	hwy_Y:begin
			LEDG[6] = 1'b0;
			LEDG[4] = 1'b0;
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b1; // yellow light hwy
			LEDR[14] = 1'b0;
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b1; //redlight sec
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b1; //red ligth ped
		if (tYel == 1'b1) begin
				//nextSt = hwy_R;
				if (pedStr == 1'b1 && carStr == 1'b0) begin
					nextSt = ped_G;
				end else if (pedStr == 1'b0 && carStr == 1'b1) begin
					nextSt = sec_G; 
				end else if (carPednSrvd == 1 ) begin
					nextSt = sec_G;
					carPednSrvd = 0;
				end else if (carPednSrvd == 0) begin
					nextSt = ped_G;	
					carPednSrvd = 1;
				end else begin 
					nextSt = hwy_Y;
				end
		end
	end 
	sec_G:begin
			LEDG[6] = 1'b0;
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
		if (CarSec == 1'b1 && tYel == 1'b1)
			if (tSec == 1'b1 )
				nextSt = sec_Y;
			else // maybe not right must make sure with board
				nextSt = sec_Y;
		else if ( CarSec == 1'b0 && tYel == 1'b0)
			nextSt = sec_Y;
	end		
	sec_Y:begin
			LEDG[6] = 1'b0;
			LEDG[4] = 1'b0;
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; //red light hwy
			LEDR[12] = 1'b1; // Yellow light Sec_Y
			LEDR[10] = 1'b0;
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b1; //redlight ped
			if ( tYel == 1'b1)
			nextSt = hwy_G;
			else
			nextSt = sec_Y;
	end		
//	sec_R:begin
//			LEDG[6] = 1'b0;
//			LEDG[4] = 1'b0; 
//			LEDG[2] = 1'b0;
//			LEDR[16] = 1'b0;
//			LEDR[14] = 1'b1; //red light hwy
//			LEDR[12] = 1'b0;
//			LEDR[10] = 1'b1; // Red Light sec_R
//			LEDR[8] = 1'b0;
//			LEDR[6] = 1'b1; //red light ped
//			//create case for if the line up was ped next
//			//if ... go to ped_G else
//			nextSt = hwy_G;
//	end
	ped_G:begin
			LEDG[6] = 1'b0;
			LEDG[4] = 1'b0; 
			LEDG[2] = 1'b1; // Green Light ped_G
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; //red light hwy
			LEDR[12] = 1'b0;
			LEDR[10] = 1'b1; //red light sec
			LEDR[8] = 1'b0;
			LEDR[6] = 1'b0;
			if (tSec == 1'b1) begin// green max time
				nextSt = ped_Y;
			end else begin
				nextSt = ped_G;
			end
	end
	ped_Y:begin
			LEDG[6] = 1'b0;
			LEDG[4] = 1'b0;
			LEDG[2] = 1'b0;
			LEDR[16] = 1'b0;
			LEDR[14] = 1'b1; //red light hwy
			LEDR[12] = 1'b0; 
			LEDR[10] = 1'b1; //red light sec
			LEDR[8] = 1'b1; // Yellow light ped_Y
			LEDR[6] = 1'b0;
			if ( tYel == 1)
			nextSt = hwy_G;
			else
			nextSt = ped_Y;
	end
//	ped_R:begin
//			LEDG[6] = 1'b0;
//			LEDG[4] = 1'b0;
//			LEDG[2] = 1'b0;
//			LEDR[16] = 1'b0;
//			LEDR[14] = 1'b1; // red light hwy 
//			LEDR[12] = 1'b0;
//			LEDR[10] = 1'b1; // red light sec
//			LEDR[8] = 1'b0;
//			LEDR[6] = 1'b1; // Red light ped_R
//			//make case for if sec is pushed etc.
//			nextSt = hwy_G;
//	end
	endcase
end
//Define the sequential block
always@(negedge Resetn, posedge Clock)
begin
	if ( Resetn == 0)  currSt <=hwy_G;
	else currSt <= nextSt;
end
//Define pedestrian and Secondary operator
always@(negedge Resetn, posedge Clock)
begin
	if (Resetn == 0)
	begin
		pedStr <= 1'b0;
		carStr <= 1'b0;
	end else begin
	 pedStr <= ~PedReq;
	 carStr <= CarPres;
	end 
	 
end
	

endmodule

			
			
			
			
			