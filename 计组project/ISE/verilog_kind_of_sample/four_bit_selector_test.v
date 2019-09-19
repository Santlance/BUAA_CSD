`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:25:33 10/29/2018
// Design Name:   four_bit_selector_p72
// Module Name:   C:/Users/asus/Desktop/ISE/verilog_kind_of_sample/four_bit_selector_test.v
// Project Name:  verilog_kind_of_sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_bit_selector_p72
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_bit_selector_test;

	// Inputs
	reg i0;
	reg i1;
	reg i2;
	reg i3;
	reg s0;
	reg s1;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	four_bit_selector_p72 uut (
		.out(out), 
		.i0(i0), 
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.s0(s0), 
		.s1(s1)
	);

	initial begin
		// Initialize Inputs
		i0 = 1;
		i1 = 0;
		i2 = 1;
		i3 = 0;
		s0 = 0;
		s1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
      s0 = 1;
		#100;
		s1 = 1;
		#100;
		s0 = 0;
		
		// Add stimulus here
		

	end
      
endmodule

