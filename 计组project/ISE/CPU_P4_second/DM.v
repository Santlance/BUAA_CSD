`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:46 11/23/2018 
// Design Name: 
// Module Name:    DM 
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
module DM(
	input [31:0] memaddr,memdata,pc_and_4,								//�����ַ�źź������ź�
	input memwrite,clk,reset,									//����д�����źź�ʱ�Ӻ������ź�
	output [31:0] memout										//�������
    );
	reg [31:0] DM[0:1023];
	
	assign memout = DM[memaddr[11:2]];								//�������
	
	integer i;
	initial 													//��ʼ�����ݴ洢��
	begin
		for(i = 0;i < 1024 ;i = i + 1)
			DM[i] <= 0;
	end
	
	always @ (posedge clk)								//��ʱ��������
	begin	
		if(reset)												//��λ�ź�ȫ����0
		begin
			for(i = 0;i < 1024 ;i = i + 1)
			DM[i] <= 0;
		end
		else if(memwrite)										//������������ź���Ч�ʹ���
		begin
		$display("@%h: *%h <= %h",pc_and_4 - 4, memaddr,memdata);//����-4
			DM[memaddr[11:2]] <= memdata;
		end
	end

endmodule
