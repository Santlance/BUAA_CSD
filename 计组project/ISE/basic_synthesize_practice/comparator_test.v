`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:00:58 10/08/2018
// Design Name:   signed_num
// Module Name:   C:/Users/asus/Desktop/ISE/basic_synthesize_practice/comparator_test.v
// Project Name:  basic_synthesize_practice
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: signed_num
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module comparator_test;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire res;

	// Instantiate the Unit Under Test (UUT)
	signed_num uut (
		.clk(clk), 
		.reset(reset), 
		.a(a), 
		.b(b), 
		.res(res)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		a = 4;
		b = 1;

		// Wait 100 ns for global reset to finish
		#100 b=-1;
        
		// Add stimulus here

	end
      
endmodule

