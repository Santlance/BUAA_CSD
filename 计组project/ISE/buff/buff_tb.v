`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:13:40 10/09/2018
// Design Name:   buff
// Module Name:   C:/Users/asus/Desktop/ISE/buff/buff_tb.v
// Project Name:  buff
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: buff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module buff_tb;

	reg clk;
	reg in;
	wire out;
	// Instantiate the Unit Under Test (UUT)
	buff uut (
		.clk(clk),
		.in(in),
		.out(out)
	);

	initial begin
		clk=1;
		in=0;
		#10;
		in <= 1;
		#10
		in <= 0;
		#10;
		in <= 1;
	end
      always #5 clk=~clk;
endmodule

