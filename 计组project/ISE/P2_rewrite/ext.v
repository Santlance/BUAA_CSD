`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:21 11/07/2018 
// Design Name: 
// Module Name:    ext 
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
module ext(
	input [15:0] imm,
	input [1:0] EOp,
	output reg [31:0] ext = 0
    );
	always @ (imm or EOp)
	begin
		case(EOp)
		2'b00:
			ext <= $signed(imm);
		2'b01:
			ext <= {{16{1'b0}},imm[15:0]};
		2'b10:
			ext <= {imm[15:0],{16{1'b0}}};
		2'b11:
			ext <= {{14{imm[15]}},imm[15:0],2'b00};
		default:
			ext <= 0;
		endcase
	end

endmodule
