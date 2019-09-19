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
	output  jr ,jal ,jump ,regdst ,memtoreg ,memwrite ,alusrc ,regwrite , jalr,/////////////////////////多加一个在顶层的控制信号
	output  [1:0] extop , store_sel,
	output  [2:0] load_sel,
	output  [3:0] aluctr,npc_sel///////////////////////////////////////////////////////////
    );
	
	parameter [5:0] RCLASS = 6'b000000, // R类指令 或 nop
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
						 //课下测试可以用其他指令来代替rotrv
						 //用srlv来代替rotrv
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
	////////////记得查看和原来的有无冲突
	//or_logic
	assign jr = jr_and || jalr_and; 
	//判断是否为jr指令，其作用是修改IFU内pc的传入地址，即跳转至ra，IFU CONTROL 
	
	assign jal = jal_and;
	//判断是否为jal指令，其作用是修改MUXREGRD即写入寄存器的地址为ra和修改MUNREGDATA即写入寄存器的数据为PC+4，MUXREGIN MUXREGDATA CONTROL
	
	assign jump = j_and || jal_and; 
	// 判断是否为j指令，其作用是修改IFU内pc的传入地址，即跳转至label，IFU CONTROL
	
	assign regdst = addu_and || subu_and || srlv_and; /////////////////////////////////////////
	//判断是否为三寄存器操作数指令，其作用是讲写入寄存器地址定向为rd，CONTROL MUXREGRD
	
	assign npc_sel[0] = beq_and || bgtz_and || bltz_and || bgezal_and;///////////////////////////////
	assign npc_sel[1] = bne_and || bgtz_and || blez_and || bgezal_and;/////////////////////////////////
	assign npc_sel[2] = bgez_and || bltz_and || blez_and || bgezal_and;//////////////////////////////
	assign npc_sel[3] = bltzal_and;//////////////////////////////////////////////////////////////////
	//判断B指令类型，CONTROL IFU
	
	assign memtoreg = lw_and || lb_and || lbu_and || lh_and || lhu_and;
	//判断是否读取DM的数据，CONTROL MUXREGDATA
	
	assign memwrite = sw_and || sb_and || sh_and; 
	//判断是否写进DM数据，DM CONTROL
	
	assign alusrc = ori_and || lw_and || lui_and || sw_and || lb_and || lbu_and || lh_and || lhu_and || sb_and || sh_and; 
	//判断ALU的操作数是寄存器数还是立即数，CONTROL MUXALUNUM
	
	assign regwrite = addu_and || subu_and || lui_and || ori_and || lw_and || jal_and || lb_and || lbu_and || lh_and || lhu_and
			 || bgezal_and || bltzal_and || srlv_and || jalr_and;///////////////////////////////////////////////////
	//判断是否对寄存器进行写操作，CONTROL GRF
	
	assign extop[0] = lw_and || sw_and || lb_and || lbu_and || lh_and || lhu_and || sb_and || sh_and;
	assign extop[1] = lui_and;
	//判断对立即数进行哪种扩展，EXT CONTROL
	
	assign aluctr = srlv_and? 3 :(ori_and? 2 :(subu_and ? 1 : 0));//////////////////////////////////////////
	//判断进行哪种ALU运算，CONTROL ALU
	
	assign load_sel[0] = lh_and || lb_and;
	assign load_sel[1] = lhu_and || lb_and;
	assign load_sel[2] = lbu_and;
	//判断从DM中取数据的类型，CONTROL MEMOUT
	
	assign store_sel[0] = sh_and;
	assign store_sel[1] = sb_and;
	//判断存进DM的数据类型，CONTROL MEMDATA
	
	assign jalr = jalr_and;
	//判断是否为jalr指令，控制写寄存器号是rd,写入寄存器的数据是PC+4， CONTROL MUXREGIN MUXREDATA
	
endmodule
