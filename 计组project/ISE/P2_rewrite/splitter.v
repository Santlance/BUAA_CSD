`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:48:56 11/07/2018 
// Design Name: 
// Module Name:    splitter 
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
module splitter(
		input [31:0] A,
		output [7:0] O1,O2,O3,O4
    );
	assign O1[7:0] = A[31:24];
	assign O2[7:0] = A[23:16];
	assign O3[7:0] = A[15:8];
	assign O4[7:0] = A[7:0];
endmodule
