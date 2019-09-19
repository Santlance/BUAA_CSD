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

module CONTROLLER_D(
	input [31:0] Instr_D,											//输入来自D级寄存器的指令
	input  CMPOut,												//输入来自D级部件（CMP）的比较结果
	input [1:0] CMPZeroOut,
	output [1:0] NPCSel,												//输出给D级部件NPC的NPC选择信号
	output [3:0] EXTSel,												//输出给D级部件EXT的EXT选择信号
	output RegWrite_D,												//输出给E级寄存器的当前D级指令的写寄存器信号
	output PCSel														//输出给F级部件的PC选择信号
    );
	wire [5:0] opcode = Instr_D[`OPCODE], func = Instr_D[`FUNC];
	
	assign NPCSel[0] = (opcode == `J) || (opcode == `JAL);	//Bclass Jclass JR
	assign NPCSel[1] = (opcode == `RCLASS && func == `JR);
	
	assign EXTSel[0] = (opcode == `LW) || (opcode == `SW) ||(opcode == `ADDI) || (opcode == `ADDIU) ||
							 (opcode == `RCLASS && func == `SLL) || (opcode == `RCLASS && func == `SRL) ||
							 (opcode == `RCLASS && func == `SRA);	//应该是SW LW要SIGN_EXT而不是BEQ store load cal_i
	assign EXTSel[1] = (opcode == `LUI) || (opcode == `RCLASS && func == `SLL) || (opcode == `RCLASS && func == `SRL)||
							 (opcode == `RCLASS && func == `SRA);
	assign EXTSel[2] = 0;//还没用到
	assign EXTSel[3] = 0;//还没用到
	
	assign RegWrite_D = (opcode == `LW) || (opcode == `RCLASS && func == `ADDU) || (opcode == `RCLASS && func == `SUBU) || (opcode == `ORI) ||
							  (opcode == `LUI) || (opcode == `JAL) || (opcode == `RCLASS && func == `ADD) || (opcode == `ADDI) ||
							  (opcode == `ADDIU) || (opcode == `RCLASS && func == `SUB) || (opcode == `RCLASS && func == `OR) ||
							  (opcode == `RCLASS && func == `AND) || (opcode == `ANDI) || (opcode == `RCLASS && func == `XOR) ||
							  (opcode == `XORI) || (opcode == `RCLASS && func == `NOR) || (opcode == `RCLASS && func == `SLL) ||
							  (opcode == `RCLASS && func == `SLLV) || (opcode == `RCLASS && func == `SRL) ||
							  (opcode == `RCLASS && func == `SRLV) ||(opcode == `RCLASS && func == `SRA)|| (opcode == `RCLASS && func == `SRAV);//cal_r cal_i load jal
	
	assign PCSel = (CMPOut && (opcode == `BEQ)) || (~CMPOut && (opcode == `BNE)) || ((CMPZeroOut == 2'b00) && (opcode == `REGIMM && Instr_D[`RT] == `BLTZ))|| 
					   ((CMPZeroOut == 2'b01) && (opcode == `BGTZ)) || ((CMPZeroOut == 2'b10) && (opcode == `BLEZ)) || 
						((CMPZeroOut == 2'b11) && (opcode == `REGIMM && Instr_D[`RT] == `BGEZ)) || (opcode == `J) ||(opcode == `JAL) || (opcode == `RCLASS && func == `JR);
						//Bclass Jclass JR jal
endmodule
//////////////////////////////////////////////////////////////////////////////////
module CONTROLLER_E(
	input [31:0] Instr_E,
	output [3:0] ALUSel,
	output MUXALUBSel,
	output MUXALUASel,
	output [1:0] RegDst,								//处理JAL
	output ALUOutputSel								//处理普通的运算指令和对RA进行操作的指令的ALU输出的问题
    );
	wire [5:0] opcode = Instr_E[`OPCODE], func = Instr_E[`FUNC];
	
	assign ALUSel[0] = (opcode == `RCLASS && func == `SUBU) || (opcode == `RCLASS && func == `SUB) || (opcode == `RCLASS && func == `NOR)||
							 (opcode == `RCLASS && func == `SLL) || (opcode == `RCLASS && func == `SLLV) || (opcode == `RCLASS && func == `SRA)||
							 (opcode == `RCLASS && func == `SRAV);		//cal_r cal_i load store
	assign ALUSel[1] = (opcode == `ORI) || (opcode == `RCLASS && func == `OR) || (opcode == `RCLASS && func == `AND) ||
								(opcode == `ANDI) || (opcode == `RCLASS && func == `SLL) || (opcode == `RCLASS && func == `SLLV);
	assign ALUSel[2] = (opcode == `RCLASS && func == `AND) || (opcode == `ANDI) || (opcode == `RCLASS && func == `SRL)||
							 (opcode == `RCLASS && func == `SRLV) || (opcode == `RCLASS && func == `SRA) || (opcode == `RCLASS && func == `SRAV);
							 
	assign ALUSel[3] = (opcode == `RCLASS && func == `XOR) || (opcode == `XORI) || (opcode == `RCLASS && func == `NOR);
	
	assign MUXALUASel =(opcode == `RCLASS && func == `SLL) || (opcode == `RCLASS && func == `SRL)||(opcode == `RCLASS && func == `SRA);
	
	assign MUXALUBSel = (opcode == `ORI) || (opcode == `LUI) || (opcode == `LW) || (opcode == `SW) || (opcode == `ADDI) ||
								(opcode == `ADDIU) || (opcode == `ANDI) || (opcode == `XORI) ;// 1 的话就是立即数运算
	//cal_r cal_i load store
	assign RegDst = (opcode == `JAL)?																				  2:
						 ((opcode == `RCLASS&& func == `ADDU) || (opcode == `RCLASS && func == `SUBU)||
							(opcode == `RCLASS && func == `SUB) || (opcode == `RCLASS && func == `ADD)
							|| (opcode == `RCLASS && func == `OR) || (opcode == `RCLASS && func == `AND)
							|| (opcode == `RCLASS && func == `XOR) || (opcode == `RCLASS && func == `NOR)
							|| (opcode == `RCLASS && func == `SLL) || (opcode == `RCLASS && func == `SLLV)
							|| (opcode == `RCLASS && func == `SRL) || (opcode == `RCLASS && func == `SRLV)
							|| (opcode == `RCLASS && func == `SRA) || (opcode == `RCLASS && func == `SRAV))? 1 :
																																  0 ;
	//cal_r jal
	assign ALUOutputSel = (opcode == `JAL);//jal 增加一位，选择乘除的输出，还得看选择的是HI还是LO
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
