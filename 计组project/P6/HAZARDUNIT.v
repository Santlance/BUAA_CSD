`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:27:58 12/04/2018 
// Design Name: 
// Module Name:    HAZARDUNIT 
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
`define OPCODE 31:26 
`define FUNC 5:0
`define RS 25:21
`define RT 20:16
`define RD 15:11
`define RCLASS 6'b000000
`define LW 6'b100011
`define SW 6'b101011
`define ADDU 6'b100001
`define SUBU 6'b100011
`define ORI 6'b001101
`define LUI 6'b001111
`define BEQ 6'b000100
`define J 6'b000010
`define JAL 6'b000011
`define JR 6'b001000
module HAZARDUNIT(
	input [31:0] Instr_D, Instr_E, Instr_M, Instr_W,//传入指令
	input RegWrite_E, RegWrite_M, RegWrite_W,//传入写信号
	input [4:0] A3_E, A3_M, A3_W,//传入A3_M方便，不然在这里判断很麻烦
	output Stall,
	output [1:0] ForwardRSD, ForwardRTD, ForwardRSE, ForwardRTE, 
	output ForwardRTM
    );
	 
	 wire Tuse_RS0, Tuse_RS1, Tuse_RT0, Tuse_RT1, Tuse_RT2;//这个用来表示指令，这样容易判断寄存器使用情况，如果仅仅是单纯的译码出时间，不行
	 wire Stall_RS0_E1, Stall_RS0_E2, Stall_RS0_M1, Stall_RS1_E2, Stall_RS,
			Stall_RT0_E1, Stall_RT0_E2, Stall_RT0_M1, Stall_RT1_E2, Stall_RT;
	 wire [1:0] Tnew_E, Tnew_M;
	//产生Tnew
	 DECODER_Tnew_E decoder_tnew_e(
	 .Instr(Instr_E),
	 .Tnew(Tnew_E)
	 );
	 
	 DECODER_Tnew_M decoder_tnew_m(
	 .Instr(Instr_M),
	 .Tnew(Tnew_M)
	 );
	//产生Tuse
	//Tuse和Tnew更多的是用来判断暂停的
	
	//在D级还有0个周期需要使用RS  beq jr
	assign Tuse_RS0 = (Instr_D[`OPCODE] == `BEQ) || ((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `JR));
	
	//在D级还有1个周期需要使用RS  cal_r cal_i load store
	assign Tuse_RS1 = ((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `ADDU)) || 
							((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `SUBU)) ||
							(Instr_D[`OPCODE] == `LW) || (Instr_D[`OPCODE] == `SW) || (Instr_D[`OPCODE] == `ORI) || (Instr_D[`OPCODE] == `LUI);
							
	//在D级还有0个周期需要使用RT	beq					
	assign Tuse_RT0 = (Instr_D[`OPCODE] == `BEQ);
	
	//在D级还有1个周期需要使用RT	cal_r
	assign Tuse_RT1 = ((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `ADDU)) || 
							((Instr_D[`OPCODE] == `RCLASS) && (Instr_D[`FUNC] == `SUBU));
							
	//在D级还有2个周期需要使用RT	store			
	assign Tuse_RT2 = (Instr_D[`OPCODE] == `SW);
	
	//产生Stall
	
	//如果在D级还有0个周期要使用RS，而E级指令仍需1个周期才能产生所要写入的数据
	assign Stall_RS0_E1 = Tuse_RS0 && (Tnew_E == 2'b01) && (Instr_D[`RS] == A3_E) && RegWrite_E;
	
	//如果在D级还有0个周期要使用RS，而E级指令仍需2个周期才能产生所要写入的数据
	assign Stall_RS0_E2 = Tuse_RS0 && (Tnew_E == 2'b10) && (Instr_D[`RS] == A3_E) && RegWrite_E;
	
	//如果在D级还有0个周期要使用RS，而M级指令仍需1个周期才能产生所要写入的数据
	assign Stall_RS0_M1 = Tuse_RS0 && (Tnew_M == 2'b01) && (Instr_D[`RS] == A3_M) && RegWrite_M;
	
	//如果在D级还有1个周期要使用RS，而E级指令仍需2个周期才能产生所要写入的数据
	assign Stall_RS1_E2 = Tuse_RS1 && (Tnew_E == 2'b10) && (Instr_D[`RS] == A3_E) && RegWrite_E;
	
	assign Stall_RS = Stall_RS0_E1 || Stall_RS0_E2 || Stall_RS0_M1 || Stall_RS1_E2;
	
	
	//如果在D级还有0个周期要使用RT，而E级指令仍需1个周期才能产生所要写入的数据
	assign Stall_RT0_E1 = Tuse_RT0 && (Tnew_E == 2'b01) && (Instr_D[`RT] == A3_E) && RegWrite_E;
	
	//如果在D级还有0个周期要使用RT，而E级指令仍需2个周期才能产生所要写入的数据
	assign Stall_RT0_E2 = Tuse_RT0 && (Tnew_E == 2'b10) && (Instr_D[`RT] == A3_E) && RegWrite_E;
	
	//如果在D级还有0个周期要使用RT，而M级指令仍需1个周期才能产生所要写入的数据
	assign Stall_RT0_M1 = Tuse_RT0 && (Tnew_M == 2'b01) && (Instr_D[`RT] == A3_M) && RegWrite_M;
	
	//如果在D级还有1个周期要使用RT，而E级指令仍需2个周期才能产生所要写入的数据
	assign Stall_RT1_E2 = Tuse_RT1 && (Tnew_E == 2'b10) && (Instr_D[`RT] == A3_E) && RegWrite_E;
	
	assign Stall_RT = Stall_RT0_E1 || Stall_RT0_E2 || Stall_RT0_M1 || Stall_RT1_E2;
	
	assign Stall = Stall_RS || Stall_RT;
	
	//产生Forward
	//跳转指令之后规定不能再接跳转指令
	//由于对一条指令如SW的RT可能存在多次转发，所以的确得保证优先级问题，最新更新最优先
	//指令在越后面要用到寄存器的值，所用的值经过的转发更新就越多
	
	//在D级的指令（beq）需要用到RS，但是如果别的指令在这里需要的话，会提前转发
	assign ForwardRSD = ((Instr_D[`RS] == A3_M) && (Tnew_M == 0) && (A3_M != 0) && RegWrite_M)? 2 :
													 ((Instr_D[`RS] == A3_W) && (A3_W != 0) && RegWrite_W)? 1 :
																															  0 ;
	//在D级的指令（beq）需要用到RT								
	assign ForwardRTD = ((Instr_D[`RT] == A3_M) && (Tnew_M == 0) && (A3_M != 0) && RegWrite_M)? 2 :
													 ((Instr_D[`RT] == A3_W) && (A3_W != 0) && RegWrite_W)? 1 :
																															  0 ;
	//在E级的指令（cal_r cal_i load store）需要用到RS																														  
	assign ForwardRSE = ((Instr_E[`RS] == A3_M) && (Tnew_M == 0) && (A3_M != 0) && RegWrite_M)? 2 :
													 ((Instr_E[`RS] == A3_W) && (A3_W != 0) && RegWrite_W)? 1 :
																															  0 ;
	//在E级的指令（cal_r）需要用到RT								
	assign ForwardRTE = ((Instr_E[`RT] == A3_M) && (Tnew_M == 0) && (A3_M != 0) && RegWrite_M)? 2 :
													 ((Instr_E[`RT] == A3_W) && (A3_W != 0) && RegWrite_W)? 1 :
																															  0 ;
	//在M级的指令（sw）需要用到RT								
	assign ForwardRTM = ((Instr_M[`RT] == A3_M) && (Tnew_M == 0) && (A3_M != 0) && RegWrite_M)? 2 :
													 ((Instr_M[`RT] == A3_W) && (A3_W != 0) && RegWrite_W)? 1 :
																															  0 ;
	
endmodule
