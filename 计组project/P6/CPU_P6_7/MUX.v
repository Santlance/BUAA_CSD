`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:41 12/04/2018 
// Design Name: 
// Module Name:    MUX 
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
module MUX_2_1_32(
	input [31:0] A,
	input [31:0] B,
	input Sel,
	output [31:0] C
    );
	 assign C = Sel ? B : A ;
endmodule

module MUX_4_1_32(
	input [31:0] A,
	input [31:0] B,
	input [31:0] C,
	input [31:0] D,
	input [1:0] Sel,
	output [31:0] E
	);
	assign E = (Sel == 2'b00)? A :
				  (Sel == 2'b01)? B :
				  (Sel == 2'b10)? C :
										D ;
endmodule

module MUX_4_1_5(
	input [4:0] A,B,C,D,
	input [1:0] Sel,
	output [4:0] E
	);
	assign E = (Sel == 2'b00)? A :
				  (Sel == 2'b01)? B :
				  (Sel == 2'b10)? C :
										D ;
endmodule

