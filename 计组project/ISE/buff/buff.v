`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:15 10/09/2018 
// Design Name: 
// Module Name:    buff 
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
module buff(
		input clk,
		input in,
		output reg out=0
    );
	reg buff=0;
	always @ (posedge clk) begin 
		buff <= in;
		out <= buff;
	end

endmodule
