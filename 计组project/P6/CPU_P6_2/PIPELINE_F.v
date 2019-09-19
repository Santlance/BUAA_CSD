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
	input CLK,   									//输入时钟信号
	input Reset,									//输入复位信号
	input Stall,									//输入暂停信号
	input PCSel,									//输入PC选择信号
	input [31:0] NPCOut,							//输入PC可能的值
	//input [31:0] GRF_RD1,						//丢给NPC部分
	output [31:0] Instr_F,						//输出指令
	output [31:0] PCPlus4_F						//输出PC+4
	);
	wire [31:0] PCOut, PCIn;
	
	IM im(
	.InstrAddr(PCOut),							//连接到IFU的PCOut，作为指令地址
	
	.Instr_F(Instr_F)								//连接到PIPELINE_F的输出，作为指令输出
	);
	
	IFU ifu(
	.PCIn(PCIn),									//PC的输入，连接到MUXPC的输出
	.CLK(CLK),										//时钟信号
	.Reset(Reset),									//复位信号
	.Stall(Stall),									//暂停信号
	
	.PCOut(PCOut),									//输出当前PC值，连接到IM的地址输入
	.PCPlus4_F(PCPlus4_F)						//输出当前PC+4，连接到PIPELINE_F的输出，作为PC+4输出
	);
	
	MUX_2_1_32 muxpc(
	.A(PCPlus4_F),									//输入PC+4
	.B(NPCOut),										//输入来自NPC的可能的值
	.Sel(PCSel),									//PC的选择信号
	
	.C(PCIn)											//PC的输入
	);
	
	
endmodule
//////////////////////////////////////////////////////////////////////////////////
module IM(
	 input [31:0] InstrAddr,					//输入指令地址信号
	 output [31:0] Instr_F						//输出指令
    );
	reg [31:0] IM[0:4095];//4096
	
	initial begin
		$readmemh("code.txt",IM);
	end
	assign Instr_F = IM[(InstrAddr[13:2]-12'b1100_0000_0000)];//注意要扣掉3000
endmodule
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
module IFU(
	input CLK,										//输入时钟信号
	input Reset,									//输入复位信号
	input Stall,									//输入暂停信号
	input [31:0] PCIn,							//输入下一条PC的值
	output [31:0] PCPlus4_F,					//输出当前的PC+4
	output reg [31:0] PCOut = 32'h00003000 //输出当前的PC
	);
	
	assign PCPlus4_F = PCOut + 4;				//PC+4 
	
	always @ (posedge CLK)begin
		if(Reset)									//如果复位则置为0x3000
			PCOut <= 32'h00003000;
		else if(~Stall)							//否则不复位的话，如果不暂停，就更新，暂停就不变
			PCOut <= PCIn;
	end
endmodule
//////////////////////////////////////////////////////////////////////////////////

