`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:34 10/28/2018 
// Design Name: 
// Module Name:    gray 
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
module gray(
		input Clk,
		input Reset,
		input En,
		output reg [2:0] Output,
		output reg Overflow
    );
	 reg [2:0] Binary;
	 
	 initial begin
		Output <= 0;
		Overflow <= 0;
		Binary <= 0;
	 end
	 
	 always @ (posedge Clk)begin
			if(Reset)begin
				Output <= 0;
				Overflow <= 0;
				Binary <= 0;
			end
			
			else begin
				if(En)begin
					if(Binary == 3'b111)begin
						Binary <= 0;
						Output <= 0;
						Overflow <= 1;
					end
					else begin
						Binary = Binary + 1;
						Output <= (Binary >> 1)^Binary;
					end
				end
			end
	 end

endmodule
