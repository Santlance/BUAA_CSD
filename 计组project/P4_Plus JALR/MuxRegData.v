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
	input [31:0] memout_sel,aluoutput_c,pc_and_4,						//����洢��ֵ��ALU��������pc_and_4
	input memtoreg,jal,	ifgtz,ifeqz,												//��������ź�////////////////////////////////
	input [3:0] npc_sel,////////////////////////////////////////
	input jalr,//////////////////////////////////////////////////
	output [31:0] regdata												//�������Ĵ����ѵ�ֵ
    );
	 
	wire link = jal || ((ifgtz || ifeqz)&&(npc_sel == 4'b0111)) || (~ifgtz && ~ifeqz &&(npc_sel == 4'b1000)) || jalr;////////////////////////////
	assign regdata = link?pc_and_4:(memtoreg?memout_sel:aluoutput_c);////////////////////////////////////////
	
endmodule
