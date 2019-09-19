`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:11 11/23/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
	input clk,reset
    );
	 
	 wire ifzero,  jump,  jr,  jal,  regdst,  memtoreg,  memwrite,  alusrc,  regwrite, ifgtz, ifeqz, jalr;
	 wire [31:0] memout,  memaddr,  memdata,  aluoprand_a,  aluoprand_b,  aluoutput_c,  ra_addr,  instr,  
					 pc_and_4,  regdata, regdata1, regdata2,  out32, memout_sel;
	 wire [15:0] imm16;
	 wire [5:0] opcode,  func;
	 wire [4:0] rs,  rt,  rd,  regaddr; 
	 wire [3:0] aluctr,npc_sel;/////////////////////////////////////////////
	 wire [2:0] load_sel;
	 wire [1:0] extop,store_sel,offset_10;
	 
	 //IFU
	 assign opcode[5:0] = instr[31:26], rs[4:0] = instr[25:21], rt[4:0] = instr[20:16],
			  rd[4:0] = instr[15:11], func[5:0] = instr[5:0], imm16[15:0] = instr[15:0],
			  ra_addr[31:0] = regdata1[31:0];
	 //ALU
	 assign aluoprand_a[31:0] = regdata1[31:0];
	 //DM
	 //assign memdata[31:0] = regdata2[31:0];
	 assign memaddr[31:0] = aluoutput_c[31:0];
	 //offset
	 assign offset_10 = instr[1:0];
	 
	 IFU ifu(
	 .clk(clk),// 1
	 .reset(reset),// 1
	 .ifzero(ifzero),// 1
	 .npc_sel(npc_sel),// 1
	 .jump(jump),// 1
	 .jr(jr),// 1
	 .ra_addr(ra_addr),// 32
	 .ifeqz(ifeqz),// 1
	 .ifgtz(ifgtz),
	 
	 .instr(instr),// 32
	 .pc_and_4(pc_and_4)// 32
	 );
	 
	 control controller(
	 .opcode(opcode),// 6
	 .func(func),// 6
	 .rt(rt),
	 
	 .jalr(jalr),// 1 /////////////////////////////////////////////////////////////////////////////
	 .jr(jr),// 1
	 .jal(jal),// 1
	 .jump(jump),// 1
	 .regdst(regdst),// 1
	 .npc_sel(npc_sel),// 1
	 .extop(extop),// 2
	 .memtoreg(memtoreg),// 1
	 .aluctr(aluctr),// 4
	 .memwrite(memwrite),// 1
	 .alusrc(alusrc),// 1
	 .regwrite(regwrite),// 1
	 .load_sel(load_sel),// 3
	 .store_sel(store_sel)
	 );
	 
	 GRF grf(
	 .rs(rs),// 5
	 .rt(rt),// 5
	 .regaddr(regaddr),// 5
	 .clk(clk),// 1
	 .reset(reset),// 1
	 .regwrite(regwrite),// 1
	 .regdata(regdata),// 32
	 .pc_and_4(pc_and_4),// 32
	 
	 .regdata1(regdata1),// 32
	 .regdata2(regdata2)// 32
	 );
	 
	 EXT ext(
	 .imm16(imm16),// 16
	 .extop(extop),// 2
	 
	 .out32(out32)//32
	 );
	 
	 ALU alu(
	 .aluctr(aluctr),// 4
	 .aluoprand_a(aluoprand_a),// 32
	 .aluoprand_b(aluoprand_b),// 32
	 
	 .aluoutput_c(aluoutput_c),// 32
	 .ifzero(ifzero),// 1
	 .ifgtz(ifgtz),// 1
	 .ifeqz(ifeqz)// 1
	 );
	 
	 DM dm(
	 .memwrite(memwrite),// 1
	 .clk(clk),// 1
	 .reset(reset),// 1
	 .memdata(memdata),// 32
	 .memaddr(memaddr),// 32
	 .pc_and_4(pc_and_4),// 32
	 
	 .memout(memout)// 32
	 );
	 
	 MuxRegRd muxregin(
	 .rt(rt),// 5
	 .rd(rd),// 5
	 .jal(jal),// 1
	 .regdst(regdst),// 1
	 .ifgtz(ifgtz),////////////////////////////////////
	 .ifeqz(ifeqz),///////////////////////////////////
	 .npc_sel(npc_sel),////////////////////////////////
	 .jalr(jalr),// 1 //////////////////////////////////////
	 
	 .regaddr(regaddr)// 5
	 );
	 
	 MuxALUNum muxaluin(
	 .out32(out32),// 32
	 .regdata2(regdata2),// 32
	 .alusrc(alusrc),// 1
	 
	 .aluoprand_b(aluoprand_b)// 32
	 );
	 
	 MuxRegData muxregdata(
	 .aluoutput_c(aluoutput_c),// 32
	 .memout_sel(memout_sel),// 32
	 .pc_and_4(pc_and_4),// 32
	 .jal(jal),// 1
	 .memtoreg(memtoreg),// 1
	 .ifgtz(ifgtz),/////////////////////
	 .ifeqz(ifeqz),///////////////////////
	 .npc_sel(npc_sel),//////////////////////////
	 .jalr(jalr),// 1 //////////////////////////////// 
	 
	 .regdata(regdata)// 32
	 );
	 
	 MEMOUT mem_out(
	 .load_sel(load_sel),// 3
	 .memout(memout),// 32
	 .offset_10(offset_10),// 2
	 
	 .memout_sel(memout_sel)// 32
	 );
	 
	 MEMDATA mem_data(
	 .regdata2(regdata2),// 32
	 .store_sel(store_sel),// 2
	 .offset_10(offset_10),// 2
	 
	 .memdata(memdata)// 32
	 );
	 
	 
endmodule
//begin别换行
//记得在顶层模块连线
//注意1和l b和h
//注意有符号运算
//记得搞各种运算的时候＋括号
//rotrv拼接成64位完事，还可以手动换成constant
//还得防止课下的op和func与课上冲突的问题
//判断32位只有一个1加起来完事
//记得把MARS改成.data 0 
//用mark_all 在mips和control里面标记处所有相似的指令的点修改
//记得看判断条件有没有少加