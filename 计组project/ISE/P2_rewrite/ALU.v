`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:04 11/07/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
		input [31:0] A,B,
		input [2:0] ALUOp,
		output reg [31:0] C = 0
    );
	 
	 always @ (A or ALUOp or B)
	 begin
		case(ALUOp)
		3'b000:
			C <= A + B;
		3'b001:
			C <= A - B;
		3'b010:
			C <= A & B;
		3'b011:
			C <= A | B;
		3'b100:
			C <= A >> B;
		3'b101:
			C <= $signed(A) >>> B;
		3'b110,3'b111:
			C <= 0;	
		default:
			C <= 0;
		endcase
	 end
endmodule
