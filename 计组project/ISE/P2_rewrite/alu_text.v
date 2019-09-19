`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:23:37 11/07/2018
// Design Name:   ALU
// Module Name:   C:/Users/asus/Desktop/ISE/P2_rewrite/alu_text.v
// Project Name:  P2_rewrite
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_text;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] ALUOp;

	// Outputs
	wire [31:0] C;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.ALUOp(ALUOp), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		A = 32;
		B = 16;
		ALUOp = 3'b000;
		#100;
		ALUOp = 3'b001;
      #100; 
	   ALUOp = 3'b010;
      #100;
		ALUOp = 3'b011;
		#100;
      ALUOp = 3'b100;
      #100;
	   ALUOp = 3'b101;
      #100;
		// Add stimulus here

	end
      
endmodule

