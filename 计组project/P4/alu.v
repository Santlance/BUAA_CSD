`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:43 11/09/2014 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revisi	on 0.01 - File Created
// Additional Comments: 
//
/////////////////////////////////////////////////////////////////////////////////
module alu(
		input [31:0] a, // 32 Î»ÊäÈë£¬²Ù×÷Êý1
		input [31:0] b, // 32 Î»ÊäÈë£¬²Ù×÷Êý2
		input [3:0] aluc, // 4 Î»ÊäÈë£¬¿ØÖÆalu µÄ²Ù×÷
		output[31:0] r, // 32 Î»Êä³ö£¬ÓÐa b ¾­¹ýaluc Ö¸¶¨µÄ²Ù×÷Éú³É
		output zero, // 0 ±êÖ¾Î»
		output carry, // ½øÎ»±êÖ¾Î»
		output negative, // ¸ºÊý±êÖ¾Î»
		output overflow
);
		wire [35:0] temp [3:0];
		wire [35:0] temp1 [1:0]; 
		wire [35:0] ans;
		
		lui lui0(a,b,        temp1[0][31:0],temp1[0][35],temp1[0][34],temp1[0][33],temp1[0][32]);
		slt slt0(a,b,aluc[0],temp1[1][31:0],temp1[1][35],temp1[1][34],temp1[1][33],temp1[1][32]);
		
		addsub32 tmp0(a,b,aluc[1:0],temp[0][31:0],temp[0][35],temp[0][34],temp[0][33],temp[0][32]);
		logicx   tmp1(a,b,aluc[1:0],temp[1][31:0],temp[1][35],temp[1][34],temp[1][33],temp[1][32]);
		mux_2 #(36)	tmp2(temp1[0],temp1[1],aluc[1],temp[2]);
		barrelshifter32 tmp3(a,b,aluc[1:0],temp[3][31:0],temp[3][35],temp[3][34],temp[3][33],temp[3][32]);
		
		mux_4 #(36)   mux0(temp[0],temp[1],temp[2],temp[3],aluc[3:2],ans);
		
		reg [31:0] temp_r; 
		reg temp_zero;
		reg temp_carry;
		reg temp_negative; 
		reg temp_overflow;
		 
		assign r=temp_r;
		assign zero=temp_zero;
		assign carry=temp_carry;
		assign negative=temp_negative;
		assign overflow=temp_overflow;

		always @ (*)
		begin 
				temp_r=ans[31:0];
				temp_zero=ans[35];
				temp_carry=ans[34];
				temp_negative=ans[33];
				temp_overflow=ans[32];
		end
		
endmodule
