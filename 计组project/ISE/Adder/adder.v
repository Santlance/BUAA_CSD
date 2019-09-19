`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:57:09 10/08/2018 
// Design Name: 
// Module Name:    adder 
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
module adder(
	input [3:0] A,
	input [3:0] B,
	input Clk,
	input En,
	output [3:0] Sum,
	output Overflow
    );
	
	reg [3:0] a;
	reg [3:0] b;
	reg [3:0] c;
	reg [3:0] d;
	assign {Overflow,Sum}=c+d;
	
	initial begin
		c=0;
		d=0;
	end
	
	always #5 a <= A;
	always #5 b <= B;
	
	always @(posedge Clk)begin
		if(En)begin
		c <=a;
		d <=b;
		end
	end

endmodule