`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:26 10/07/2018 
// Design Name: 
// Module Name:    sample 
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

//可以粗略的将模块功能分为三个部分，描述组合逻辑的、描述时序逻辑的、以及对其他模块的引用
//描述组合逻辑是使用连续赋值语句assign,assign语句也叫数据流描述语句，通过组合逻辑部分对wire型变量进行连续赋值，也就是指定这段导线输入的数据内容
//assign 语句左边是一个wire型变量，右边是一个组合逻辑的表达式，通过组合逻辑将各个信号组合起来，再将得到的结果赋给右边
//输入输出数据不特殊声明的话，系统默认是wire型
//verilog中的两种数据类型，wire 和 reg
module sample(input clk);
	
	wire a;//对应电路图中的导线，一端输入信号，一端输出信号，本身并不能存储数据
	reg b;//reg是寄存器类型，对应电路中的寄存器，可以在其中存储数据
	//assign signal = expression;
	
	//时序逻辑部分，描述时序逻辑部分需要过程块，包括initial和always块
	
	//initial块主要用来在程序开始时初始化变量，或产生激励波形作为仿真测试信号
	//注意这里的begin end是块的标志，相当于C中的大括号
	initial begin
	b = 0;
	end
	
	//always块主要是在仿真过程中不断检测条件，当满足条件时，会开始执行块内的代码，而在实验中通常是检测电位变化
	//当列表中有多个条件时，满足任意一个都会出发always块，如果不指明posedge和negede,信号的任何变化都会触发，如果写成@*对任何变量的变化都会触发
	always @(posedge clk)begin
	b=~b;
	end
	//另一种写法,在周期变化中
	always #5 b=~b;//这里的#5代表在每五个时间单位后触发条件
	
	
	//最后一个模块是引用其他模块，就如一个电路中还包含其他子电路
	wire x,y,z;
	//要指明模块名,相当于一个类型，类似一种数组类型和变量名，然后还要起实例名,注意顶层模块不会再别的模块中实例化
	AndGate and1(x.y,z);//位置映射一一对应
	AndGate and2(.b(x),.c(z));//名映射，用.声明端口之间的连接，此时声明顺序任意，格式为  .端口名（信号名）,推荐使用！
	
	
endmodule
