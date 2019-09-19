`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:43 12/03/2014 
// Design Name: 
// Module Name:    mux_4 
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
module mux_4 #(parameter WIDTH = 32)(
		input [WIDTH - 1:0] a,
		 input [WIDTH - 1:0] b,
		 input [WIDTH - 1:0] c,
		 input [WIDTH - 1:0] d,
		 input [1:0] s,
		output reg [WIDTH - 1:0] r
    );
		always @ (*) 
		begin
			case (s)
					2'b00: r=a;
					2'b01: r=b;
					2'b10: r=c;
					2'b11: r=d;
			endcase
		end 

endmodule
