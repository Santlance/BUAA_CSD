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
	output  ifzero 															//�������
    );
	 parameter [3:0] ADDU = 4'b0000 ,SUBU = 4'b0001 , ORI = 4'b0010;   	//�����������
	 wire [31:0] addu,subu,ori;
	 
	 assign ifzero = aluoprand_a - aluoprand_b == 0? 1 : 0;
	 assign addu = aluoprand_a + aluoprand_b;
	 assign subu = aluoprand_a - aluoprand_b;
	 assign ori = aluoprand_a | aluoprand_b;
	 
	 assign aluoutput_c = aluctr == ADDU? addu:(aluctr == SUBU? subu:(aluctr == ORI? ori : 0));
	 
	 

endmodule
