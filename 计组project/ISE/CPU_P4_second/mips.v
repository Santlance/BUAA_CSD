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
	 
	 wire ifzero,  npc_sel,  jump,  jr,  jal,  regdst,  memtoreg,  memwrite,  alusrc,  regwrite;
	 wire [31:0] memout,  memaddr,  memdata,  aluoprand_a,  aluoprand_b,  aluoutput_c,  ra_addr,  instr,  
					 pc_and_4,  regdata, regdata1, regdata2,  out32;
	 wire [15:0] imm16;
	 wire [5:0] opcode,  func;
	 wire [4:0] rs,  rt,  rd,  regaddr; 
	 wire [3:0] aluctr;
	 wire [1:0] extop;
	 
	 //IFU
	 assign opcode[5:0] = instr[31:26], rs[4:0] = instr[25:21], rt[4:0] = instr[20:16],
			  rd[4:0] = instr[15:11], func[5:0] = instr[5:0], imm16[15:0] = instr[15:0],
			  ra_addr[31:0] = regdata1[31:0];
	 //ALU
	 assign aluoprand_a[31:0] = regdata1[31:0];
	 //DM
	 assign memdata[31:0] = regdata2[31:0];
	 assign memaddr[31:0] = aluoutput_c[31:0];
	 
	 IFU ifu(
	 .clk(clk),// 1
	 .reset(reset),// 1
	 .ifzero(ifzero),// 1
	 .npc_sel(npc_sel),// 1
	 .jump(jump),// 1
	 .jr(jr),// 1
	 .ra_addr(ra_addr),// 32
	 
	 .instr(instr),// 32
	 .pc_and_4(pc_and_4)// 32
	 );
	 
	 control controller(
	 .opcode(opcode),// 6
	 .func(func),// 6
	 
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
	 .regwrite(regwrite)// 1
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
	 .ifzero(ifzero)// 1
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
	 .memout(memout),// 32
	 .pc_and_4(pc_and_4),// 32
	 .jal(jal),// 1
	 .memtoreg(memtoreg),// 1
	 
	 .regdata(regdata)// 32
	 );
endmodule