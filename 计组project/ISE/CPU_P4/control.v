`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:33 11/23/2018 
// Design Name: 
// Module Name:    control 
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
module control(
	input [5:0] opcode,func,
	input [4:0] rt,
	output  jr ,jal ,jump ,regdst ,memtoreg ,memwrite ,alusrc ,regwrite , jalr,/////////////////////////���һ���ڶ���Ŀ����ź�
	output  [1:0] extop , store_sel,
	output  [2:0] load_sel,
	output  [3:0] aluctr,npc_sel///////////////////////////////////////////////////////////
    );
	
	parameter [5:0] RCLASS = 6'b000000, // R��ָ�� �� nop
						 ADDU = 6'b100001,	//ADDU
						 SUBU = 6'b100011,	//SUBU
						 ORI = 6'b001101,		//ORI
						 LW = 6'b100011,		//LW
						 SW = 6'b101011,		//SW
						 BEQ = 6'b000100,		//BEQ
						 LUI = 6'b001111,		//LUI
						 JAL = 6'b000011,		//JAL
						 JR = 6'b001000,		//JR						 
						 J = 6'b000010,		//J
						 BGEZ = 6'b000001,	//BGEZ
						 BGTZ = 6'b000111,	//BGTZ
						 BNE = 6'b000101,		//BNE
						 BLEZ = 6'b000110,	//BLEZ
						 BLTZ = 6'b000001,	//BLTZ
						 LB = 6'b100000,		//LB
						 LBU = 6'b100100,		//LBU
						 LH = 6'b100001,		//LH
						 LHU = 6'b100101,		//LHU
						 SB = 6'b101000,		//SB
						 SH = 6'b101001,		//SH
						 BGEZAL = 6'b000001,				//BGEZAL///////////////////////////////////////////////////
						 BLTZAL = 6'b000001,				//BLTZAL///////////////////////////////////////////////////
						 //���²��Կ���������ָ��������rotrv
						 //��srlv������rotrv
						 SRLV = 6'b000110,				//SRLV////////////////////////////////////////////////////////////
						 JALR = 6'b001001;//////////////////////////////////////////////////////////////////////////////
						 
						 
	wire addu_and, subu_and, ori_and, lw_and, sw_and, beq_and, lui_and, 
		  jal_and, jr_and, j_and, bgez_and, bgtz_and, bne_and, blez_and, 
		  bltz_and, lb_and, lbu_and, lh_and, lhu_and, sb_and, sh_and, srlv_and,///////////////////////////////////
		  bgezal_and, bltzal_and, jalr_and;//////////////////////////////////
	
	//and logic
	assign addu_and = opcode == RCLASS? (func == ADDU? 1 : 0) : 0;
	assign subu_and = opcode == RCLASS? (func == SUBU? 1 : 0) : 0;
	assign ori_and = opcode == ORI? 1 : 0;
	assign lw_and = opcode == LW? 1 : 0;
	assign sw_and = opcode == SW? 1 : 0;
	assign beq_and = opcode == BEQ? 1 : 0;
	assign lui_and = opcode == LUI? 1 : 0;
	assign jal_and = opcode == JAL? 1 : 0;
	assign jr_and = opcode == RCLASS? (func == JR? 1 : 0) : 0;
	assign j_and = opcode == J? 1 : 0;
	assign bgez_and = opcode == BGEZ? ((rt == 5'b00001)? 1 : 0) : 0;
	assign bgtz_and = opcode == BGTZ? 1 : 0;
	assign bne_and = opcode == BNE? 1 : 0;
	assign blez_and = opcode == BLEZ? 1 : 0;
	assign bltz_and = opcode == BLTZ? ((rt == 5'b00000)? 1 : 0) : 0;
	assign lb_and = opcode == LB? 1 : 0;
	assign lbu_and = opcode == LBU? 1 : 0;
	assign lh_and = opcode == LH? 1 : 0;
	assign lhu_and = opcode == LHU? 1 : 0;
	assign sb_and = opcode == SB? 1 : 0;
	assign sh_and = opcode == SH? 1 : 0;
	assign srlv_and = opcode == RCLASS? (func == SRLV? 1 : 0):0;////////////////////////////////////////////////////
	assign bgezal_and = opcode == BGEZAL? ((rt == 5'b10001)? 1 : 0):0;////////////////////////////////////////////
	assign bltzal_and = opcode == BLTZAL? ((rt == 5'b10000)? 1 : 0):0;/////////////////////////////////////////////
	assign jalr_and = opcode == RCLASS? (func == JALR? 1 : 0):0;//////////////////////////////////////////////
	////////////�ǵò鿴��ԭ�������޳�ͻ
	//or_logic
	assign jr = jr_and || jalr_and; 
	//�ж��Ƿ�Ϊjrָ����������޸�IFU��pc�Ĵ����ַ������ת��ra��IFU CONTROL 
	
	assign jal = jal_and;
	//�ж��Ƿ�Ϊjalָ����������޸�MUXREGRD��д��Ĵ����ĵ�ַΪra���޸�MUNREGDATA��д��Ĵ���������ΪPC+4��MUXREGIN MUXREGDATA CONTROL
	
	assign jump = j_and || jal_and; 
	// �ж��Ƿ�Ϊjָ����������޸�IFU��pc�Ĵ����ַ������ת��label��IFU CONTROL
	
	assign regdst = addu_and || subu_and || srlv_and; /////////////////////////////////////////
	//�ж��Ƿ�Ϊ���Ĵ���������ָ��������ǽ�д��Ĵ�����ַ����Ϊrd��CONTROL MUXREGRD
	
	assign npc_sel[0] = beq_and || bgtz_and || bltz_and || bgezal_and;///////////////////////////////
	assign npc_sel[1] = bne_and || bgtz_and || blez_and || bgezal_and;/////////////////////////////////
	assign npc_sel[2] = bgez_and || bltz_and || blez_and || bgezal_and;//////////////////////////////
	assign npc_sel[3] = bltzal_and;//////////////////////////////////////////////////////////////////
	//�ж�Bָ�����ͣ�CONTROL IFU
	
	assign memtoreg = lw_and || lb_and || lbu_and || lh_and || lhu_and;
	//�ж��Ƿ��ȡDM�����ݣ�CONTROL MUXREGDATA
	
	assign memwrite = sw_and || sb_and || sh_and; 
	//�ж��Ƿ�д��DM���ݣ�DM CONTROL
	
	assign alusrc = ori_and || lw_and || lui_and || sw_and || lb_and || lbu_and || lh_and || lhu_and || sb_and || sh_and; 
	//�ж�ALU�Ĳ������ǼĴ�����������������CONTROL MUXALUNUM
	
	assign regwrite = addu_and || subu_and || lui_and || ori_and || lw_and || jal_and || lb_and || lbu_and || lh_and || lhu_and
			 || bgezal_and || bltzal_and || srlv_and || jalr_and;///////////////////////////////////////////////////
	//�ж��Ƿ�ԼĴ�������д������CONTROL GRF
	
	assign extop[0] = lw_and || sw_and || lb_and || lbu_and || lh_and || lhu_and || sb_and || sh_and;
	assign extop[1] = lui_and;
	//�ж϶�����������������չ��EXT CONTROL
	
	assign aluctr = srlv_and? 3 :(ori_and? 2 :(subu_and ? 1 : 0));//////////////////////////////////////////
	//�жϽ�������ALU���㣬CONTROL ALU
	
	assign load_sel[0] = lh_and || lb_and;
	assign load_sel[1] = lhu_and || lb_and;
	assign load_sel[2] = lbu_and;
	//�жϴ�DM��ȡ���ݵ����ͣ�CONTROL MEMOUT
	
	assign store_sel[0] = sh_and;
	assign store_sel[1] = sb_and;
	//�жϴ��DM���������ͣ�CONTROL MEMDATA
	
	assign jalr = jalr_and;
	//�ж��Ƿ�Ϊjalrָ�����д�Ĵ�������rd,д��Ĵ�����������PC+4�� CONTROL MUXREGIN MUXREDATA
	
endmodule
