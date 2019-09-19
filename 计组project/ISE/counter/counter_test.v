`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:41:33 10/07/2018
// Design Name:   counter
// Module Name:   C:/Users/asus/Desktop/ISE/counter/counter_test.v
// Project Name:  counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_test;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire [3:0] cnt;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.cnt(cnt)
	);

	initial begin
		// Initialize Inputs
		#0 clk = 0;//#是延迟的意思
			rst_n = 0;
		#5 rst_n=1'b1;
        
		// Add stimulus here

	end
	always #10 clk=~clk;
      
endmodule

