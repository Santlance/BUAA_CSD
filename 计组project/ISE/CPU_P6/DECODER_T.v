`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:03 12/04/2018 
// Design Name: 
// Module Name:    DECODER_T 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define OPCODE 31:26
`define FUNC 	5:0
`define RS 		25:21
`define RT 		20:16
`define RD 		15:11
`define RCLASS 6'b000000
`define REGIMM 6'b000001

`define LB 		6'b100000
`define LBU		6'b100100
`define LH		6'b100001
`define LHU		6'b100101
`define LW 		6'b100011
`define SB		6'b101000
`define SH		6'b101001
`define SW 		6'b101011
`define ADD		6'b100000
`define ADDU 	6'b100001
`define ADDI	6'b001000
`define ADDIU	6'b001001
`define SUB		6'b100010
`define SUBU 	6'b100011
`define AND		6'b100100
`define ANDI	6'b001100
`define OR		6'b100101
`define ORI 	6'b001101
`define XOR		6'b100110
`define XORI	6'b001110
`define NOR		6'b100111
`define SLLV	6'b000100
`define SLL		6'b000000
`define SRLV	6'b000110
`define SRL		6'b000010
`define SRAV	6'b000111
`define SRA		6'b000011
`define SLT		6'b101010
`define SLTU	6'b101011
`define SLTI	6'b001010
`define SLTIU	6'b001011
`define LUI 	6'b001111
`define BEQ 	6'b000100
`define BNE		6'b000101
`define BLEZ	6'b000110
`define BGTZ	6'b000111
`define BLTZ	5'b00000////////
`define BGEZ	5'b00001////////
`define J 		6'b000010
`define JAL 	6'b000011
`define JR 		6'b001000
`define JALR	6'b001001
`define MULT	6'b011000
`define MULTU	6'b011001
`define DIV		6'b011010
`define DIVU	6'b011011
`define MFHI	6'b010000
`define MFLO	6'b010010
`define MTHI	6'b010001
`define MTLO	6'b010011
module DECODER_Tnew_E(//这里产生的Tnew是针对E而言的
	input [31:0] Instr,
	output reg [1:0] Tnew = 2'b11
	);
	 always @(*)begin
		case(Instr[`OPCODE])
			`RCLASS:
				case(Instr[`FUNC])
					`ADDU:begin
						Tnew = 2'b01;
					end
					`SUBU:begin
						Tnew = 2'b01;
					end
					`ADD:begin
						Tnew = 2'b01;
					end
					`SUB:begin
						Tnew = 2'b01;
					end
					`OR:begin
						Tnew = 2'b01;
					end
					`AND:begin
						Tnew = 2'b01;
					end
					`XOR:begin
						Tnew = 2'b01;
					end
					`NOR:begin
						Tnew = 2'b01;
					end
					`SLL:begin
						Tnew = 2'b01;
					end
					`SLLV:begin
						Tnew = 2'b01;
					end
					`SRL:begin
						Tnew = 2'b01;
					end
					`SRLV:begin
						Tnew = 2'b01;
					end
					`SRA:begin
						Tnew = 2'b01;
					end
					`SRAV:begin
						Tnew = 2'b01;
					end
					`SLT:begin
						Tnew = 2'b01;
					end
					`SLTU:begin
						Tnew = 2'b01;
					end
					`JALR:begin
						Tnew = 2'b00;
					end
					`MFHI:begin
						Tnew = 2'b01;
					end
					`MFLO:begin
						Tnew = 2'b01;
					end
					default:begin/////////////其他指令默认不产生吧
						Tnew = 2'b11;
					end
				endcase
			`LHU:begin
				Tnew = 2'b10;
			end
			`LH:begin
				Tnew = 2'b10;
			end
			`LBU:begin
				Tnew = 2'b10;
			end
			`LB:begin
				Tnew = 2'b10;
			end
			`SLTIU:begin
				Tnew = 2'b01;
			end
			`SLTI:begin
				Tnew = 2'b01;
			end
			`XORI:begin
				Tnew = 2'b01;
			end
			`ANDI:begin
				Tnew = 2'b01;
			end
			`ADDIU:begin
				Tnew = 2'b01;
			end
			`ADDI:begin
				Tnew = 2'b01;
			end
			`ORI:begin
				Tnew = 2'b01;
			end
			`LUI:begin
				Tnew = 2'b01;
			end
			`LW:begin
				Tnew = 2'b10;
			end
			`JAL:begin
						Tnew = 2'b00;
			end
		default:begin
			Tnew = 2'b11;
		end
		endcase
	 end
endmodule
/////////////////////////////////////////////////////////////
module DECODER_Tnew_M(//这里产生的Tnew是针对M而言的
	input [31:0] Instr,
	output reg [1:0] Tnew = 2'b11
	);
	 always @(*)begin
		case(Instr[`OPCODE])
			`RCLASS:
				case(Instr[`FUNC])
					`ADDU:begin
						Tnew = 2'b00;
					end
					`SUBU:begin
						Tnew = 2'b00;
					end
					`ADD:begin
						Tnew = 2'b00;
					end
					`SUB:begin
						Tnew = 2'b00;
					end
					`OR:begin
						Tnew = 2'b00;
					end
					`AND:begin
						Tnew = 2'b00;
					end
					`XOR:begin
						Tnew = 2'b00;
					end
					`NOR:begin
						Tnew = 2'b00;
					end
					`SLL:begin
						Tnew = 2'b00;
					end
					`SLLV:begin
						Tnew = 2'b00;
					end
					`SRL:begin
						Tnew = 2'b00;
					end
					`SRLV:begin
						Tnew = 2'b00;
					end
					`SRA:begin
						Tnew = 2'b00;
					end
					`SRAV:begin
						Tnew = 2'b00;
					end
					`SLT:begin
						Tnew = 2'b00;
					end
					`SLTU:begin
						Tnew = 2'b00;
					end
					`JALR:begin
						Tnew = 2'b00;
					end
					`MFHI:begin
						Tnew = 2'b00;
					end
					`MFLO:begin
						Tnew = 2'b00;
					end
					default:begin/////////////
						Tnew = 2'b11;
					end
				endcase
			`LHU:begin
				Tnew = 2'b01;
			end
			`LH:begin
				Tnew = 2'b01;
			end
			`LBU:begin
				Tnew = 2'b01;
			end
			`LB:begin
				Tnew = 2'b01;
			end
			`SLTIU:begin
				Tnew = 2'b00;
			end
			`SLTI:begin
				Tnew = 2'b00;
			end
			`XORI:begin
				Tnew = 2'b00;
			end
			`ANDI:begin
				Tnew = 2'b00;
			end
			`ADDIU:begin
				Tnew = 2'b00;
			end
			`ADDI:begin
				Tnew = 2'b00;
			end
			`ORI:begin
				Tnew = 2'b00;
			end
			`LUI:begin
				Tnew = 2'b00;
			end
			`LW:begin
				Tnew = 2'b01;
			end
			`JAL:begin
						Tnew = 2'b00;
			end
		default:begin
			Tnew = 2'b11;
		end
		endcase
	 end
endmodule
