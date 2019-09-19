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
		output reg [3:0] 	Q = 0,	//�������Q������Ϊ�Ĵ�������
		input clock,
		input clear
    );
	 always @ (posedge clear or negedge clock)begin
		if(clear)
			Q <= 4'b0;	//Ϊ�����������紥����һ���ʱ���߼�������ʹ�÷�������ֵ
		else begin
			Q <= Q + 1;	//Q��һ����λ�Ĵ�������������15�����㣬���ģ16û�б�Ҫ
		end
	 end
endmodule
