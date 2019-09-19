`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:26 12/07/2018 
// Design Name: 
// Module Name:    PIPELINE_W 
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
module PIPELINE_W(
	input [31:0] Instr_W,
	input [31:0] ReadData_W,
	input [31:0] ALUOutput_W,
	input [31:0] PCPlus4_W,//处理JAL，写入PC+8
	output [31:0] MUXRFWDOut
    );
	 wire [1:0] MemtoReg_W;
	CONTROLLER_W controller_w(
	.Instr_W(Instr_W),
	
	.MemtoReg_W(MemtoReg_W)
	);
	MUX_4_1_32 MUXRFWD(
	.A(ALUOutput_W),
	.B(ReadData_W),
	.C(PCPlus4_W + 4),//JAL是写PC+8
	.D(32'h00000000),
	.Sel(MemtoReg_W),
	
	.E(MUXRFWDOut)
	);
endmodule
