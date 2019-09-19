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
	input [31:0] memout,aluoutput_c,pc_and_4,										//输入存储器值和ALU运算结果和pc_and_4
	input memtoreg,jal,																		//输入控制信号
	output [31:0] regdata																//输出输入寄存器堆的值
    );
	 
	
	assign regdata = jal?pc_and_4:(memtoreg?memout:aluoutput_c);
	
endmodule
