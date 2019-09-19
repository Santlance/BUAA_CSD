`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:20:47 11/25/2018 
// Design Name: 
// Module Name:    IM 
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
module IM(
	input [31:0] imaddr,// 32
	output [31:0] instr// 32
    );
	 
	 reg [31:0] Instr[0:1023];
	 
	 assign instr = Instr[imaddr[11:2]];
	 
	 initial
	 begin
		$readmemh("code.txt",Instr);
	 end

endmodule
