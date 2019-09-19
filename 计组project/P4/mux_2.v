`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:33 12/03/2014 
// Design Name: 
// Module Name:    mux_2 
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
module mux_2 #(parameter WIDTH = 32)(
		input [WIDTH - 1:0] a, 
		input [WIDTH - 1:0] b,
		input s,
		output [WIDTH - 1:0] r
	);
		reg [WIDTH - 1:0] temp;
		assign r=temp;
		always @ (*) begin
				if (s==0)
						temp=a;
				else 
						temp=b;
		end
  

endmodule
