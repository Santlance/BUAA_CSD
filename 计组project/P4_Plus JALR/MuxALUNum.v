`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:05:02 11/24/2018 
// Design Name: 
// Module Name:    MuxALUNum 
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
module MuxALUNum(
	input [31:0] regdata2,out32,							//输入立即数和寄存器值
	input alusrc,												//输入控制信号
	output [31:0] aluoprand_b 								//输出ALU操作数
    );
	 

	assign	aluoprand_b = alusrc?out32:regdata2;


endmodule
