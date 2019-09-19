`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:49 11/23/2018 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
	input [15:0] imm16,																			//����������
	input [1:0] extop,																			//�����ź�����
	output [31:0] out32 															//���
    );
	 parameter [1:0] zero_ext = 2'b00 ,sign_ext = 2'b01 ,lui_ext = 2'b10;		//������չ����
	 
	 wire [31:0] zeroext,signext,luiext;
	 
	 assign zeroext = {{16{1'b0}},{imm16[15:0]}};
	 assign signext = {{16{imm16[15]}},{imm16[15:0]}};
	 assign luiext = {{imm16[15:0]},{16{1'b0}}};
	 assign out32 = extop == zero_ext? zeroext :(extop == sign_ext? signext:(extop == lui_ext? luiext:0));
	 

endmodule
