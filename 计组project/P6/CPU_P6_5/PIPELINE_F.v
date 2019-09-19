`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:50 12/04/2018 
// Design Name: 
// Module Name:    PIPELINE_F 
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
module PIPELINE_F(
	input CLK,   									//����ʱ���ź�
	input Reset,									//���븴λ�ź�
	input Stall,									//������ͣ�ź�
	input PCSel,									//����PCѡ���ź�
	input [31:0] NPCOut,							//����PC���ܵ�ֵ
	//input [31:0] GRF_RD1,						//����NPC����
	output [31:0] Instr_F,						//���ָ��
	output [31:0] PCPlus4_F						//���PC+4
	);
	wire [31:0] PCOut, PCIn;
	
	IM im(
	.InstrAddr(PCOut),							//���ӵ�IFU��PCOut����Ϊָ���ַ
	
	.Instr_F(Instr_F)								//���ӵ�PIPELINE_F���������Ϊָ�����
	);
	
	IFU ifu(
	.PCIn(PCIn),									//PC�����룬���ӵ�MUXPC�����
	.CLK(CLK),										//ʱ���ź�
	.Reset(Reset),									//��λ�ź�
	.Stall(Stall),									//��ͣ�ź�
	
	.PCOut(PCOut),									//�����ǰPCֵ�����ӵ�IM�ĵ�ַ����
	.PCPlus4_F(PCPlus4_F)						//�����ǰPC+4�����ӵ�PIPELINE_F���������ΪPC+4���
	);
	
	MUX_2_1_32 muxpc(
	.A(PCPlus4_F),									//����PC+4
	.B(NPCOut),										//��������NPC�Ŀ��ܵ�ֵ
	.Sel(PCSel),									//PC��ѡ���ź�
	
	.C(PCIn)											//PC������
	);
	
	
endmodule
//////////////////////////////////////////////////////////////////////////////////
module IM(
	 input [31:0] InstrAddr,					//����ָ���ַ�ź�
	 output [31:0] Instr_F						//���ָ��
    );
	reg [31:0] IM[0:4095];//4096
	
	initial begin
		$readmemh("code.txt",IM);
	end
	assign Instr_F = IM[(InstrAddr[13:2]-12'b1100_0000_0000)];//ע��Ҫ�۵�3000
endmodule
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
module IFU(
	input CLK,										//����ʱ���ź�
	input Reset,									//���븴λ�ź�
	input Stall,									//������ͣ�ź�
	input [31:0] PCIn,							//������һ��PC��ֵ
	output [31:0] PCPlus4_F,					//�����ǰ��PC+4
	output reg [31:0] PCOut = 32'h00003000 //�����ǰ��PC
	);
	
	assign PCPlus4_F = PCOut + 4;				//PC+4 
	
	always @ (posedge CLK)begin
		if(Reset)									//�����λ����Ϊ0x3000
			PCOut <= 32'h00003000;
		else if(~Stall)							//���򲻸�λ�Ļ����������ͣ���͸��£���ͣ�Ͳ���
			PCOut <= PCIn;
	end
endmodule
//////////////////////////////////////////////////////////////////////////////////

