`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:55 10/07/2018 
// Design Name: 
// Module Name:    andgate 
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
module andgate(a,b,c);//�˿ڶ��壬������������˿ڵ�����
	//IO������˵���˿������뻹�����
	input a,b;
	output c;
	//�ڲ��������൱��C�еľֲ�����
	reg x;
	//���ܶ��壬������ҪҲ����ӵĲ���
	assign c = a & b;
	//��ƺ�ģ��֮��Ϳ���ʹ���ۺϹ��ܶ��������֤	
	//Ӧ��д�������ۺϵĴ��룡����
endmodule
