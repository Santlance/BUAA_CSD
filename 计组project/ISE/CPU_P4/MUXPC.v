`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:12 11/25/2018 
// Design Name: 
// Module Name:    MUXPC 
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
module MUXPC(
	input jr,// 1
	input jump,// 1
	input [31:0] ra_addr,// 32
	input [31:0] jump_index,// 32
	input branch,// 1
	input [31:0] pc_and_4,// 32
	input [31:0] pc_and_4_shamft,// 32
	
	output [31:0] pcout// 32
    );
	 
	 assign pcout = jr? ra_addr:(jump? jump_index:(branch? pc_and_4_shamft: pc_and_4));
	 
endmodule

