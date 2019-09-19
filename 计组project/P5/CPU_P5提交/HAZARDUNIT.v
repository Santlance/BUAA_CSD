`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:27:58 12/04/2018 
// Design Name: 
// Module Name:    HAZARDUNIT 
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
`define OPCODE 31:26 
`define FUNC 5:0
`define RS 25:21
`define RT 20:16
`define RD 15:11
`define RCLASS 6'b000000
`define LW 6'b100011
`define SW 6'b101011
`define ADDU 6'b100001
`define SUBU 6'b100011
`define ORI 6'b001101
`define LUI 6'b001111
`define BEQ 6'b000100
`define J 6'b000010
`define JAL 6'b000011
`define JR 6'b001000
module HAZARDUNIT(
	input [31:0] Instr_D, Instr_E, Instr_M, Instr_W,//����ָ��
	input RegWrite_E, RegWrite_M, RegWrite_W,//����д�ź�
	input [4:0] A3_E, A3_M, A3_W,//����A3_M���㣬��Ȼ�������жϺ��鷳
	output Stall,
	output [1:0] ForwardRSD, ForwardRTD, ForwardRSE, ForwardRTE, 
	output ForwardRTM
    );
	 
	 wire Tuse_RS0, Tuse_RS1, Tuse_RT0, Tuse_RT1, Tuse_RT2;//���������ʾָ����������жϼĴ���ʹ���������������ǵ����������ʱ�䣬����
	 wire Stall_RS0_E1, Stall_RS0_E2, Stall_RS0_M1, Stall_RS1_E2, Stall_RS,
			Stall_RT0_E1, Stall_RT0_E2, Stall_RT0_M1, Stall_RT1_E2, Stall_RT;
	 wire [1:0] Tnew_E, Tnew_M;
	//����Tnew
	 DECODER_Tnew_E decoder_tnew_e(
	 .Instr(Instr_E),
	 .Tnew(Tnew_E)
	 );
	 
	 DECODER_Tnew_M decoder_tnew_m(
	 .Instr(Instr_M),
	 .Tnew(Tnew_M)
	 );
	//����Tuse
	//Tuse��Tnew������������ж���ͣ��
	
	//��D������0��������Ҫʹ��RS  beq jr
	assign Tuse_RS0 = (Instr_D[`OPCODE] == `BEQ) || ((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `JR));
	
	//��D������1��������Ҫʹ��RS  cal_r cal_i load store
	assign Tuse_RS1 = ((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `ADDU)) || 
							((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `SUBU)) ||
							(Instr_D[`OPCODE] == `LW) || (Instr_D[`OPCODE] == `SW) || (Instr_D[`OPCODE] == `ORI) || (Instr_D[`OPCODE] == `LUI);
							
	//��D������0��������Ҫʹ��RT	beq					
	assign Tuse_RT0 = (Instr_D[`OPCODE] == `BEQ);
	
	//��D������1��������Ҫʹ��RT	cal_r
	assign Tuse_RT1 = ((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `ADDU)) || 
							((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `SUBU));
							
	//��D������2��������Ҫʹ��RT	store			
	assign Tuse_RT2 = (Instr_D[`OPCODE] == `SW);
	
	//����Stall
	
	//�����D������0������Ҫʹ��RS����E��ָ������1�����ڲ��ܲ�����Ҫд�������
	assign Stall_RS0_E1 = Tuse_RS0 && (Tnew_E == 2'b01) && (Instr_D[`RS] == A3_E) && RegWrite_E;
	
	//�����D������0������Ҫʹ��RS����E��ָ������2�����ڲ��ܲ�����Ҫд�������
	assign Stall_RS0_E2 = Tuse_RS0 && (Tnew_E == 2'b10) && (Instr_D[`RS] == A3_E) && RegWrite_E;
	
	//�����D������0������Ҫʹ��RS����M��ָ������1�����ڲ��ܲ�����Ҫд�������
	assign Stall_RS0_M1 = Tuse_RS0 && (Tnew_M == 2'b01) && (Instr_D[`RS] == A3_M) && RegWrite_M;
	
	//�����D������1������Ҫʹ��RS����E��ָ������2�����ڲ��ܲ�����Ҫд�������
	assign Stall_RS1_E2 = Tuse_RS1 && (Tnew_E == 2'b10) && (Instr_D[`RS] == A3_E) && RegWrite_E;
	
	assign Stall_RS = Stall_RS0_E1 || Stall_RS0_E2 || Stall_RS0_M1 || Stall_RS1_E2;
	
	
	//�����D������0������Ҫʹ��RT����E��ָ������1�����ڲ��ܲ�����Ҫд�������
	assign Stall_RT0_E1 = Tuse_RT0 && (Tnew_E == 2'b01) && (Instr_D[`RT] == A3_E) && RegWrite_E;
	
	//�����D������0������Ҫʹ��RT����E��ָ������2�����ڲ��ܲ�����Ҫд�������
	assign Stall_RT0_E2 = Tuse_RT0 && (Tnew_E == 2'b10) && (Instr_D[`RT] == A3_E) && RegWrite_E;
	
	//�����D������0������Ҫʹ��RT����M��ָ������1�����ڲ��ܲ�����Ҫд�������
	assign Stall_RT0_M1 = Tuse_RT0 && (Tnew_M == 2'b01) && (Instr_D[`RT] == A3_M) && RegWrite_M;
	
	//�����D������1������Ҫʹ��RT����E��ָ������2�����ڲ��ܲ�����Ҫд�������
	assign Stall_RT1_E2 = Tuse_RT1 && (Tnew_E == 2'b10) && (Instr_D[`RT] == A3_E) && RegWrite_E;
	
	assign Stall_RT = Stall_RT0_E1 || Stall_RT0_E2 || Stall_RT0_M1 || Stall_RT1_E2;
	
	assign Stall = Stall_RS || Stall_RT;
	
	//����Forward
	//��תָ��֮��涨�����ٽ���תָ��
	//���ڶ�һ��ָ����SW��RT���ܴ��ڶ��ת�������Ե�ȷ�ñ�֤���ȼ����⣬���¸���������
	//ָ����Խ����Ҫ�õ��Ĵ�����ֵ�����õ�ֵ������ת�����¾�Խ��
	
	//��D����ָ�beq����Ҫ�õ�RS������������ָ����������Ҫ�Ļ�������ǰת��
	assign ForwardRSD = ((Instr_D[`RS] == A3_M) && (Tnew_M == 0) && (A3_M != 0) && RegWrite_M)? 2 :
													 ((Instr_D[`RS] == A3_W) && (A3_W != 0) && RegWrite_W)? 1 :
																															  0 ;
	//��D����ָ�beq����Ҫ�õ�RT								
	assign ForwardRTD = ((Instr_D[`RT] == A3_M) && (Tnew_M == 0) && (A3_M != 0) && RegWrite_M)? 2 :
													 ((Instr_D[`RT] == A3_W) && (A3_W != 0) && RegWrite_W)? 1 :
																															  0 ;
	//��E����ָ�cal_r cal_i load store����Ҫ�õ�RS																														  
	assign ForwardRSE = ((Instr_E[`RS] == A3_M) && (Tnew_M == 0) && (A3_M != 0) && RegWrite_M)? 2 :
													 ((Instr_E[`RS] == A3_W) && (A3_W != 0) && RegWrite_W)? 1 :
																															  0 ;
	//��E����ָ�cal_r����Ҫ�õ�RT								
	assign ForwardRTE = ((Instr_E[`RT] == A3_M) && (Tnew_M == 0) && (A3_M != 0) && RegWrite_M)? 2 :
													 ((Instr_E[`RT] == A3_W) && (A3_W != 0) && RegWrite_W)? 1 :
																															  0 ;
	//��M����ָ�sw����Ҫ�õ�RT								
	assign ForwardRTM = ((Instr_M[`RT] == A3_M) && (Tnew_M == 0) && (A3_M != 0) && RegWrite_M)? 2 :
													 ((Instr_M[`RT] == A3_W) && (A3_W != 0) && RegWrite_W)? 1 :
																															  0 ;
	
endmodule
