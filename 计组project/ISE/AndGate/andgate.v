`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:55 10/07/2018 
// Design Name: 
// Module Name:    andgate 
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
module andgate(a,b,c);//端口定义，在括号内填入端口的名称
	//IO声明，说明端口是输入还是输出
	input a,b;
	output c;
	//内部声明，相当于C中的局部变量
	reg x;
	//功能定义，是最重要也是最复杂的部分
	assign c = a & b;
	//设计好模块之后就可以使用综合功能对其进行验证	
	//应该写出可以综合的代码！！！
endmodule
