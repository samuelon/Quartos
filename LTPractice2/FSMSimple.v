module FSMSimple(w,Resetn,Clk,z);

input w,Clk,Resetn;
output reg z;
reg [1:0]currSt;
reg [1:0]nextSt;
parameter [1:0] A = 2'b01, B = 2'b10 , C = 2'b11;

initial 
begin
	currSt = A;
end 

always @ (*)
begin
	case(currSt)
		A:
		begin
			z = 1'b0;
			
			if (w) begin
			nextSt = B ;
			
			end else begin 
				nextSt = A; 
			end	
		end
		B:
		begin
			z = 1'b0;
			
			if (w) begin
				nextSt = C;
			end else begin
				nextSt = B;
			end
		end
		C:
		begin
			z = 1'b1;
			
			if(w) begin
				nextSt = C;
			end else begin
				nextSt = A;
			end
		end
	endcase
end

always@(posedge Clk or negedge Resetn)
begin
	if (!Resetn) begin
		currSt <= A;
	end else begin
		currSt <= nextSt;
	end
end

endmodule
	
		