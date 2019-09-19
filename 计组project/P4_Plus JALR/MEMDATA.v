`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:37:02 11/29/2018 
// Design Name: 
// Module Name:    MEMDATA 
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
module MEMDATA(
	 input [31:0] regdata2,// 32
	 input [1:0] store_sel,// 2
	 input [1:0] offset_10,// 2
	 
	 output [31:0] memdata// 32
    );
	 parameter [1:0] SW = 2'b00, SH = 2'b01, SB = 2'b10;
	 
	 wire [31:0] sw_memdata, sh_memdata, sb_memdata;//要看是2还是4的倍数，即看offset的第一位是否为0
	 
	 assign sw_memdata = regdata2;
	 assign sh_memdata = offset_10[1] == 0? {{16{1'b0}},{regdata2[15:0]}} : {{regdata2[15:0]},{16{1'b0}}};
	 assign sb_memdata = (offset_10 == 2'b00)? {{24{1'b0}},{regdata2[7:0]}}:((offset_10 == 2'b01)? {{16{1'b0}},{regdata2[7:0]},{8{1'b0}}} : ( (offset_10 == 2'b10)?{{8{1'b0}},{regdata2[7:0]},{16{1'b0}}}:{{regdata2[7:0]},{16{1'b0}}} )) ;
	 assign memdata = store_sel == SW? sw_memdata:(store_sel == SH? sh_memdata:(store_sel == SB? sb_memdata:0));

endmodule
