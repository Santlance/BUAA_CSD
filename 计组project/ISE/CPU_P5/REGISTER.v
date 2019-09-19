`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:18 12/04/2018 
// Design Name: 
// Module Name:    REGISTER 
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
module REGISTER_D(
	input [31:0] Instr_F,									//����F����ָ��
	input [31:0] PCPlus4_F,									//����F����PC+4
	input CLK,													//ʱ���ź�
	input Stall,												//��ͣ�ź�
	input Reset,												//��λ�ź�
	output reg [31:0]  Instr_D = 0,						//�����һ��D����ָ��
	output reg [31:0] PCPlus4_D = 0						//�����һ��D����PC+4
    );
	always @(posedge CLK)begin
		if(Reset)begin											//����Ǹ�λ�ź�
			Instr_D <= 0;										//ָ������
			PCPlus4_D <= 0;									//PC+4����
		end
		else if(~Stall)begin									//������Ǹ�λ�ź�
			Instr_D <= Instr_F;								//����ָ��
			PCPlus4_D <= PCPlus4_F;							//����PC+4
		end
	end

endmodule
//////////////////////////////////////////////////////////////////////////////////
module REGISTER_E(
	input ifbgez,/*********/
	output reg ifbgez_E = 0,/***********/
	input CLK,													//ʱ���ź�
	input Reset,												//��λ�ź�
	input FlushE,												//�����źţ�ʵ����������Stall
	input [31:0] Instr_D,									//����D����ָ��
	input [31:0] PCPlus4_D,									//����D����PC+4
	input [31:0] RSV_D,										//����D���Ĳ�����1
	input [31:0] RTV_D,										//����D���Ĳ�����2
	input [31:0] EXTOut_D,									//����D����
	input RegWrite_D,
	input [4:0] RS_D,
	input [4:0] RT_D,											//Ӧ����D���Ͳ���
	input [4:0] RD_D,
	output reg [31:0] Instr_E = 0,
	output reg [31:0] PCPlus4_E = 0,
	output reg [31:0] RSV_E = 0,
	output reg [31:0] RTV_E = 0,
	output reg [31:0] EXTOut_E = 0,
	output reg RegWrite_E = 0,
	output reg [4:0] RS_E = 0,
	output reg [4:0] RT_E = 0,
	output reg [4:0] RD_E = 0
    );
	always @(posedge CLK)begin
		if(Reset || FlushE)begin
			Instr_E <= 0;
			PCPlus4_E <= 0;
			RSV_E <= 0;
			RTV_E <= 0;
			EXTOut_E <= 0;
			RegWrite_E <= 0;
			RS_E <= 0;
			RT_E <= 0;
			RD_E <= 0;
			ifbgez_E <= 0;
		end
		else begin
			Instr_E <= Instr_D;
			PCPlus4_E <= PCPlus4_D;
			RSV_E <= RSV_D;
			RTV_E <= RTV_D;
			EXTOut_E <= EXTOut_D;
			RegWrite_E <= RegWrite_D;
			RS_E <= RS_D;
			RT_E <= RT_D;
			RD_E <= RD_D;
			ifbgez_E <= ifbgez;
		end
	end

endmodule
//////////////////////////////////////////////////////////////////////////////////
module REGISTER_M(
	input CLK,
	input Reset,
	input [31:0] Instr_E,
	input [31:0] RTV_E,
	input [31:0] PCPlus4_E,
	input [31:0] ALUOutput_E,
	input RegWrite_E,
	input [4:0] WriteRd_E,
	output reg RegWrite_M = 0,
	output reg [31:0] Instr_M = 0,
	output reg [31:0] RTV_M = 0,
	output reg [31:0] PCPlus4_M = 0,
	output reg [31:0] ALUOutput_M = 0,
	output reg [4:0] RD_M = 0
    );
	always @(posedge CLK)begin
		if(Reset)begin
			RegWrite_M <= 0;
			Instr_M <= 0;
			RTV_M <= 0;
			PCPlus4_M <= 0;
			ALUOutput_M <= 0;
			RD_M <= 0;
		end
		else begin
			RegWrite_M <= RegWrite_E;
			Instr_M <= Instr_E;
			RTV_M <= RTV_E;
			PCPlus4_M <= PCPlus4_E;
			ALUOutput_M <= ALUOutput_E;
			RD_M <= WriteRd_E;
		end
	end

endmodule
//////////////////////////////////////////////////////////////////////////////////
module REGISTER_W(
	input CLK,
	input Reset,
	input [31:0] Instr_M,
	input [31:0] PCPlus4_M,
	input [31:0] ALUOutput_M,
	input [31:0] ReadData_M,
	input [4:0] RD_M,
	input RegWrite_M,
	output reg [31:0] Instr_W = 0,
	output reg [31:0] PCPlus4_W = 0,
	output reg [31:0] ALUOutput_W = 0,
	output reg [31:0] ReadData_W = 0,
	output reg [4:0] RD_W = 0,
	output reg RegWrite_W = 0
    );
	always @(posedge CLK)begin
		if(Reset)begin
			Instr_W <= 0;
			PCPlus4_W <= 0;
			ALUOutput_W <= 0;
			ReadData_W <= 0;
			RD_W <= 0;
		end
		else begin
			Instr_W <= Instr_M;
			RegWrite_W <= RegWrite_M; 
			PCPlus4_W <= PCPlus4_M;
			ALUOutput_W <= ALUOutput_M;
			ReadData_W <= ReadData_M;
			RD_W <= RD_M;
		end
	end

endmodule
