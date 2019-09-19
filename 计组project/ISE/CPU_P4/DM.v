`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:46 11/23/2018 
// Design Name: 
// Module Name:    DM 
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
module DM(
	input [31:0] memaddr,memdata,pc_and_4,								//输入地址信号和数据信号
	input memwrite,clk,reset,									//输入写控制信号和时钟和清零信号
	output [31:0] memout										//输出数据
    );
	reg [31:0] DM[0:1023];
	
	assign memout = DM[memaddr[11:2]];								//连接输出
	
	integer i;
	initial 													//初始化数据存储器
	begin
		for(i = 0;i < 1024 ;i = i + 1)
			DM[i] <= 0;
	end
	
	always @ (posedge clk)								//在时钟上升沿
	begin	
		if(reset)												//复位信号全部置0
		begin
			for(i = 0;i < 1024 ;i = i + 1)
			DM[i] <= 0;
		end
		else if(memwrite)										//否则如果存数信号有效就存数
		begin
		$display("@%h: *%h <= %h",pc_and_4 - 4, memaddr,memdata);//别忘-4
			DM[memaddr[11:2]] <= memdata;
		end
	end

endmodule
