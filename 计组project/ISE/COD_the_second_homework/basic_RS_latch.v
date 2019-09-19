`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:37 10/29/2018 
// Design Name: 
// Module Name:    basic_RS_latch 
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
module basic_RS_latch(
		input SDN,RDN,
		output Q,QN
    );
	 assign Q = !SDN || !QN;
	 assign QN = !RDN || !Q;
endmodule
