`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:08 10/11/2018 
// Design Name: 
// Module Name:    id_fsm 
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
module id_fsm(
		input [7:0] char,
		input clk,
		output reg out=0
    );
	 
	 reg alpha=0;
	 
	 always @ (posedge clk) begin
		if((65<=char&&char<=90)||(97<=char&&char<=122)) begin
			alpha <= 1;
			out <= 0;
		end
		
		else begin 
			if(alpha&&48<=char&&char<=57)
				out <= 1;
				
			else begin
				alpha <= 0;
				out <= 0;
			end
				
		end
			
	 end


endmodule
