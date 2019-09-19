`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:06 10/07/2018 
// Design Name: 
// Module Name:    signed_num 
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
module signed_num(
	input clk,
	input reset,
	input [3:0] a,
	input [3:0] b,
	output res
    );
	assign res=$signed(a)>$signed(b);

endmodule
