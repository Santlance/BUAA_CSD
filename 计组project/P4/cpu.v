`timescale 1ns / 1ps
module cpu(clk,reset,instr,dmem_out,dmem_addr,dmem_data,dmem_we,imem_addr);
		input clk,reset;
		input [31:0] instr,dmem_out;
		output [31:0] dmem_addr,dmem_data,imem_addr;
		output dmem_we;
		//===============以输出端命名================
		//===============Control_Unit==============
		wire m2reg;
		wire [1:0] pcsource;
		wire wmem;
		wire [3:0] aluc;
		wire shift;
		wire aluimm;
		wire wreg;
		wire regrt;
		wire jal;
		wire sext;
		//==================ALU====================
		wire zero,carry,negative,overflow;
		wire [31:0] r;
		//==================PC=====================
		wire [31:0] pc_out;
		//==================IMEM===================
		wire [5:0] op;
		assign op = instr[31:26];
		wire [5:0] func;
		assign func = instr[5:0];
		wire [4:0] rs;
		assign rs = instr[25:21];
		wire [4:0] rt;
		assign rt = instr[20:16];
		wire [4:0] rd;
		assign rd = instr[15:11];
		wire [4:0] sa;
		assign sa = instr[10:6];
		wire [15:0] imm;
		assign imm = instr[15:0];
		wire [25:0] addr;
		assign addr = instr[25:0];
		//==================DMEM===================
		wire [31:0] dmem_out;
		//=================Regfiles================
		wire [31:0] qa;
		wire [31:0] qb;
		//==================Other==================
		wire [31:0] npc_0;			//pc+1;
		assign npc_0 = pc_out + 1;
		wire [31:0] npc_1;			//BranchAddr;
		wire [31:0] extend_out;			//extend;
		wire [4:0] wn;
		wire [4:0] mux_regrt;
		wire [31:0] mux_jal;
		wire [31:0] mux_aluimm;
		wire [31:0] mux_shift;
		wire [31:0] mux_m2reg;
		wire [31:0] mux_npc;	
		wire [31:0] sa_ext,imm_ext;
		wire regfiles_we,alu_overflow;
		
		assign dmem_we = wmem;
		assign dmem_addr = r;
		assign dmem_data = qb;
		assign imem_addr = pc_out;
		assign alu_overflow = !m2reg & !jal & overflow;
		assign regfiles_we = wreg & !alu_overflow;
		ext #(5) ext_sa(sa,1'b0,sa_ext);
		ext #(16) ext_imm(imm,sext,imm_ext);
		assign npc_1 = pc_out + imm_ext;
		control_unit cu(op,func,zero,wreg,regrt,jal,m2reg,shift,aluimm,sext,wmem,aluc,pcsource);
		PC pc(clk,reset,mux_npc,pc_out);
		mux_2 mux_shift_unit(qa,sa_ext,shift,mux_shift);
		mux_2 mux_aluimm_unit(qb,imm_ext,aluimm,mux_aluimm);
		mux_2 mux_m2reg_unit(r,dmem_out,m2reg,mux_m2reg);
		mux_2 mux_jal_unit(mux_m2reg,npc_0,jal,mux_jal);
		mux_2 #(5) mux_regrt_unit(rd,rt,regrt,mux_regrt);
		assign wn = mux_regrt | {5{jal}};				//jal : r31 <-- p4;
		mux_4 next_pc(npc_0,npc_1,qa >> 2,{pc_out[31:26],addr},pcsource,mux_npc);
		regfiles regfiles(clk,reset,regfiles_we,rs,rt,wn,mux_jal,qa,qb);
		alu alu_unit(mux_shift,mux_aluimm,aluc,r,zero,carry,negative,overflow);
		
endmodule
