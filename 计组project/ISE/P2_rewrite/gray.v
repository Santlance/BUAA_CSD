`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:24:38 11/08/2018 
// Design Name: 
// Module Name:    gray 
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
module gray(
		input Clk,
		input Reset,
		input En,
		output reg [2:0] Output,
		output reg Overflow
    );
	 reg [2:0] Binary;
	 
	 initial begin
		Output <= 0;
		Overflow <= 0;
		Binary <= 0;
	 end
	 
	 always @ (posedge Clk)begin
			if(Reset)begin
				Output <= 0;
				Overflow <= 0;
				Binary <= 0;
			end
			
			else begin
				if(En)begin
					if(Binary == 3'b111)begin   //先判断是否发生溢出
						Binary <= 0;
						Output <= 0;
						Overflow <= 1;
					end
					else begin
						Binary = Binary + 1; //为什么这里取阻塞赋值呢，因为当这个else开始时，无论是二进制还是格雷码计数器都应该是+1的了，而格雷码从公式上看依赖于二进制的加1，所以用阻塞式赋值传递给下面
						Output <= (Binary >> 1)^Binary;
					end
				end
			end
	 end

endmodule
