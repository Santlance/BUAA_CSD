`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:28 10/21/2018 
// Design Name: 
// Module Name:    ternary_half_adder 
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
module ternary_half_adder(
	input a1,
	input a0,
	input b1,
	input b0,
	output s1,
	output s0,
	output Carry
    );
	 assign Carry = (!a1&&a0&&b1&&!b0)||(a1&&!a0&&!b1&&b0)||(a1&&!a0&&b1&&!b0);
	 assign s0 = (!a1&&!a0&&!b1&&b0)||(!a1&&a0&&!b1&&!b0)||(a1&&!a0&&b1&&!b0);
	 assign s1 = (!a1&&!a0&&b1&&!b0)||(!a1&&a0&&!b1&&b0)||(a1&&!a0&&!b1&&!b0);
endmodule
