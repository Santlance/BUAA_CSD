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
	 wire [2:0] LoadSel;
	 wire [31:0] ReadData;
	CONTROLLER_W controller_w(
	.Instr_W(Instr_W),
	
	.LoadSel(LoadSel),
	.MemtoReg_W(MemtoReg_W)
	);
	
	LoadBE loadbe(
	.ReadData_W(ReadData_W),
	.BSel(ALUOutput_W[1:0]),
	.LoadSel(LoadSel),
	
	.ReadData(ReadData)
	);
	
	MUX_4_1_32 MUXRFWD(
	.A(ALUOutput_W),
	.B(ReadData),
	.C(PCPlus4_W + 4),//JAL是写PC+8
	.D(32'h00000000),
	.Sel(MemtoReg_W),
	
	.E(MUXRFWDOut)
	);
endmodule
//////////////////////////////////////////////////////////////////////////////////
module LoadBE(
	input [31:0] ReadData_W,
	input [1:0] BSel,
	input [2:0] LoadSel,
	output [31:0] ReadData
	); 
	//LoadSel
	//000 lw
	//001 lb
	//010 lbu
	//011 lh
	//100 lhu
	wire [31:0] lw_d, lb_d, lbu_d, lh_d, lhu_d;
	assign lw_d = ReadData_W;
	
	assign lb_d = (BSel == 2'b00)? {{24{ReadData_W[7]}},{ReadData_W[7:0]}}      :
					  (BSel == 2'b01)? {{24{ReadData_W[15]}},{ReadData_W[15:8]}}    :
					  (BSel == 2'b10)? {{24{ReadData_W[23]}},{ReadData_W[23:16]}}   :
					  (BSel == 2'b11)? {{24{ReadData_W[31]}},{ReadData_W[31:24]}}   :
																								0      ;
																								
	assign lbu_d = (BSel == 2'b00)? {{24{1'b0}},{ReadData_W[7:0]}}     :
					   (BSel == 2'b01)? {{24{1'b0}},{ReadData_W[15:8]}}    :
					   (BSel == 2'b10)? {{24{1'b0}},{ReadData_W[23:16]}}   :
					   (BSel == 2'b11)? {{24{1'b0}},{ReadData_W[31:24]}}   :
																					0      ;
															
	assign lh_d = (BSel[1] == 0)? {{16{ReadData_W[15]}},{ReadData_W[15:0]}} : {{16{ReadData_W[31]}},{ReadData_W[31:16]}};
	
	assign lhu_d = (BSel[1] == 0)? {{16{1'b0}},{ReadData_W[15:0]}} : {{16{1'b0}},{ReadData_W[31:16]}};
	
	assign ReadData = (LoadSel == 3'b000)? lw_d  :
							(LoadSel == 3'b001)? lb_d  :
							(LoadSel == 3'b010)? lbu_d :
							(LoadSel == 3'b011)? lh_d  :
							(LoadSel == 3'b100)? lhu_d :
														lw_d  ;
endmodule
