`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:38:25 11/08/2018
// Design Name:   fsm
// Module Name:   C:/Users/asus/Desktop/ISE/P2_rewrite/fsm_text.v
// Project Name:  P2_rewrite
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsm_text;

	// Inputs
	reg clk;
	reg clr;
	reg [7:0] in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	fsm uut (
		.clk(clk), 
		.clr(clr), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		in = "1";

		// Wait 100 ns for global reset to finish
		#20;
        
		// Add stimulus here
		in = "+";
		#20;
		in = "9";
		#20;
		in = "+";
		#20;
		in = "8";
		#20;
		clr = 1 ;
		in = 0;
		#20;
		clr = 0;
		in = "1";
		#20;
		in = "*"; 
		
		

	end
	always #10 clk = ~clk;
      
endmodule

