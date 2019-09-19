`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:16 10/29/2014 
// Design Name: 
// Module Name:    regfiles 
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
module regfiles(
		input clk, 					//寄存器组时钟信号，下降沿写入数据（注意：pc 为上升沿，此为下降沿）
		input rst, 					//reset 信号，reset 有效时全部寄存器置零
		input we, 					//写有效信号，we 有效时寄存器才能被写入	
		input [4:0] raddr1, 		//所需读取的寄存器的地址
		input [4:0] raddr2, 		//所需读取的寄存器的地址
		input [4:0] waddr, 		//写寄存器的地址
		input [31:0] wdata, 		//写寄存器数据
		output [31:0] rdata1, 	//raddr1 所对应寄存器的数据，只要有raddr1 的输入即输出相应数据
		output [31:0] rdata2	//waddr的原始数据
		//input overflow
);

		wire [31:0] decoder_out;
		wire [31:0] regen;
		wire[31:0]  q0,q1,q2,q3,q4,q5,q6,q7,
						q8,q9,q10,q11,q12,q13,q14,q15,
						q16,q17,q18,q19,q20,q21,q22,q23,
						q24,q25,q26,q27,q28,q29,q30,q31;
		
		decoder decode(decoder_out,waddr,we);
		assign regen = decoder_out;
		//decoder decode(decoder_out,waddr);
		//assign regen = (we == 0) ? 32'd0 : decoder_out;
		
		assign q0 = 0;
		//register reg0(q0,data,clk,rst,regen[0]); 
		register reg01(q1, wdata,clk,rst,regen[1]);
		register reg02(q2, wdata,clk,rst,regen[2]);
		register reg03(q3, wdata,clk,rst,regen[3]);
		register reg04(q4, wdata,clk,rst,regen[4]);
		register reg05(q5, wdata,clk,rst,regen[5]);
		register reg06(q6, wdata,clk,rst,regen[6]);
		register reg07(q7, wdata,clk,rst,regen[7]);
		register reg08(q8, wdata,clk,rst,regen[8]);
		register reg09(q9, wdata,clk,rst,regen[9]);
		register reg10(q10,wdata,clk,rst,regen[10]);
		register reg11(q11,wdata,clk,rst,regen[11]);
		register reg12(q12,wdata,clk,rst,regen[12]);
		register reg13(q13,wdata,clk,rst,regen[13]);
		register reg14(q14,wdata,clk,rst,regen[14]);
		register reg15(q15,wdata,clk,rst,regen[15]);
		register reg16(q16,wdata,clk,rst,regen[16]);
		register reg17(q17,wdata,clk,rst,regen[17]);
		register reg18(q18,wdata,clk,rst,regen[18]);
		register reg19(q19,wdata,clk,rst,regen[19]);
		register reg20(q20,wdata,clk,rst,regen[20]);
		register reg21(q21,wdata,clk,rst,regen[21]);
		register reg22(q22,wdata,clk,rst,regen[22]);
		register reg23(q23,wdata,clk,rst,regen[23]);
		register reg24(q24,wdata,clk,rst,regen[24]);
		register reg25(q25,wdata,clk,rst,regen[25]);
		register reg26(q26,wdata,clk,rst,regen[26]);
		register reg27(q27,wdata,clk,rst,regen[27]);
		register reg28(q28,wdata,clk,rst,regen[28]);
		register reg29(q29,wdata,clk,rst,regen[29]);
		register reg30(q30,wdata,clk,rst,regen[30]);
		register reg31(q31,wdata,clk,rst,regen[31]);

		mux_32 mux0(rdata1,q0,q1,q2,q3,q4,q5,q6,q7,
						q8,q9,q10,q11,q12,q13,q14,q15,
						q16,q17,q18,q19,q20,q21,q22,q23,
						q24,q25,q26,q27,q28,q29,q30,q31,
						raddr1);
		mux_32 mux1(rdata2,q0,q1,q2,q3,q4,q5,q6,q7,
						q8,q9,q10,q11,q12,q13,q14,q15,
						q16,q17,q18,q19,q20,q21,q22,q23,
						q24,q25,q26,q27,q28,q29,q30,q31,
						raddr2);
						
endmodule
