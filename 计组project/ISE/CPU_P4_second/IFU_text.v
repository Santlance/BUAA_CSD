`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:14:37 11/25/2018
// Design Name:   IFU
// Module Name:   C:/Users/asus/Desktop/ISE/CPU_P4_second/IFU_text.v
// Project Name:  CPU_P4_second
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IFU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IFU_text;

	// Inputs
	reg reset;
	reg ifzero;
	reg npc_sel;
	reg jump;
	reg jr;
	reg [31:0] ra_addr;

	// Outputs
	wire [31:0] instr;
	wire [31:0] pc_and_4;

	// Bidirs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	IFU uut (
		.clk(clk), 
		.reset(reset), 
		.ifzero(ifzero), 
		.npc_sel(npc_sel), 
		.jump(jump), 
		.jr(jr), 
		.ra_addr(ra_addr), 
		.instr(instr), 
		.pc_and_4(pc_and_4)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		ifzero = 0;
		npc_sel = 0;
		jump = 0;
		jr = 0;
		ra_addr = 0;
		
		#200;
		reset = 1;
		#10;
		reset = 0;
	end
   
	always #10 begin
	clk = ~clk;
	$display("%h %h\n",pc_and_4,instr);
	end
endmodule

