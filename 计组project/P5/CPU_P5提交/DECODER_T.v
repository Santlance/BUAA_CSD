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
`define FUNC 5:0
`define RCLASS 6'b000000

`define LW 6'b100011
`define SW 6'b101011
`define ADDU 6'b100001
`define SUBU 6'b100011
`define ORI 6'b001101
`define LUI 6'b001111
`define BEQ 6'b000100
`define J 6'b000010
`define JAL 6'b000011
`define JR 6'b001000
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
					default:begin/////////////其他指令默认不产生吧
						Tnew = 2'b11;
					end
				endcase
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
					default:begin/////////////
						Tnew = 2'b00;
					end
				endcase
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
