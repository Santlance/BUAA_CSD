`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:32:33 12/09/2014
// Design Name:   Main_Board
// Module Name:   C:/Users/dnfinal/Desktop/MY_CPU/CPU/CPU_tb.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main_Board
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] imem_addr;
	wire [31:0] instr;
	wire [31:0] dmem_addr;
	wire [31:0] dmem_out;

	// Instantiate the Unit Under Test (UUT)
	Main_Board uut (
		.clk(clk), 
		.reset(reset), 
		.imem_addr(imem_addr), 
		.instr(instr), 
		.dmem_addr(dmem_addr), 
		.dmem_out(dmem_out)
	);
	integer file_output;
	integer i;
	initial begin
		// Initialize Inputs
		//$readmemh("C:/Users/dnfinal/Desktop/MY_CPU/CPUtest/_3_j.hex.txt", uut.imem.iram);
		//$readmemh("C:/Users/dnfinal/Desktop/MY_CPU/CPUtest/_quicksort_hex.txt", uut.imem.iram);
		file_output = $fopen("C:/Users/dnfinal/Desktop/MY_CPU/CPUtest/result.txt");
/*
		$display("0x00: %h", uut.imem.iram[10'h00]);
      $display("0x01: %h", uut.imem.iram[10'h01]);
      $display("0x02: %h", uut.imem.iram[10'h02]); 
      $display("0x03: %h", uut.imem.iram[10'h03]);
*/
		clk = 0; 
		reset = 0;
		// Wait 100 ns for global reset to finish
		#1;
		reset = 1;
		#1;
		reset = 0;
		// Add stimulus here
	end

	always #3 clk = ~clk;
      
		always @ (posedge clk)
		begin

//				$fdisplay(file_output,"pcsource = %h",uut.cpu.pcsource);
//				$fdisplay(file_output,"mux_npc = %h",uut.cpu.mux_npc);
//				$fdisplay(file_output,"qa = %h",uut.cpu.qa);



				$fdisplay(file_output,"regfiles0 = %h",uut.cpu.regfiles.q0);
				$fdisplay(file_output,"regfiles1 = %h",uut.cpu.regfiles.reg01.q);
				$fdisplay(file_output,"regfiles2 = %h",uut.cpu.regfiles.reg02.q);
				$fdisplay(file_output,"regfiles3 = %h",uut.cpu.regfiles.reg03.q);
				$fdisplay(file_output,"regfiles4 = %h",uut.cpu.regfiles.reg04.q);
				$fdisplay(file_output,"regfiles5 = %h",uut.cpu.regfiles.reg05.q);
				$fdisplay(file_output,"regfiles6 = %h",uut.cpu.regfiles.reg06.q);
				$fdisplay(file_output,"regfiles7 = %h",uut.cpu.regfiles.reg07.q);
				$fdisplay(file_output,"regfiles8 = %h",uut.cpu.regfiles.reg08.q);
				$fdisplay(file_output,"regfiles9 = %h",uut.cpu.regfiles.reg09.q);
				$fdisplay(file_output,"regfiles10 = %h",uut.cpu.regfiles.reg10.q);
				$fdisplay(file_output,"regfiles11 = %h",uut.cpu.regfiles.reg11.q);
				$fdisplay(file_output,"regfiles12 = %h",uut.cpu.regfiles.reg12.q);
				$fdisplay(file_output,"regfiles13 = %h",uut.cpu.regfiles.reg13.q);
				$fdisplay(file_output,"regfiles14 = %h",uut.cpu.regfiles.reg14.q);
				$fdisplay(file_output,"regfiles15 = %h",uut.cpu.regfiles.reg15.q);
				$fdisplay(file_output,"regfiles16 = %h",uut.cpu.regfiles.reg16.q);
				$fdisplay(file_output,"regfiles17 = %h",uut.cpu.regfiles.reg17.q);
				$fdisplay(file_output,"regfiles18 = %h",uut.cpu.regfiles.reg18.q);
				$fdisplay(file_output,"regfiles19 = %h",uut.cpu.regfiles.reg19.q);
				$fdisplay(file_output,"regfiles20 = %h",uut.cpu.regfiles.reg20.q);
				$fdisplay(file_output,"regfiles21 = %h",uut.cpu.regfiles.reg21.q);
				$fdisplay(file_output,"regfiles22 = %h",uut.cpu.regfiles.reg22.q);
				$fdisplay(file_output,"regfiles23 = %h",uut.cpu.regfiles.reg23.q);
				$fdisplay(file_output,"regfiles24 = %h",uut.cpu.regfiles.reg24.q);
				$fdisplay(file_output,"regfiles25 = %h",uut.cpu.regfiles.reg25.q);
				$fdisplay(file_output,"regfiles26 = %h",uut.cpu.regfiles.reg26.q);
				$fdisplay(file_output,"regfiles27 = %h",uut.cpu.regfiles.reg27.q);
				$fdisplay(file_output,"regfiles28 = %h",uut.cpu.regfiles.reg28.q);
				$fdisplay(file_output,"regfiles29 = %h",uut.cpu.regfiles.reg29.q);
				$fdisplay(file_output,"regfiles30 = %h",uut.cpu.regfiles.reg30.q);
				$fdisplay(file_output,"regfiles31 = %h",uut.cpu.regfiles.reg31.q);

				$fdisplay(file_output,"instr = %h",uut.instr);
				$fdisplay(file_output,"pc = %h",uut.imem_addr * 4);
		end

endmodule

