`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:29:41 12/04/2018 
// Design Name: 
// Module Name:    PIPELINE_E 
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
module PIPELINE_E(
	input ifbgez,/*************/
	input [31:0] Instr_E,
	input [31:0] RTV_E,
	input [31:0] RSV_E,
	input [31:0] EXTOut_E,
	input [31:0] MUXRFWDOut,
	input [31:0] ALUOutput_M,
	input [1:0] ForwardRSE,
	input [1:0] ForwardRTE,
	input [31:0] PCPlus4_E,
	output [31:0] ALUOutput,
	output [4:0] WriteRd_E,//
	output [31:0] WriteData_E
	);
	
	wire MUXALUBSel;
	wire [1:0] RegDst;
	wire [3:0] ALUSel;
	wire [31:0] MUXALUBOut, MFRSEOut, MFRTEOut, ALUOutput_ALU;
	
	assign WriteData_E = MFRTEOut;//写入寄存器的数据是经过转发选择的
	
	ALU alu(								//ALU运算
	.ALUOprand_A(MFRSEOut),
	.ALUOprand_B(MUXALUBOut),
	.ALUSel(ALUSel),
	
	.ALUOutput(ALUOutput_ALU)
	);
	
	CONTROLLER_E controller_e(		//输出控制信号
	.Instr_E(Instr_E),
	.ifbgez(ifbgez),/******************/
	
	.MUXALUBSel(MUXALUBSel),
	.RegDst(RegDst),
	.ALUSel(ALUSel),					//最后一个端口多加了个逗号Port connections cannot be mixed ordered and named
	.ALUOutputSel(ALUOutputSel)	//主要用来处理普通的运算型指令和对31号寄存器进行操作的指令的输出的值的问题
	);
	
	MUX_2_1_32 MUXALUOutput( 		//选择E级部件的ALU输出结果，如果是jal等对31号寄存器进行写入PC+8的指令，将ALU输出置为PC+8
	.A(ALUOutput_ALU),
	.B(PCPlus4_E + 4),
	.Sel(ALUOutputSel),
	
	.C(ALUOutput)
	);
	
	MUX_4_1_5 MUXRDE(					//选择写入寄存器，处理JR JAL
	.A(Instr_E[20:16]),	
	.B(Instr_E[15:11]),
	.C(5'b11111),
	.D(5'b00000),
	.Sel(RegDst),
	
	.E(WriteRd_E)
	);
	
	MUX_2_1_32 MUXALUB(				//选择ALU的第二个操作数是寄存器数据还是立即数数据
	.A(MFRTEOut),
	.B(EXTOut_E),
	.Sel(MUXALUBSel),
	
	.C(MUXALUBOut)
	);
	
	MUX_4_1_32 MFRSE(					//选择ALU的第一个操作数
	.A(RSV_E),
	.B(MUXRFWDOut),
	.C(ALUOutput_M),
	.D(32'h00000000),
	.Sel(ForwardRSE),
	
	.E(MFRSEOut)
	);
			
	MUX_4_1_32 MFRTE(					//选择ALU的第二个操作数的寄存器数据
	.A(RTV_E),
	.B(MUXRFWDOut),
	.C(ALUOutput_M),
	.D(32'h00000000),
	.Sel(ForwardRTE),
	
	.E(MFRTEOut)
	);
endmodule
//////////////////////////////////////////////////////////////////////////////////
module ALU(
	input [31:0] ALUOprand_A,
	input [31:0] ALUOprand_B,
	input [3:0] ALUSel,
	output [31:0] ALUOutput
    );
	wire [31:0] addu_r, subu_r, ori_r;//不能填小写指令名
	
	assign addu_r = ALUOprand_A + ALUOprand_B;
	assign subu_r = ALUOprand_A - ALUOprand_B;
	assign ori_r =  ALUOprand_A | ALUOprand_B;

	assign ALUOutput = (ALUSel == 4'b0000)? addu_r :
							 (ALUSel == 4'b0001)? subu_r :
							 (ALUSel == 4'b0010)? ori_r  :
															0  ;
endmodule
