`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:03 10/27/2014 
// Design Name: 
// Module Name:    ext 
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
module ext #(parameter WIDTH = 16)(
		input [WIDTH - 1:0] a,		//输入数据，数据宽度可以根据需要自行定义
		input sext, 					//sext 有效为符号扩展，否则0 扩展				
		output [31:0] b				//32 位输出数据
);
		reg [31:0] temp;
		assign b = temp;
		integer i,j; 
		always @ (sext or a)
		begin
				if (sext == 0) 	
				begin
						temp = a;
						for (i = WIDTH; i < 32; i = i + 1)
								temp[i] = 0; 
				end
				else
				begin	
						temp = a;
						if (a[WIDTH - 1] == 0)
								for (i = WIDTH; i < 32; i = i + 1)
										temp[i] = 0;
						else
								for (i = WIDTH; i < 32; i = i + 1)
										temp[i] = 1;
				end
		end
		
endmodule
