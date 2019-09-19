`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:57:07 10/09/2018
// Design Name:   block_and_non
// Module Name:   C:/Users/asus/Desktop/ISE/basic_synthesize_practice/bufftest.v
// Project Name:  basic_synthesize_practice
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: block_and_non
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bufftest;

	// Inputs
	reg clk;
	reg in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	block_and_non uut (
		.clk(clk), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		in = 0;
		#10;
		in=1;
		#10;
		in=0;
		#10;
		in=1;
	end
	always #5 clk=~clk;
      
endmodule

