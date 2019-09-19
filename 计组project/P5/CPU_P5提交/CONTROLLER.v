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

module CONTROLLER_D(
	input [31:0] Instr_D,											//输入来自D级寄存器的指令
	input [1:0] CMPOut,												//输入来自D级部件（CMP）的比较结果
	output [1:0] NPCSel,												//输出给D级部件NPC的NPC选择信号
	output [3:0] EXTSel,												//输出给D级部件EXT的EXT选择信号
	output RegWrite_D,												//输出给E级寄存器的当前D级指令的写寄存器信号
	output PCSel														//输出给F级部件的PC选择信号
    );
	wire [5:0] opcode = Instr_D[`OPCODE], func = Instr_D[`FUNC];
	
	assign NPCSel[0] = (opcode == `J) || (opcode == `JAL);	//Bclass Jclass JR
	assign NPCSel[1] = (opcode == `RCLASS && func == `JR);
	
	assign EXTSel[0] = (opcode == `LW) || (opcode == `SW);	//应该是SW LW要SIGN_EXT而不是BEQ store load cal_i
	assign EXTSel[1] = opcode == `LUI;
	assign EXTSel[2] = 0;//还没用到
	assign EXTSel[3] = 0;//还没用到
	
	assign RegWrite_D = (opcode == `LW) || (opcode == `RCLASS && func == `ADDU) || (opcode == `RCLASS && func == `SUBU) || (opcode == `ORI) ||
							  (opcode == `LUI) || (opcode == `JAL);//cal_r cal_i load jal
	
	assign PCSel = ((CMPOut == 2'b00) && (opcode == `BEQ)) || (opcode == `J) || (opcode == `JAL) || (opcode == `RCLASS && func == `JR);
						//Bclass Jclass JR jal
endmodule
//////////////////////////////////////////////////////////////////////////////////
module CONTROLLER_E(
	input [31:0] Instr_E,
	output [3:0] ALUSel,
	output MUXALUBSel,
	output [1:0] RegDst,								//处理JAL
	output ALUOutputSel								//处理普通的运算指令和对RA进行操作的指令的ALU输出的问题
    );
	wire [5:0] opcode = Instr_E[`OPCODE], func = Instr_E[`FUNC];
	
	assign ALUSel[0] = (opcode == `RCLASS && func == `SUBU);		//cal_r cal_i load store
	assign ALUSel[1] = opcode == `ORI;
	assign ALUSel[2] = 0;//还没用到
	assign ALUSel[3] = 0;//还没用到
	
	assign MUXALUBSel = (opcode == `ORI) || (opcode == `LUI) || (opcode == `LW) || (opcode == `SW);// 1 的话就是立即数运算
	//cal_r cal_i load store
	assign RegDst = (opcode == `JAL)?																				  2:
						 ((opcode == `RCLASS&& func == `ADDU) || (opcode == `RCLASS && func == `SUBU))? 1 :
																																  0 ;
	//cal_r jal
	assign ALUOutputSel = (opcode == `JAL);//jal

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
