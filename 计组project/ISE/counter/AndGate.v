`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:46:57 10/07/2018 
// Design Name: 
// Module Name:    AndGate 
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
module AndGate(a,b,c);//端口设计,在模块括号内说明所有端口的名称
	input a,b;//IO声明，然后对每个端口进行说明
	output c;
	//内部信号声明，类似于C中的局部变量
	reg x;
	
	//功能定义，最重要和最复杂
	assign c = a & b;
	//设计好之后就可以对其进行验证，使用综合功能得到电路图
endmodule
