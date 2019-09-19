`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:26 11/23/2018 
// Design Name: 
// Module Name:    IFU 
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
module IFU(
	input jr,jump,npc_sel,ifzero,reset,clk,      			//�ź�����
	input [31:0] ra_addr,
	output [31:0] instr ,pc_and_4 								//�ź����
    );
	
	 reg [31:0] IM[0:1023],PC = 32'h00003000;					//����IM��PC��ע��IM��32bit��1024��
	 wire [31:0] pc_and_four, pc_and_four_and_shamft, shamft_ext, jump_index;
	 wire [25:0] instr_index;
	 wire [15:0] shamft;
	 wire branch;
	 
	 
	 assign pc_and_four = PC + 4;//����PC+4
	 assign instr_index = IM[PC[11:2]][25:0];//���ӵ�ַλ��
	 assign shamft = IM[PC[11:2]][15:0];//���ӵ�ַƫ����
	 assign shamft_ext = {{14{shamft[15]}},{shamft[15:0]},{2'b00}};//��չ��ַƫ����
	 assign pc_and_four_and_shamft = pc_and_four + shamft_ext;//�ó�ƫ�ƺ�ĵ�ַ
	 assign branch = ifzero && npc_sel;//�Ƿ��֧
	 assign jump_index = {pc_and_4[31:28],instr_index[25:0],2'b00};
	 
	 assign pc_and_4 = pc_and_four;								//����PC+4
	 assign instr = IM[PC[11:2]];									//����Instr
	 
	 
	 initial
	 begin
	 $readmemh("code.txt",IM);	
	 end
	 
	 always @(posedge clk)											//ʱ������ʱ,���PC
	 begin
		if(reset)														//ͬ����λ
		begin
			PC <= 32'h00003000;
		end
		else																//����λ
		begin
		//$display("%h %h\n",PC,IM[PC[11:2]]);
			PC <= jr? ra_addr : (jump? jump_index : (branch? pc_and_four_and_shamft : pc_and_four));
		end
	 end

endmodule
