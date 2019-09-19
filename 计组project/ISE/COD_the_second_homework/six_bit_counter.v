`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:16:01 11/01/2018 
// Design Name: 
// Module Name:    six_bit_counter 
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
module six_bit_counter(
		input clk,				//设置时钟信号
		output reg [2:0] Q,  //设置状态输出端
		output reg C			//设置进位输出端
    );
	 parameter [2:0] cnt0 = 'b010, //设置状态参数
						  cnt1 = 'b011,
						  cnt2 = 'b111,
					     cnt3 = 'b110,
						  cnt4 = 'b100,
						  cnt5 = 'b000;
		always @ (posedge clk) begin  //于时钟上升沿执行
		case(Q) //选择对应状态来实现状态转移
		cnt0:
			Q = cnt1;
		cnt1:
			Q = cnt2;
		cnt2:
			Q = cnt3;
		cnt3:
			Q = cnt4;
		cnt4:
			Q = cnt5;
		cnt5:
			Q = cnt0;
		default:
			Q = cnt0;
		endcase
		if(Q == cnt5) //判断是否产生进位
			C = 1;
		else
			C = 0;
	 end
endmodule
