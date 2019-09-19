`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:57 12/04/2018 
// Design Name: 
// Module Name:    PIPELINE_M 
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
module PIPELINE_M(
	input CLK,
	input Reset,
	input [31:0] ALUOutput_M,//存取内存的地址
	input [31:0] RTV_M,
	input [31:0] Instr_M,
	input ForwardRTM,
	input [31:0] PCPlus4_M,
	input [31:0] MUXRFWDOut,
	output [31:0] MemOut
	);
	wire [1:0] StoreSel;
	wire MemWrite;
	wire [31:0] MFRTMOut, MemWD;
	
	DM dm(
	.CLK(CLK),
	.Reset(Reset),
	.MemAddr(ALUOutput_M),
	.MemWD(MemWD),
	.MemWrite(MemWrite),
	.PCPlus4_M(PCPlus4_M),  
	
	.MemOut(MemOut)
	);
	
	StoreBE storebe(						//选择STORE的东西
	.MFRTMOut(MFRTMOut),
	.StoreSel(StoreSel),
	.MemRD(MemOut),                  //SW SB的特殊性，得传入之前的数据然后拼接
	.BSel(ALUOutput_M[1:0]),         //注意SB SH也是要区分字节的
	
	.MemWD(MemWD)
	);
	
	CONTROLLER_M controller_m(
	.Instr_M(Instr_M),
	
	.StoreSel(StoreSel),
	.MemWrite(MemWrite)
	);
	
	MUX_2_1_32 MFRTM(
	.A(RTV_M),
	.B(MUXRFWDOut),
	.Sel(ForwardRTM),
	
	.C(MFRTMOut)
	);
endmodule
//////////////////////////////////////////////////////////////////////////////////
module DM(
	input CLK,
	input Reset,
	input MemWrite,
	input [31:0] MemAddr,
	input [31:0] MemWD,
	input [31:0] PCPlus4_M,
	output [31:0] MemOut
    );
	reg [31:0] DM[0:4095];
	
	assign MemOut = DM[MemAddr[13:2]];								//连接输出
	
	integer i;
	initial 													//初始化数据存储器
	begin
		for(i = 0;i < 1024 ;i = i + 1)
			DM[i] <= 0;
	end
	
	always @ (posedge CLK)begin								//在时钟上升沿
		if(Reset)begin												//复位信号全部置0
			for(i = 0;i < 1024 ;i = i + 1)
				DM[i] <= 0;
		end
		else if(MemWrite)begin										//否则如果存数信号有效就存数
		$display("%d@%h: *%h <= %h", $time,PCPlus4_M - 4, {{MemAddr[31:2]},{2'b00}},MemWD);
			DM[MemAddr[13:2]] <= MemWD;
		end
	end

endmodule
//////////////////////////////////////////////////////////////////////////////////
module StoreBE(
	input [31:0] MFRTMOut,
	input [1:0] StoreSel,
	input [1:0] BSel,
	input [31:0] MemRD,
	output [31:0] MemWD
	);
	//StoreSel
	//00 sw
	//01 sb
	//10 sh
	wire [31:0] sw_d, sb_d, sh_d;
	
	assign sw_d = MFRTMOut;
	
	assign sb_d = (BSel == 2'b00)? {{MemRD[31:8]},{MFRTMOut[7:0]}} 						:
					  (BSel == 2'b01)? {{MemRD[31:16]},{MFRTMOut[7:0]},{MemRD[7:0]}}	:
					  (BSel == 2'b10)? {{MemRD[31:24]},{MFRTMOut[7:0]},{MemRD[15:0]}}	:
					  (BSel == 2'b11)? {{MFRTMOut[7:0]},{MemRD[23:0]}}						:
																				0							;
	
	assign sh_d = (BSel[1] == 0)?{{MemRD[31:16]},{MFRTMOut[15:0]}} : {{MFRTMOut[15:0]},{MemRD[15:0]}};
	
	assign MemWD = (StoreSel == 2'b00)? sw_d :
						(StoreSel == 2'b01)? sb_d :
						(StoreSel == 2'b10)? sh_d :
													sw_d ;

endmodule 