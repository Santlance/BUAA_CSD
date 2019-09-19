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
`define FUNC 	5:0
`define RS 		25:21
`define RT 		20:16
`define RD 		15:11
`define RCLASS 6'b000000
`define REGIMM 6'b000001

`define LB 		6'b100000
`define LBU		6'b100100
`define LH		6'b100001
`define LHU		6'b100101
`define LW 		6'b100011
`define SB		6'b101000
`define SH		6'b101001
`define SW 		6'b101011
`define ADD		6'b100000
`define ADDU 	6'b100001
`define ADDI	6'b001000
`define ADDIU	6'b001001
`define SUB		6'b100010
`define SUBU 	6'b100011
`define AND		6'b100100
`define ANDI	6'b001100
`define OR		6'b100101
`define ORI 	6'b001101
`define XOR		6'b100110
`define XORI	6'b001110
`define NOR		6'b100111
`define SLLV	6'b000100
`define SLL		6'b000000
`define SRLV	6'b000110
`define SRL		6'b000010
`define SRAV	6'b000111
`define SRA		6'b000011
`define SLT		6'b101010
`define SLTU	6'b101011
`define SLTI	6'b001010
`define SLTIU	6'b001011
`define LUI 	6'b001111
`define BEQ 	6'b000100
`define BNE		6'b000101
`define BLEZ	6'b000110
`define BGTZ	6'b000111
`define BLTZ	5'b00000////////
`define BGEZ	5'b00001////////
`define J 		6'b000010
`define JAL 	6'b000011
`define JR 		6'b001000
`define JALR	6'b001001
`define MULT	6'b011000
`define MULTU	6'b011001
`define DIV		6'b011010
`define DIVU	6'b011011
`define MFHI	6'b010000
`define MFLO	6'b010010
`define MTHI	6'b010001
`define MTLO	6'b010011
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
	assign Tuse_RS0 = (Instr_D[`OPCODE] == `BEQ) || (Instr_D[`OPCODE] == `BNE) || (Instr_D[`OPCODE] == `REGIMM && Instr_D[`RT] == `BLTZ) ||
							(Instr_D[`OPCODE] == `BGTZ) || (Instr_D[`OPCODE] == `BLEZ) || (Instr_D[`OPCODE] == `REGIMM && Instr_D[`RT] == `BGEZ) || 
							((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `JR));
	
	//��D������1��������Ҫʹ��RS  cal_r cal_i load store
	assign Tuse_RS1 = ((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `ADDU)) || 
							((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `SUBU)) ||
							(Instr_D[`OPCODE] == `LW) || (Instr_D[`OPCODE] == `SW) || (Instr_D[`OPCODE] == `ORI) || (Instr_D[`OPCODE] == `LUI)
							|| (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `ADD) || (Instr_D[`OPCODE] == `ADDI) || 
							(Instr_D[`OPCODE] == `ADDIU) || (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SUB) || 
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `OR) || (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `AND)||
							(Instr_D[`OPCODE] == `ANDI) || (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `XOR) || (Instr_D[`OPCODE] == `XORI)||
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `NOR) || (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SLLV)||
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SRLV)|| (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SRAV)||
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SLT) || (Instr_D[`OPCODE] == `SLTI) || 
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SLTU)|| (Instr_D[`OPCODE] == `SLTIU);
							
	//��D������0��������Ҫʹ��RT	beq					
	assign Tuse_RT0 = (Instr_D[`OPCODE] == `BEQ) || (Instr_D[`OPCODE] == `BNE);
	
	//��D������1��������Ҫʹ��RT	cal_r
	assign Tuse_RT1 = ((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `ADDU)) || 
							((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `SUBU)) ||
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `ADD) || (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SUB)||
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `OR) || (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `AND)||
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `XOR)|| (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `NOR)||
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SLL)|| (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SLLV)||
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SRL)|| (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SRLV)||
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SRA)|| (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SRAV)||
							(Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SLT)|| (Instr_D[`OPCODE] == `RCLASS && Instr_D[`FUNC] == `SLTU);
							
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
