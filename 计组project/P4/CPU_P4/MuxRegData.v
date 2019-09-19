`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:32 11/24/2018 
// Design Name: 
// Module Name:    MuxRegData 
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
module MuxRegData(
	input [31:0] memout,aluoutput_c,pc_and_4,										//����洢��ֵ��ALU��������pc_and_4
	input memtoreg,jal,																		//��������ź�
	output [31:0] regdata																//�������Ĵ����ѵ�ֵ
    );
	 
	
	assign regdata = jal?pc_and_4:(memtoreg?memout:aluoutput_c);
	
endmodule
