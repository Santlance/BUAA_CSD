`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:32 12/04/2018 
// Design Name: 
// Module Name:    CONTROLLER 
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
`define RCLASS 6'b000000
`define RT 20:16/**********************/

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

`define REGIMM 6'b000001 /***********************/

module CONTROLLER_D(
	input [31:0] Instr_D,											//��������D���Ĵ�����ָ��
	input [1:0] CMPOut,												//��������D��������CMP���ıȽϽ��
	output [1:0] NPCSel,												//�����D������NPC��NPCѡ���ź�
	output [3:0] EXTSel,												//�����D������EXT��EXTѡ���ź�
	output RegWrite_D,												//�����E���Ĵ����ĵ�ǰD��ָ���д�Ĵ����ź�
	output PCSel														//�����F��������PCѡ���ź�
    );
	wire [5:0] opcode = Instr_D[`OPCODE], func = Instr_D[`FUNC];
	
	assign NPCSel[0] = (opcode == `J) || (opcode == `JAL);	//Bclass Jclass JR
	assign NPCSel[1] = (opcode == `RCLASS && func == `JR);
	
	assign EXTSel[0] = (opcode == `LW) || (opcode == `SW);	//Ӧ����SW LWҪSIGN_EXT������BEQ store load cal_i
	assign EXTSel[1] = opcode == `LUI;
	assign EXTSel[2] = 0;//��û�õ�
	assign EXTSel[3] = 0;//��û�õ�
	
	assign RegWrite_D = (opcode == `LW) || (opcode == `RCLASS && func == `ADDU) || (opcode == `RCLASS && func == `SUBU) || (opcode == `ORI) ||
							  (opcode == `LUI) || (opcode == `JAL) || ((CMPOut == 2'b11)&& (opcode == `REGIMM && Instr_D[`RT] == 5'b10001));//cal_r cal_i load jal
							/*************************************/
	assign PCSel = ((CMPOut == 2'b00) && (opcode == `BEQ)) || (opcode == `J) || (opcode == `JAL) || (opcode == `RCLASS && func == `JR)||
						((CMPOut == 2'b11)&& (opcode == `REGIMM && Instr_D[`RT] == 5'b10001));/***********************/
						//Bclass Jclass JR jal
endmodule
//////////////////////////////////////////////////////////////////////////////////
module CONTROLLER_E(
	input [31:0] Instr_E,
	input [1:0] CMPOut,/******************************////����CMPOut�����ж�bgezal
	output [3:0] ALUSel,
	output MUXALUBSel,
	output [1:0] RegDst,								//����JAL
	output ALUOutputSel								//������ͨ������ָ��Ͷ�RA���в�����ָ���ALU���������
    );
	wire [5:0] opcode = Instr_E[`OPCODE], func = Instr_E[`FUNC];
	
	assign ALUSel[0] = (opcode == `RCLASS && func == `SUBU);		//cal_r cal_i load store
	assign ALUSel[1] = opcode == `ORI;
	assign ALUSel[2] = 0;//��û�õ�
	assign ALUSel[3] = 0;//��û�õ�
	
	assign MUXALUBSel = (opcode == `ORI) || (opcode == `LUI) || (opcode == `LW) || (opcode == `SW);// 1 �Ļ���������������
	//cal_r cal_i load store
	assign RegDst = ((opcode == `JAL)||((CMPOut == 2'b11)&& (opcode == `REGIMM && Instr_E[`RT] == 5'b10001)))?	 2:
						 ((opcode == `RCLASS&& func == `ADDU) || (opcode == `RCLASS && func == `SUBU))? 1 :
																																  0 ;
	//cal_r jal
	assign ALUOutputSel = (opcode == `JAL)||((CMPOut == 2'b11)&& (opcode == `REGIMM && Instr_E[`RT] == 5'b10001));//jal
	/**************************************************/
endmodule
//////////////////////////////////////////////////////////////////////////////////
module CONTROLLER_M(
	input [31:0] Instr_M,
	output MemWrite
    );
	wire [5:0] opcode = Instr_M[`OPCODE], func = Instr_M[`FUNC];
	
	assign MemWrite = opcode == `SW;	//store

endmodule
//////////////////////////////////////////////////////////////////////////////////
module CONTROLLER_W(
	input [31:0] Instr_W,
	output [1:0] MemtoReg_W		
    );
	wire [5:0] opcode = Instr_W[`OPCODE], func = Instr_W[`FUNC];
	
	assign MemtoReg_W = (opcode == `JAL)? 2:	//load jal
							  (opcode == `LW)?  1:
														0;

endmodule
