module IMEM(
	input [31:0] pc;
	output [5:0] op;
	output [5:0] func;
	output [4:0] rs;
	output [4:0] rt;
	output [4:0] rd;
	output [4:0] sa;
	output [15:0] imm;
	output [25:0] addr;
);

	reg [7:0] memory []