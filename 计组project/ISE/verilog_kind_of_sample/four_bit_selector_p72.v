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
		output reg out, //将output设置成reg，输出端口被声明为寄存器类型变量
		input i0,i1,i2,i3,
		input s0,s1
    );
	 //若输入信号改变，则重新计算输出信号out
	 //造成输出信号out重新计算的所有输入信号必须写入always @(…)的电平敏感列表
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
