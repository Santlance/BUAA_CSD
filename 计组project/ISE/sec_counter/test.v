`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:16:18 10/09/2018
// Design Name:   code
// Module Name:   C:/Users/asus/Desktop/ISE/sec_counter/test.v
// Project Name:  sec_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: code
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	reg clk;
	reg reset;
	reg slt;
	reg [63:0] out1;
	reg [63:0] out2;
	// Instantiate the Unit Under Test (UUT)
	code uut (
		Clk.(clk),
		Reset.(reset),
		Slt.(slt)
	);

	initial begin
		clk<=0;
		reset<=0;
		slt<=0;
	end

   always #10 clk=~clk;
	always #100 slt=~slt;
	always #1000 reset=~reset;
	
endmodule

