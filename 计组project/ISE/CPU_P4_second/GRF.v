`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:05 11/23/2018 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
	input [4:0] rs,rt,regaddr,									//输入寄存器地址
	input reset,clk,regwrite,										//输入置位和时钟和使能信号
	input [31:0] regdata,pc_and_4,									//输入写入数据
	output [31:0] regdata1,regdata2 									//输出读出数据
    );
	 reg [31:0] GRF[0:31];									//初始化寄存器堆
	 
	 assign regdata1 = GRF[rs];									//连接寄存器
	 assign regdata2 = GRF[rt];									//连接寄存器
	 
	 integer i;
	 initial 
	 begin
		for(i = 0 ; i < 32 ;i = i + 1)					//初始化寄存器
			GRF[i] <= 0;
	 end
	
	always @ (posedge clk)									//时钟上升沿工作
	 begin
		if(reset)												//如果复位
		begin
			for(i = 0 ; i < 32 ;i = i + 1)				//全部归零
			GRF[i] <= 0;
		end
		else if(regwrite)								//否则如果不复位，写信号有效和非0号存储器的话则写入数据
		begin
		 $display("@%h: $%d <= %h", pc_and_4 - 4, regaddr,regdata);
			GRF[regaddr] <= regaddr == 0? 0 : regdata;
		end
	 end

endmodule
