`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:58:30 10/21/2018
// Design Name:   ternary_half_adder
// Module Name:   C:/Users/asus/Desktop/ISE/id_fsm/txt.v
// Project Name:  id_fsm
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ternary_half_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module txt;

	// Inputs
	reg a1;
	reg a0;
	reg b1;
	reg b0;

	// Outputs
	wire s1;
	wire s0;
	wire Carry;

	// Instantiate the Unit Under Test (UUT)
	ternary_half_adder uut (
		.a1(a1), 
		.a0(a0), 
		.b1(b1), 
		.b0(b0), 
		.s1(s1), 
		.s0(s0), 
		.Carry(Carry)
	);

	initial begin
		// Initialize Inputs
		a1 = 0;
		a0 = 0;
		b1 = 0;
		b0 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

