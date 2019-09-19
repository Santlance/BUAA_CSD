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
	input CLK,								//����ʱ���ź�
	input Reset,							//���븴λ�ź�
	input RegWrite_W,						//��������W���Ĵ�����д�ź�
	input [4:0] RD_W,						//��������W���Ĵ�����д��ַ
	input [31:0] Instr_D,				//��������D���Ĵ�����ָ��
	input [31:0] MUXRFWDOut,			//��������W��������д����
	input [31:0] PCPlus4_D,				//��������D���Ĵ�����PC+4
	input [31:0] ALUOutput_M,			//��������M���Ĵ�����ALUOutput
	input [1:0] ForwardRSD,				//�������Գ�ͻ��Ԫ��RSDת���ź�
	input [1:0] ForwardRTD,				//�������Գ�ͻ��Ԫ��RTDת���ź�
	input [31:0] PCPlus4_W,				//��������W���Ĵ�����PC+4
	output [31:0] EXTOut,				//�����������չ���
	output [31:0] NPCOut,				//���NPCOut
	output PCSel,							//���PCѡ���ź�
	output RegWrite_D,					//���D��ָ���д�ź�
	output [31:0] RSV_D,					//������Ĵ�������1
	output [31:0] RTV_D					//������Ĵ�������2
	);
	
	wire [1:0] CMPOut ,NPCSel;
	wire [3:0] EXTSel;
	wire [31:0] GRF_RD1, GRF_RD2, MFRSDOut, MFRTDOut;
	assign RSV_D = MFRSDOut;			//����E���Ĵ�����ֵӦ���Ǿ���ת��ѡ���Ķ���
	assign RTV_D = MFRTDOut;			//
	
	GRF grf(
	.CLK(CLK),
	.Reset(Reset),
	.RegWrite(RegWrite_W),
	.GRF_Rs(Instr_D[25:21]),
	.GRF_Rt(Instr_D[20:16]),
	.GRF_Rd(RD_W),
	.GRF_WD(MUXRFWDOut),				  //д��������Ǿ���ѡ��֮���
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
	.GRF_RD1(MFRSDOut),					//���JR��Ӧ������ת��
	.Instr_D(Instr_D),					//����ָ�����J B���͵�ƫ��
	.PCPlus4_D(PCPlus4_D),
	.NPCSel(NPCSel),
	
	.NPCOut(NPCOut)
	);
	
	CMP cmp(
	.CMPD1(MFRSDOut),
	.CMPD2(MFRTDOut),
	
	.CMPOut(CMPOut)
	);
	
	CONTROLLER_D controller_d(
	.Instr_D(Instr_D),
	.CMPOut(CMPOut),
	
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
		$display("%d@%h: $%d <= %h", $time, PCPlus4_W - 4, GRF_Rd,GRF_Rd == 0 ? 0 : GRF_WD);
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
	
	wire [31:0] zero_ext, sign_ext, lui_ext;
	assign zero_ext = {{16{1'b0}},{Imm16[15:0]}};
	assign sign_ext = {{16{Imm16[15]}},{Imm16[15:0]}};
	assign lui_ext = {{Imm16[15:0]},{16{1'b0}}};
	
	assign EXTOut = (EXTSel == 4'b0000)? zero_ext :
							(EXTSel == 4'b0001)? sign_ext :
							(EXTSel == 4'b0010)? lui_ext  :
														0       ;
	
endmodule
//////////////////////////////////////////////////////////////////////////////////
module NPC(                                                       //JALע������PC+8�������������Ļ�����PC+4
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
	output [1:0] CMPOut
	);
	assign CMPOut = (CMPD1 == CMPD2)? 2'b00 :
						 ($signed(CMPD1) > $signed(CMPD2))?  2'b01 ://ע�����з���
						 ($signed(CMPD1) < $signed(CMPD2))?  2'b10 :
												 2'b00 ;//!!!!!!!
endmodule
//////////////////////////////////////////////////////////////////////////////////

