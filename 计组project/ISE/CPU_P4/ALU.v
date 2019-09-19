`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:36 11/23/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input [3:0] aluctr,																//控制信号输入
	input [31:0] aluoprand_a,aluoprand_b,																	//操作数输入
	output  [31:0] aluoutput_c ,														//结果输出
	output  ifzero,ifgtz,ifeqz												//零标记输出
    );
	 parameter [3:0] ADDU = 4'b0000 ,SUBU = 4'b0001 , ORI = 4'b0010, SRLV = 4'b0011;   	//定义运算参数/////////////////////////
	 wire [31:0] addu,subu,ori,srlv;////////////////////////////////////
	 wire [63:0] srlv_mid;////////////////////////////////
	
	 //留给bgtz bgez blez bltz
	 assign ifeqz = aluoprand_a == 0? 1 : 0; //单操作数是否等于0，别忘记+signed
	 assign ifgtz = $signed(aluoprand_a) > 0? 1 : 0; //判断单操作数是否大于零
	 //
	 assign ifzero = aluoprand_a - aluoprand_b == 0? 1 : 0; //留给beq bne
	 assign addu = aluoprand_a + aluoprand_b;
	 assign subu = aluoprand_a - aluoprand_b;
	 assign ori = aluoprand_a | aluoprand_b;
	 assign srlv_mid = {{aluoprand_b[31:0]},{32{1'b0}}} >> aluoprand_a;/////////////////////////////
	 assign srlv = srlv_mid[31:0] | srlv_mid[63:32];///////////////////////////////////////////////////到时改成rotrv即可
	 
	 assign aluoutput_c = aluctr == SRLV? srlv:((aluctr == ADDU)? addu:(aluctr == SUBU? subu:(aluctr == ORI? ori : 0)));//////////////////////////////
	 ///////BUG 少加了一个判断条件
	 ////////////////////////记得运算时多加括号
		////果然是（a&a-1） == 0少加了判断符号！！！
endmodule
