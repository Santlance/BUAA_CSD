`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:41 10/29/2018 
// Design Name: 
// Module Name:    four_bit_selector_p72 
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
module four_bit_selector_p72(
		output reg out, //��output���ó�reg������˿ڱ�����Ϊ�Ĵ������ͱ���
		input i0,i1,i2,i3,
		input s0,s1
    );
	 //�������źŸı䣬�����¼�������ź�out
	 //�������ź�out���¼�������������źű���д��always @(��)�ĵ�ƽ�����б�
	 always @ (s1 or s0 or i0 or i1 or i2 or i3)begin
		case({s1,s0})
			2'b00:
				out <= i0;
			2'b01:
				out <= i1;
			2'b10:
				out <= i2;
			2'b11:
				out <= i3;
			default:
				out <= 0;
		endcase
	 end
endmodule
