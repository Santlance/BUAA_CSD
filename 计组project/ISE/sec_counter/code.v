`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:41 10/08/2018 
// Design Name: 
// Module Name:    code 
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
module code(
		input Clk,
		input Reset,
		input Slt,
		input En,
		output [63:0] Output0,
		output [63:0] Output1
    );
	 
	 reg [63:0] cnt0;
	 reg [63:0] cnt1;
	 reg [63:0] cnt_clk;
	 assign Output0=cnt0;
	 assign Output1=cnt1;
	 
	 initial begin
		 cnt0 <= 0;
		 cnt1 <= 0;
		 cnt_clk <=0;
	 end
	 
	 always @ (posedge Clk) begin
		if(Reset) begin
				cnt0 <= 0;
				cnt1 <= 0;
		end
		else if(En) begin
				if(!Slt)
					cnt0=cnt0+1;
				else begin
					cnt_clk=cnt_clk+1;
					if(cnt_clk==4) begin
					cnt1=cnt1+1;
					cnt_clk=0;
					end
				end
		end
	 end

endmodule
