`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:36 11/23/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input [3:0] aluctr,																//�����ź�����
	input [31:0] aluoprand_a,aluoprand_b,																	//����������
	output  [31:0] aluoutput_c ,														//������
	output  ifzero,ifgtz,ifeqz												//�������
    );
	 parameter [3:0] ADDU = 4'b0000 ,SUBU = 4'b0001 , ORI = 4'b0010, SRLV = 4'b0011;   	//�����������/////////////////////////
	 wire [31:0] addu,subu,ori,srlv;////////////////////////////////////
	 wire [63:0] srlv_mid;////////////////////////////////
	
	 //����bgtz bgez blez bltz
	 assign ifeqz = aluoprand_a == 0? 1 : 0; //���������Ƿ����0��������+signed
	 assign ifgtz = $signed(aluoprand_a) > 0? 1 : 0; //�жϵ��������Ƿ������
	 //
	 assign ifzero = aluoprand_a - aluoprand_b == 0? 1 : 0; //����beq bne
	 assign addu = aluoprand_a + aluoprand_b;
	 assign subu = aluoprand_a - aluoprand_b;
	 assign ori = aluoprand_a | aluoprand_b;
	 assign srlv_mid = {{aluoprand_b[31:0]},{32{1'b0}}} >> aluoprand_a;/////////////////////////////
	 assign srlv = srlv_mid[31:0] | srlv_mid[63:32];///////////////////////////////////////////////////��ʱ�ĳ�rotrv����
	 
	 assign aluoutput_c = aluctr == SRLV? srlv:((aluctr == ADDU)? addu:(aluctr == SUBU? subu:(aluctr == ORI? ori : 0)));//////////////////////////////
	 ///////BUG �ټ���һ���ж�����
	 ////////////////////////�ǵ�����ʱ�������
		////��Ȼ�ǣ�a&a-1�� == 0�ټ����жϷ��ţ�����
endmodule
