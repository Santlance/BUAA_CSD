`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:05:02 11/24/2018 
// Design Name: 
// Module Name:    MuxALUNum 
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
module MuxALUNum(
	input [31:0] regdata2,out32,							//�����������ͼĴ���ֵ
	input alusrc,												//��������ź�
	output [31:0] aluoprand_b 								//���ALU������
    );
	 

	assign	aluoprand_b = alusrc?out32:regdata2;


endmodule
