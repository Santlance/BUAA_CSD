`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:15 10/08/2018 
// Design Name: 
// Module Name:    ts 
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
module ts(
		input [9:0] addr,
		output [31:0] instr
    );
	 
	 reg[31:0] Memory[2047:0];
	 assign instr=Memory[0];
	 
	 initial begin
		$readmemh("code.txt",Memory,3,0);
	 end
		

endmodule
