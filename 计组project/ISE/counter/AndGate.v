`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:46:57 10/07/2018 
// Design Name: 
// Module Name:    AndGate 
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
module AndGate(a,b,c);//�˿����,��ģ��������˵�����ж˿ڵ�����
	input a,b;//IO������Ȼ���ÿ���˿ڽ���˵��
	output c;
	//�ڲ��ź�������������C�еľֲ�����
	reg x;
	
	//���ܶ��壬����Ҫ�����
	assign c = a & b;
	//��ƺ�֮��Ϳ��Զ��������֤��ʹ���ۺϹ��ܵõ���·ͼ
endmodule
