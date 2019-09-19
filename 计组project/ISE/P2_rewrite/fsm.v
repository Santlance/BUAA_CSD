`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:02:06 11/08/2018 
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
module fsm(
	input clk,clr,
	input [7:0] in,
	output reg out = 0
    );
	 parameter null = 1,num = 2,op = 3,ill = 4;
	 integer state = null;
	 always@(posedge clk or posedge clr)
	 begin
		if(clr)
		begin
			out <= 0;
			state <= null;
		end
		else
		begin
		case (state)
			null:
			begin
				if("0" <= in && in <= "9")
				begin
					state <= num;
					out <= 1;
				end
				else
				begin
					state <= ill;
					out <= 0;
				end
			end
			num:
			begin
				if(in == "*" || in == "+")
				begin
					state <= op;
					out <= 0;
				end
				else
				begin
					state <= ill;
					out <= 0;
				end
			end
			op:
			begin
				if("0" <= in && in <= "9")
				begin
					state <= num;
					out <= 1;
				end
				else
				begin
					state <= ill;
					out <= 0;
				end
			end
			ill: //进入这个态就意味着clr ！= 0了
			begin
				if(clr)
				begin
					state <= null; //多余了
					out <= 0;
				end
				else
					state <= ill;
					out <= 0;
				begin
				end
			end
			default:
			begin
				state <= null;
				out <= 0;
			end
		endcase
		end
	 end


endmodule
