`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:05 10/08/2018 
// Design Name: 
// Module Name:    system_function_test 
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
module system_function_test(
		input [9:0] addr,
		output [31:0] instr
    );
	 
	 reg [31:0] Memory[2047:0];
	 
	 initial begin 
		$readmemh("code.txt",Memory,3,0);
	 end
	
	 assign instr=Memory[0];
		
endmodule
