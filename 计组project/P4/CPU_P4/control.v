`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:33 11/23/2018 
// Design Name: 
// Module Name:    control 
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
module control(
	input [5:0] opcode,func,
	output  jr ,jal ,jump ,regdst ,npc_sel ,memtoreg ,memwrite ,alusrc ,regwrite ,
	output  [1:0] extop ,
	output  [3:0] aluctr 
    );
	
	parameter [5:0] RCLASS = 6'b000000, // R¿‡÷∏¡Ó ªÚ nop
						 ADDU = 6'b100001,	//ADDU
						 SUBU = 6'b100011,	//SUBU
						 ORI = 6'b001101,		//ORI
						 LW = 6'b100011,		//LW
						 SW = 6'b101011,		//SW
						 BEQ = 6'b000100,		//BEQ
						 LUI = 6'b001111,		//LUI
						 JAL = 6'b000011,		//JAL
						 JR = 6'b001000,		//JR
						 J = 6'b000010;		//J
	wire addu_and, subu_and, ori_and, lw_and, sw_and, beq_and, lui_and, jal_and, jr_and, j_and;
	
	//and logic
	assign addu_and = opcode == RCLASS? (func == ADDU? 1 : 0) : 0;
	assign subu_and = opcode == RCLASS? (func == SUBU? 1 : 0) : 0;
	assign ori_and = opcode == ORI? 1 : 0;
	assign lw_and = opcode == LW? 1 : 0;
	assign sw_and = opcode == SW? 1 : 0;
	assign beq_and = opcode == BEQ? 1 : 0;
	assign lui_and = opcode == LUI? 1 : 0;
	assign jal_and = opcode == JAL? 1 : 0;
	assign jr_and = opcode == RCLASS? (func == JR? 1 : 0) : 0;
	assign j_and = opcode == J? 1 : 0;
	//or_logic
	assign jr = jr_and; 
	assign jal = jal_and; 
	assign jump = j_and || jal_and; 
	assign regdst = addu_and || subu_and; 
	assign npc_sel = beq_and; 
	assign memtoreg = lw_and; 
	assign memwrite = sw_and; 
	assign alusrc = ori_and || lw_and || lui_and || sw_and; 
	assign regwrite = addu_and || subu_and || lui_and || ori_and || lw_and || jal_and;
	assign extop = lui_and? 2 :((lw_and || sw_and)? 1 : 0);
	assign aluctr = ori_and? 2 :(subu_and ? 1 : 0);

endmodule
