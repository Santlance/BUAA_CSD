`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:58:48 11/24/2018 
// Design Name: 
// Module Name:    MuxRegRd 
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
module MuxRegRd(
	input [4:0] rt,rd,								//输入寄存器地址
	input regdst,jal,									//输入控制信号
	output  [4:0] regaddr            			//输出寄存器地址
    ); 
		assign regaddr = jal?32'h0000001f:(regdst?rd:rt);
endmodule
