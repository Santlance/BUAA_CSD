`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:48:47 11/25/2018 
// Design Name: 
// Module Name:    CONTROLLER 
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
module CONTROLLER(
	 input [5:0] opcode,// 6
	 input [5:0] func,// 6
	 
	 output jr,// 1
	 output jal,// 1
	 output jump,// 1
	 output regdst,// 1
	 output npc_sel,// 1
	 output [1:0] extop,// 2
	 output memtoreg,// 1
	 output [3:0] aluctr,// 4
	 output memwrite,// 1
	 output alusrc,// 1
	 output regwrite// 1
    );


endmodule
