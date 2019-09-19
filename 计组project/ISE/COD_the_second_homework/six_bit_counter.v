`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:16:01 11/01/2018 
// Design Name: 
// Module Name:    six_bit_counter 
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
module six_bit_counter(
		input clk,				//����ʱ���ź�
		output reg [2:0] Q,  //����״̬�����
		output reg C			//���ý�λ�����
    );
	 parameter [2:0] cnt0 = 'b010, //����״̬����
						  cnt1 = 'b011,
						  cnt2 = 'b111,
					     cnt3 = 'b110,
						  cnt4 = 'b100,
						  cnt5 = 'b000;
		always @ (posedge clk) begin  //��ʱ��������ִ��
		case(Q) //ѡ���Ӧ״̬��ʵ��״̬ת��
		cnt0:
			Q = cnt1;
		cnt1:
			Q = cnt2;
		cnt2:
			Q = cnt3;
		cnt3:
			Q = cnt4;
		cnt4:
			Q = cnt5;
		cnt5:
			Q = cnt0;
		default:
			Q = cnt0;
		endcase
		if(Q == cnt5) //�ж��Ƿ������λ
			C = 1;
		else
			C = 0;
	 end
endmodule
