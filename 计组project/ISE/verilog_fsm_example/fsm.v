`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:50 10/26/2018 
// Design Name: 
// Module Name:    fsm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fsm(Clock,Reset,A,K2,K1,state);
	input Clock,Reset,A;
	output K2,K1;
	output [1:0] state;
	reg K1,K2;
	reg [1:0] state;
	
	parameter Idle = 2'b00, //idle œ–÷√
				 Start = 2'b01,
				 Stop = 2'b10,
				 Clear = 2'b11;
	always @ (posedge Clock)begin 
		if(!Reset)begin
			state <= Idle;
			K2 <=0;
			K1 <=0;
		end
		else 
			case(state)
			Idle: if(A) begin
					state <= Start;
					K1 <=0;
				end
					else begin
					state <= Idle;
						K2 <=0;
						K1 <=0;
					end
			Start: if(!A) state <= Stop;
					 else state <= Start;
			Stop: if(A) begin
						state <= Clear;
						K2 <=1;
					end
					else begin
						state <= Stop;
						K2 <= 0;
						K1 <= 0;
					end
			Clear: if(!A) begin
						state <= Idle;
						K2 <= 0;
						K1 <= 1;
						end
					 else begin
						state <= Clear;
						K2 <= 0;
						K1 <= 1;
					 end
			default: state <= 2'bxx;
			endcase
	end

endmodule
