`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:36:43 10/29/2018
// Design Name:   four_bit_counter_p73
// Module Name:   C:/Users/asus/Desktop/ISE/verilog_kind_of_sample/four_bit_counter_test.v
// Project Name:  verilog_kind_of_sample
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: four_bit_counter_p73
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module four_bit_counter_test;

	// Inputs
	reg clock;
	reg clear;

	// Outputs
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	four_bit_counter_p73 uut (
		.Q(Q), 
		.clock(clock), 
		.clear(clear)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		clear = 0;

		// Wait 100 ns for global reset to finish
		#100;
      clear = 1;
		#1000;
		clear = 0;
		// Add stimulus here

	end
	
	always #10 clock = ~clock;
      
endmodule

