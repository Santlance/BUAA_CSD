`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:55 10/07/2018 
// Design Name: 
// Module Name:    wrong_message 
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
module wrong_message(
	input clk,
	input a,
	input b,
	output reg c
    );
	
	 
	 always @(posedge clk)begin
		c=a&b;
	 end
	

endmodule
