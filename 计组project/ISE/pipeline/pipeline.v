`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:47 10/09/2018 
// Design Name: 
// Module Name:    pipeline 
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
module pipeline(
		input clk,
		input [31:0] A1,
		input [31:0] A2,
		input [31:0] B1,
		input [31:0] B2,
		output reg [31:0] C =0
    );
	reg [31:0] step1[1:0];
	
	integer i;
	
	initial begin
	for(i=0;i<=1;i=i+1) step1[i]=0;
	end
	
	always @ (posedge clk) begin
		step1[0] <= A1*B1;
		step1[1] <= A2*B2;
		
		C <= step1[0]+step1[1];
		
	end
	

endmodule
