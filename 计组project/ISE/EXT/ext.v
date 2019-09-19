`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:27:09 10/26/2018 
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
		output reg [31:0] ext
    );
	always @ (imm or EOp) begin
	case(EOp)
		2'b00: begin
		ext = $signed(imm);
		end
		2'b01: begin
		ext = imm;
		end
		2'b10: begin
		ext = {imm[15:0],{16{1'b0}}};
		end
		2'b11: begin
		ext = {{14{imm[15]}},imm[15:0],2'b00};
		end
		default:;
	endcase
	end

endmodule
