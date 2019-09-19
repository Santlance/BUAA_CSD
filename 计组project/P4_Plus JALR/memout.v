`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:36:44 11/29/2018 
// Design Name: 
// Module Name:    MEMOUT 
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
module MEMOUT(
	 input [2:0] load_sel,// 3
	 input [31:0] memout,// 32
	 input [1:0] offset_10,// 2
	 
	 output [31:0] memout_sel// 32
    );
	 parameter [2:0] LW = 3'b000, LH = 3'b001, LHU = 3'b010, LB = 3'b011, LBU = 3'b100;
	 wire [31:0] lw_memout, lh_memout, lhu_memout, lb_memout, lbu_memout;
	 
	 assign lw_memout = memout;
	 assign lh_memout = (offset_10[1] == 0)? {{16{memout[15]}},{memout[15:0]}}:{{16{memout[31]}},{memout[31:16]}} ;
	 assign lhu_memout = (offset_10[1] == 0)? {{16{1'b0}},{memout[15:0]}}:{{16{1'b0}},{memout[31:16]}};
	 assign lb_memout = (offset_10 == 2'b00)? {{24{memout[7]}},{memout[7:0]}}:((offset_10 == 2'b01)? {{24{memout[15]}},{memout[15:8]}} : ( (offset_10 == 2'b10)?{{24{memout[23]}},{memout[23:16]}}:{{24{memout[31]}},{memout[31:24]}} )) ;
	 assign lbu_memout = (offset_10 == 2'b00)? {{24{1'b0}},{memout[7:0]}}:((offset_10 == 2'b01)? {{24{1'b0}},{memout[15:8]}} : ( (offset_10 == 2'b10)?{{24{1'b0}},{memout[23:16]}}:{{24{1'b0}},{memout[31:24]}} )) ;
	 
	 assign memout_sel = load_sel == LW? lw_memout:(load_sel == LH? lh_memout:(load_sel == LHU? lhu_memout:(load_sel == LB? lb_memout:(load_sel == LBU? lbu_memout:0))));

endmodule
