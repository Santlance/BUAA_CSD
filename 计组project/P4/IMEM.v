`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:43 12/03/2014 
// Design Name: 
// Module Name:    IMEM 
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
module IMEM(clk,addr,instr);	
		input clk;
		input [10:0] addr;
		output reg [31:0] instr;
		reg [31:0] iram [2048:0];
		
		always @ (addr)
				instr = iram[addr];
		
//		IP_CORE_IMEM ip_core_imem(
//				.clka(clk),
//				.addra(addr),
//				.douta(instr)
//				);
				
endmodule
