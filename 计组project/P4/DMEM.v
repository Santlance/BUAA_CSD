`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:34 12/03/2014 
// Design Name: 
// Module Name:    DMEM 
// Project Name: 
// Target Devices: 
// Tool versions:// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DMEM(addr,data,clk,we,mem_out);
		input [31:0] addr;
		input [31:0] data;
		input clk;
		input we;
		output [31:0] mem_out;

		reg [31:0] drom [20000000:0];
		assign mem_out = drom[addr >> 2];
		always @ (negedge clk)
		begin
				if (we == 1)
						drom[addr >> 2] = data;
		end

			 
endmodule
