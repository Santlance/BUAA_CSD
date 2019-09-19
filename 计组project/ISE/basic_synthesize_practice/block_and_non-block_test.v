`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:28 10/09/2018 
// Design Name: 
// Module Name:    block_and_non-block_test 
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
module block_and_nonblock_test(
		input clk,
		input in,
		output reg out=0
    );
	 reg buff=0;
	 always @ (posedge clk)begin
		buff<=in;
		out<=buff;
	 end

endmodule
