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
	
	assign WriteData_E = MFRTEOut;//д��Ĵ����������Ǿ���ת��ѡ���
	
	ALU alu(								//ALU����
	.ALUOprand_A(MFRSEOut),
	.ALUOprand_B(MUXALUBOut),
	.ALUSel(ALUSel),
	
	.ALUOutput(ALUOutput_ALU)
	);
	
	CONTROLLER_E controller_e(		//��������ź�
	.Instr_E(Instr_E),
	.ifbgez(ifbgez),/******************/
	
	.MUXALUBSel(MUXALUBSel),
	.RegDst(RegDst),
	.ALUSel(ALUSel),					//���һ���˿ڶ���˸�����Port connections cannot be mixed ordered and named
	.ALUOutputSel(ALUOutputSel)	//��Ҫ����������ͨ��������ָ��Ͷ�31�żĴ������в�����ָ��������ֵ������
	);
	
	MUX_2_1_32 MUXALUOutput( 		//ѡ��E��������ALU�������������jal�ȶ�31�żĴ�������д��PC+8��ָ���ALU�����ΪPC+8
	.A(ALUOutput_ALU),
	.B(PCPlus4_E + 4),
	.Sel(ALUOutputSel),
	
	.C(ALUOutput)
	);
	
	MUX_4_1_5 MUXRDE(					//ѡ��д��Ĵ���������JR JAL
	.A(Instr_E[20:16]),	
	.B(Instr_E[15:11]),
	.C(5'b11111),
	.D(5'b00000),
	.Sel(RegDst),
	
	.E(WriteRd_E)
	);
	
	MUX_2_1_32 MUXALUB(				//ѡ��ALU�ĵڶ����������ǼĴ������ݻ�������������
	.A(MFRTEOut),
	.B(EXTOut_E),
	.Sel(MUXALUBSel),
	
	.C(MUXALUBOut)
	);
	
	MUX_4_1_32 MFRSE(					//ѡ��ALU�ĵ�һ��������
	.A(RSV_E),
	.B(MUXRFWDOut),
	.C(ALUOutput_M),
	.D(32'h00000000),
	.Sel(ForwardRSE),
	
	.E(MFRSEOut)
	);
			
	MUX_4_1_32 MFRTE(					//ѡ��ALU�ĵڶ����������ļĴ�������
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
	wire [31:0] addu_r, subu_r, ori_r;//������Сдָ����
	
	assign addu_r = ALUOprand_A + ALUOprand_B;
	assign subu_r = ALUOprand_A - ALUOprand_B;
	assign ori_r =  ALUOprand_A | ALUOprand_B;

	assign ALUOutput = (ALUSel == 4'b0000)? addu_r :
							 (ALUSel == 4'b0001)? subu_r :
							 (ALUSel == 4'b0010)? ori_r  :
															0  ;
endmodule
