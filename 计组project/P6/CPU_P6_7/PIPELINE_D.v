`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:29:16 12/04/2018 
// Design Name: 
// Module Name:    PIPELINE_D 
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

module PIPELINE_D(
	input CLK,								//输入时钟信号
	input Reset,							//输入复位信号
	input RegWrite_W,						//输入来自W级寄存器的写信号
	input [4:0] RD_W,						//输入来自W级寄存器的写地址
	input [31:0] Instr_D,				//输入来自D级寄存器的指令
	input [31:0] MUXRFWDOut,			//输入来自W级部件的写数据
	input [31:0] PCPlus4_D,				//输入来自D级寄存器的PC+4
	input [31:0] ALUOutput_M,			//输入来自M级寄存器的ALUOutput
	input [1:0] ForwardRSD,				//输入来自冲突单元的RSD转发信号
	input [1:0] ForwardRTD,				//输入来自冲突单元的RTD转发信号
	input [31:0] PCPlus4_W,				//输入来自W级寄存器的PC+4
	output [31:0] EXTOut,				//输出立即数扩展结果
	output [31:0] NPCOut,				//输出NPCOut
	output PCSel,							//输出PC选择信号
	output RegWrite_D,					//输出D级指令的写信号
	output [31:0] RSV_D,					//输出读寄存器数据1
	output [31:0] RTV_D					//输出读寄存器数据2
	);
	wire CMPOut;
	wire [1:0] NPCSel,CMPZeroOut;
	wire [3:0] EXTSel;
	wire [31:0] GRF_RD1, GRF_RD2, MFRSDOut, MFRTDOut;
	assign RSV_D = MFRSDOut;			//传到E级寄存器的值应该是经过转发选择后的东西
	assign RTV_D = MFRTDOut;			//
	
	GRF grf(
	.CLK(CLK),
	.Reset(Reset),
	.RegWrite(RegWrite_W),
	.GRF_Rs(Instr_D[25:21]),
	.GRF_Rt(Instr_D[20:16]),
	.GRF_Rd(RD_W),
	.GRF_WD(MUXRFWDOut),				  //写入的数据是经过选择之后的
	.PCPlus4_W(PCPlus4_W),
	
	.GRF_RD1(GRF_RD1),
	.GRF_RD2(GRF_RD2)
	);
	
	EXT ext(
	.Imm16(Instr_D[15:0]),
	.EXTSel(EXTSel),
	
	.EXTOut(EXTOut)
	);
	
	NPC npc(
	.GRF_RD1(MFRSDOut),					//解决JR，应该连的转发
	.Instr_D(Instr_D),					//输入指令，计算J B类型的偏移
	.PCPlus4_D(PCPlus4_D),
	.NPCSel(NPCSel),
	
	.NPCOut(NPCOut)
	);
	
	CMP cmp(
	.CMPD1(MFRSDOut),
	.CMPD2(MFRTDOut),
	
	.CMPZeroOut(CMPZeroOut),
	.CMPOut(CMPOut)
	);
	
	CONTROLLER_D controller_d(
	.Instr_D(Instr_D),
	.CMPOut(CMPOut),
	.CMPZeroOut(CMPZeroOut),
	
	.NPCSel(NPCSel),
	.EXTSel(EXTSel),
	.RegWrite_D(RegWrite_D),
	.PCSel(PCSel)
	);
	
	MUX_4_1_32 MFRSD(			
	.A(GRF_RD1),
	.B(MUXRFWDOut),
	.C(ALUOutput_M),
	.D(32'h00000000),
	.Sel(ForwardRSD),
	
	.E(MFRSDOut)
	);
	
	MUX_4_1_32 MFRTD(
	.A(GRF_RD2),
	.B(MUXRFWDOut),
	.C(ALUOutput_M),
	.D(32'h00000000),
	.Sel(ForwardRTD),
	
	.E(MFRTDOut)
	);

endmodule
//////////////////////////////////////////////////////////////////////////////////
module GRF(
	input CLK,
	input Reset,
	input RegWrite,
	input [4:0] GRF_Rs,
	input [4:0] GRF_Rt,
	input [4:0] GRF_Rd,
	input [31:0] GRF_WD,
	input [31:0] PCPlus4_W,
	output [31:0] GRF_RD1,
	output [31:0] GRF_RD2
    );
	reg [31:0] GRF[0:31];
	
	integer i;
	initial begin
		for(i = 0;i < 32 ; i = i + 1)
			GRF[i] <= 0;
	end
	
	assign GRF_RD1 = GRF[GRF_Rs];
	assign GRF_RD2 = GRF[GRF_Rt];
	
	always @ (posedge CLK)begin
		if(Reset)begin
			for(i = 0;i < 32 ; i = i + 1)
				GRF[i] <= 0;
		end
		else if (RegWrite)begin
		if(GRF_Rd)
		$display("%d@%h: $%d <= %h", $time, PCPlus4_W - 4, GRF_Rd, GRF_WD);
			GRF[GRF_Rd] <= GRF_Rd == 0 ? 0 : GRF_WD;
		end
	end
	
endmodule
//////////////////////////////////////////////////////////////////////////////////
module EXT(
	input [15:0] Imm16,
	input [3:0] EXTSel,
	output [31:0] EXTOut
	);
	//EXTSel
	//4'b0000 0 零扩展：
	//4'b0001 1 符号扩展：
	//4'b0010 2 lui扩展：
	//4'b0011 3 移位扩展：
	
	wire [31:0] zero_ext, sign_ext, lui_ext, shift_ext;
	assign zero_ext = {{16{1'b0}},{Imm16[15:0]}};
	assign sign_ext = {{16{Imm16[15]}},{Imm16[15:0]}};
	assign lui_ext = {{Imm16[15:0]},{16{1'b0}}};
	assign shift_ext = {{27{1'b0}},{Imm16[10:6]}};
	
	
	assign EXTOut = (EXTSel == 4'b0000)? zero_ext :
							(EXTSel == 4'b0001)? sign_ext :
							(EXTSel == 4'b0010)? lui_ext  :
							(EXTSel == 4'b0011)? shift_ext:
														0       ;
	
endmodule
//////////////////////////////////////////////////////////////////////////////////
module NPC(                                                       //JAL注意存的是PC+8？？？但是跳的话还是PC+4
	input [31:0] Instr_D,
	input [31:0] GRF_RD1,
	input [31:0] PCPlus4_D,
	input [1:0] NPCSel,
	output [31:0] NPCOut
	);
	
	wire [31:0] B_index, J_index, B_offset_ext;
	wire [25:0] J_offset;
	wire [15:0] B_offset;
	
	assign J_offset = Instr_D[25:0];
	assign B_offset = Instr_D[15:0];
	
	assign B_offset_ext = {{14{B_offset[15]}},{B_offset[15:0]},{2'b00}};  
	
	assign B_index = PCPlus4_D + B_offset_ext;
	assign J_index = {{PCPlus4_D[31:28]},{J_offset[25:0]},{2'b00}};
	
	assign NPCOut = (NPCSel == 2'b00)? B_index:
						 (NPCSel == 2'b01)? J_index:
						 (NPCSel == 2'b10)? GRF_RD1:
											32'h00003000;//!!!!!!!!
	
endmodule
//////////////////////////////////////////////////////////////////////////////////
module CMP(
	input [31:0] CMPD1,
	input [31:0] CMPD2,
	output [1:0] CMPZeroOut,
	output  CMPOut
	);
	wire ifeqz,ifgtz;
	assign ifeqz = ($signed(CMPD1) == 0)? 1 : 0 ;
	assign ifgtz = ($signed(CMPD1) > 0 )? 1 : 0 ;
	assign CMPZeroOut = {{ifeqz},{ifgtz}};
	// 00 bltz
	// 01 bgtz
	// 10 blez
	// 11 bgez
	
	assign CMPOut = (CMPD1 == CMPD2)? 1 : 0;
						 //($signed(CMPD1) > $signed(CMPD2))?  2'b01 ://注意是有符号
						 //($signed(CMPD1) < $signed(CMPD2))?  2'b10 :
												 //2'b00 ;//!!!!!!!
endmodule
//////////////////////////////////////////////////////////////////////////////////

