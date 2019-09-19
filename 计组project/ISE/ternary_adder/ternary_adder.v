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
module ternary_adder(
	input a1, a0, b1, b0,low,
	output s1, s0, Carry
    );
	 assign Carry = (!a1&&a0&&b1&&!b0&&!low)||(a1&&!a0&&!b1&&b0&&!low)||(a1&&!a0&&b1&&!b0&&!low)||
	 (!a1&&!a0&&b1&&!b0&&low)||(!a1&&a0&&!b1&&b0&&low)||(!a1&&a0&&b1&&!b0&&low)||(a1&&!a0&&!b1&&!b0&&low)||
	 (a1&&!a0&&!b1&&b0&&low)||(a1&&!a0&&b1&&!b0&&low);
	 assign s0 = (!a1&&!a0&&!b1&&b0&&!low)||(!a1&&a0&&!b1&&!b0&&!low)||(a1&&!a0&&b1&&!b0&&!low)||
	 (!a1&&!a0&&!b1&&!b0&&low)||(!a1&&a0&&b1&&!b0&&low)||(a1&&!a0&&!b1&&b0&&low);
	 assign s1 = (!a1&&!a0&&b1&&!b0&&!low)||(!a1&&a0&&!b1&&b0&&!low)||(a1&&!a0&&!b1&&!b0&&!low)||
	 (!a1&&!a0&&!b1&&b0&&low)||(!a1&&a0&&!b1&&!b0&&low)||(a1&&!a0&&b1&&!b0&&low);
endmodule
