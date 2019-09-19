`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:07 12/03/2014 
// Design Name: 
// Module Name:    Main_Board 
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
module Main_Board(clk,reset,cs,half,imem_addr,instr,dmem_addr,dmem_out);	
		input clk,reset;
		input [1:0] cs;
		input half;
		output [31:0] imem_addr,instr,dmem_addr,dmem_out;
		wire [31:0] dmem_data,data_out;
		wire dmem_we;
		
//		IMEM imem(clk,imem_addr[10:0],instr);
//		IP_CORE_IMEM ip_core_imem(.clka(clk),.addra(imem_addr[10:0]),.douta(instr));
		IP_CORE_IMEM_2 ip_core_imem(.a(imem_addr[10:0]),.spo(instr));
		DMEM dmem(dmem_addr,dmem_data,clk,dmem_we,dmem_out);
//		IP_CORE_DMEM ip_core_dmem(.clka(clk),.wea(dmem_we),.addra(dmem_addr),.dina(dmem_data),.douta(dmem_out));
		cpu cpu(clk,reset,instr,dmem_out,dmem_addr,dmem_data,dmem_we,imem_addr);
		show_unit su(cs,half,dmem_addr,imem_addr,instr,data_out);
endmodule