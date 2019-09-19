`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:09:48 10/08/2018
// Design Name:   system_function_test
// Module Name:   C:/Users/asus/Desktop/ISE/basic_synthesize_practice/knkn.v
// Project Name:  basic_synthesize_practice
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: system_function_test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module knkn;

	// Inputs
	reg [9:0] addr;

	// Outputs
	wire [31:0] instr;

	// Instantiate the Unit Under Test (UUT)
	system_function_test uut (
		.addr(addr), 
		.instr(instr)
	);

	initial begin
		// Initialize Inputs
		addr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

