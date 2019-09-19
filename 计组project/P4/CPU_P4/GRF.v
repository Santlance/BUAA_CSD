`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:05 11/23/2018 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
	input [4:0] rs,rt,regaddr,									//����Ĵ�����ַ
	input reset,clk,regwrite,										//������λ��ʱ�Ӻ�ʹ���ź�
	input [31:0] regdata,pc_and_4,									//����д������
	output [31:0] regdata1,regdata2 									//�����������
    );
	 reg [31:0] GRF[0:31];									//��ʼ���Ĵ�����
	 
	 assign regdata1 = GRF[rs];									//���ӼĴ���
	 assign regdata2 = GRF[rt];									//���ӼĴ���
	 
	 integer i;
	 initial 
	 begin
		for(i = 0 ; i < 32 ;i = i + 1)					//��ʼ���Ĵ���
			GRF[i] <= 0;
	 end
	
	always @ (posedge clk)									//ʱ�������ع���
	 begin
		if(reset)												//�����λ
		begin
			for(i = 0 ; i < 32 ;i = i + 1)				//ȫ������
			GRF[i] <= 0;
		end
		else if(regwrite)								//�����������λ��д�ź���Ч�ͷ�0�Ŵ洢���Ļ���д������
		begin
		 $display("@%h: $%d <= %h", pc_and_4 - 4, regaddr,regdata);
			GRF[regaddr] <= regaddr == 0? 0 : regdata;
		end
	 end

endmodule
