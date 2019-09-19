`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:10:49 12/17/2018
// Design Name:   MULTDIVPART
// Module Name:   C:/Users/asus/Desktop/ISE/CPU_P6/MULTDIV_test.v
// Project Name:  CPU_P6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MULTDIVPART
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MULTDIV_test;

	// Inputs
	reg CLK;
	reg Reset;
	reg Start;
	reg [31:0] ALUOprand_A;
	reg [31:0] ALUOprand_B;
	reg [3:0] MDSel;

	// Outputs
	wire [31:0] HI;
	wire [31:0] LO;
	wire Busy;

	// Instantiate the Unit Under Test (UUT)
	MULTDIVPART uut (
		.CLK(CLK), 
		.Reset(Reset), 
		.Start(Start), 
		.ALUOprand_A(ALUOprand_A), 
		.ALUOprand_B(ALUOprand_B), 
		.MDSel(MDSel), 
		.HI(HI), 
		.LO(LO), 
		.Busy(Busy)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		Reset = 0;
		Start = 0;
		ALUOprand_A = 0;
		ALUOprand_B = 0;
		MDSel = 0;

		// Wait 100 ns for global reset to finish
		#20;
		ALUOprand_A = 25;
		ALUOprand_B = 2500;
		MDSel = 1;
		#10;
		Start <= 1;
		#20;
		Start <= 0;
        
		// Add stimulus here

	end
   always #10 CLK = ~CLK;
endmodule

