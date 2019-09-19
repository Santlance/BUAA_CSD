`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:32:16 10/29/2018 
// Design Name: 
// Module Name:    four_bit_counter_p73 
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
module four_bit_counter_p73(
		output reg [3:0] 	Q = 0,	//输出变量Q被定义为寄存器类型
		input clock,
		input clear
    );
	 always @ (posedge clear or negedge clock)begin
		if(clear)
			Q <= 4'b0;	//为了能生成诸如触发器一类的时序逻辑，建议使用非阻塞赋值
		else begin
			Q <= Q + 1;	//Q是一个四位寄存器，计数超过15后会归零，因此模16没有必要
		end
	 end
endmodule
