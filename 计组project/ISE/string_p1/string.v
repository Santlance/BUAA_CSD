`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:52:46 10/28/2018 
// Design Name: 
// Module Name:    string 
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
module string(
		input clk,
		input clr,
		input [7:0] in,
		output reg out = 0
    );
		integer state = 0;
		parameter null=0,
					 isdigit=1,
					 ischar=2,
					 illegal=3;
					 
		always @ (posedge clk or posedge clr)begin
			if(clr)begin
				state <= null;
				out <= 0;
			end
			
			else begin
				case(state)
				null: 
					begin
						if(in<=57 && 48<=in)begin
							state <= isdigit;
							out <= 1;
						end
						
						else begin
							state <= illegal;
							out <= 0;
						end
					end
				
				isdigit:
					begin
						if(in==43 || in==42)begin
							state <= ischar;
							out <= 0;
						end
						
						else begin
							state <= illegal;
							out <= 0;
						end
					end
					
				ischar:
					begin
						if(in<=57 && 48<=in)begin
							state <= isdigit;
							out <= 1;
						end
						
						else begin
							state <= illegal;
							out <= 0;
						end
					end
					
				illegal:
					begin
						state <= illegal;
						out <= 0;
					end
					
				default: state <= null;
				
				endcase
			end
		end

endmodule
