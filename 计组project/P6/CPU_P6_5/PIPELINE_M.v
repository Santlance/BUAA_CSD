`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:57 12/04/2018 
// Design Name: 
// Module Name:    PIPELINE_M 
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
module PIPELINE_M(
	input CLK,
	input Reset,
	input [31:0] ALUOutput_M,//��ȡ�ڴ�ĵ�ַ
	input [31:0] RTV_M,
	input [31:0] Instr_M,
	input ForwardRTM,
	input [31:0] PCPlus4_M,
	input [31:0] MUXRFWDOut,
	output [31:0] MemOut
	);
	wire [1:0] StoreSel;
	wire MemWrite;
	wire [31:0] MFRTMOut, MemWD;
	
	DM dm(
	.CLK(CLK),
	.Reset(Reset),
	.MemAddr(ALUOutput_M),
	.MemWD(MemWD),
	.MemWrite(MemWrite),
	.PCPlus4_M(PCPlus4_M),  
	
	.MemOut(MemOut)
	);
	
	StoreBE storebe(						//ѡ��STORE�Ķ���
	.MFRTMOut(MFRTMOut),
	.StoreSel(StoreSel),
	
	.MemWD(MemWD)
	);
	
	CONTROLLER_M controller_m(
	.Instr_M(Instr_M),
	
	.StoreSel(StoreSel),
	.MemWrite(MemWrite)
	);
	
	MUX_2_1_32 MFRTM(
	.A(RTV_M),
	.B(MUXRFWDOut),
	.Sel(ForwardRTM),
	
	.C(MFRTMOut)
	);
endmodule
//////////////////////////////////////////////////////////////////////////////////
module DM(
	input CLK,
	input Reset,
	input MemWrite,
	input [31:0] MemAddr,
	input [31:0] MemWD,
	input [31:0] PCPlus4_M,
	output [31:0] MemOut
    );
	reg [31:0] DM[0:4095];
	
	assign MemOut = DM[MemAddr[13:2]];								//�������
	
	integer i;
	initial 													//��ʼ�����ݴ洢��
	begin
		for(i = 0;i < 1024 ;i = i + 1)
			DM[i] <= 0;
	end
	
	always @ (posedge CLK)begin								//��ʱ��������
		if(Reset)begin												//��λ�ź�ȫ����0
			for(i = 0;i < 1024 ;i = i + 1)
				DM[i] <= 0;
		end
		else if(MemWrite)begin										//������������ź���Ч�ʹ���
		$display("%d@%h: *%h <= %h", $time,PCPlus4_M - 4, MemAddr,MemWD);
			DM[MemAddr[11:2]] <= MemWD;
		end
	end

endmodule
//////////////////////////////////////////////////////////////////////////////////
module StoreBE(
	input [31:0] MFRTMOut,
	input [1:0] StoreSel,
	output [31:0] MemWD
	);
	//StoreSel
	//00 sw
	//01 sb
	//10 sh
	assign MemWD = (StoreSel == 2'b00)? MFRTMOut[31:0] :
						(StoreSel == 2'b01)? {{24{1'b0}},{MFRTMOut[7:0]}} :
						(StoreSel == 2'b10)? {{16{1'b0}},{MFRTMOut[15:0]}}:
													MFRTMOut[31:0];

endmodule 