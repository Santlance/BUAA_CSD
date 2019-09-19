`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:00:05 10/29/2014 
// Design Name: 
// Module Name:    register 
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
module register(q,wdata,clk,rst,ena
    );

		output [31:0] q;
		input [31:0] wdata;
		input clk,rst,ena;
		reg [31:0] q;
		
		always @ (negedge clk or posedge rst)
		begin
				if (rst == 1)
				begin
						q = 0;
				end
				else
				begin
						if (ena == 1)
								q = wdata;
						else
								q = q;
				end
		end
		
endmodule
