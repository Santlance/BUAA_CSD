module control_unit(op,func,z,wreg,regrt,jal,m2reg,shift,aluimm,sext,wmem,aluc,pcsource);
		input [5:0] op,func;
		input z;
		output wreg,regrt,jal,m2reg,shift,aluimm,sext,wmem;
		output [3:0] aluc;
		output [1:0] pcsource;
	
		wire r_type = ~|op;
		wire i_add  = r_type& func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0];
		wire i_addu = r_type& func[5]&~func[4]&~func[3]&~func[2]&~func[1]& func[0];
		wire i_sub  = r_type& func[5]&~func[4]&~func[3]&~func[2]& func[1]&~func[0];
		wire i_subu = r_type& func[5]&~func[4]&~func[3]&~func[2]& func[1]& func[0];
		wire i_and  = r_type& func[5]&~func[4]&~func[3]& func[2]&~func[1]&~func[0];
		wire i_or   = r_type& func[5]&~func[4]&~func[3]& func[2]&~func[1]& func[0];
		wire i_xor  = r_type& func[5]&~func[4]&~func[3]& func[2]& func[1]&~func[0];
		wire i_nor  = r_type& func[5]&~func[4]&~func[3]& func[2]& func[1]& func[0];
		wire i_slt  = r_type& func[5]&~func[4]& func[3]&~func[2]& func[1]&~func[0];
		wire i_sltu = r_type& func[5]&~func[4]& func[3]&~func[2]& func[1]& func[0];
		wire i_sll  = r_type&~func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0];
		wire i_srl  = r_type&~func[5]&~func[4]&~func[3]&~func[2]& func[1]&~func[0];
		wire i_sra  = r_type&~func[5]&~func[4]&~func[3]&~func[2]& func[1]& func[0];
		wire i_sllv = r_type&~func[5]&~func[4]&~func[3]& func[2]&~func[1]&~func[0];
		wire i_srlv = r_type&~func[5]&~func[4]&~func[3]& func[2]& func[1]&~func[0];
		wire i_srav = r_type&~func[5]&~func[4]&~func[3]& func[2]& func[1]& func[0];
		wire i_jr   = r_type&~func[5]&~func[4]& func[3]&~func[2]&~func[1]&~func[0];

		wire i_addi = ~op[5]&~op[4]& op[3]&~op[2]&~op[1]&~op[0];
		wire i_addiu= ~op[5]&~op[4]& op[3]&~op[2]&~op[1]& op[0];
		wire i_andi = ~op[5]&~op[4]& op[3]& op[2]&~op[1]&~op[0];
		wire i_ori  = ~op[5]&~op[4]& op[3]& op[2]&~op[1]& op[0];
		wire i_xori = ~op[5]&~op[4]& op[3]& op[2]& op[1]&~op[0];
		wire i_lw   =  op[5]&~op[4]&~op[3]&~op[2]& op[1]& op[0];
		wire i_sw   =  op[5]&~op[4]& op[3]&~op[2]& op[1]& op[0];
		wire i_beq  = ~op[5]&~op[4]&~op[3]& op[2]&~op[1]&~op[0];
		wire i_bne  = ~op[5]&~op[4]&~op[3]& op[2]&~op[1]& op[0];
		wire i_slti = ~op[5]&~op[4]& op[3]&~op[2]& op[1]&~op[0];
		wire i_sltiu= ~op[5]&~op[4]& op[3]&~op[2]& op[1]& op[0];
		wire i_lui  = ~op[5]&~op[4]& op[3]& op[2]& op[1]& op[0];
		wire i_j    = ~op[5]&~op[4]&~op[3]&~op[2]& op[1]&~op[0];
		wire i_jal  = ~op[5]&~op[4]&~op[3]&~op[2]& op[1]& op[0];
	 
		assign wreg  = 	i_add  	| i_addu | i_sub  | i_subu | i_and  | 
								i_or   	| i_xor  | i_nor  | i_slt  | i_sltu | 
								i_sll  	| i_srl  | i_sra  | i_sllv | i_srlv | 
								i_srav 	| i_addi | i_addiu| i_andi | i_ori  |	 
								i_xori 	| i_lw   | i_slti | i_sltiu| i_lui  | 
								i_jal  	;
		
		assign regrt = 	i_addi 	| i_addiu| i_andi | i_ori  | i_xori | 
								i_lw   	| i_sltiu| i_sltiu| i_lui  ;

		assign jal   =  	i_jal  	;	

		assign m2reg = 	i_lw   	;

		assign shift = 	i_sll  	| i_srl  | i_sra  ;

		assign aluimm=		i_addi 	| i_addiu| i_andi | i_ori  | i_xori |
								i_lw	| i_sw	 | i_slti | i_sltiu	| i_lui	 ;

		assign sext  =		i_addi 	| i_addiu| i_lw   | i_sw   | i_beq  |
								i_bne   | i_slti | i_sltiu;

		assign aluc[3]	=  i_slt  | i_sltu | i_sll  | i_srl  | i_sra  |
								i_sllv | i_srlv | i_srav | i_slti | i_sltiu|
								i_lui  ;

		assign aluc[2]  = i_and  | i_or   | i_xor  | i_nor  | i_sll  |
								i_srl  | i_sra  | i_sllv | i_srlv | i_srav |
								i_andi | i_ori  | i_xori ;

		assign aluc[1]  = i_add  | i_sub  | i_xor  | i_nor  | i_slt  |
								i_sltu | i_sll  | i_sllv | i_addi | i_xori |
								i_lw   | i_sw   | i_beq  | i_bne  | i_slti |
								i_sltiu;

		assign aluc[0]  = i_sub  | i_subu | i_or   | i_nor  | i_slt  |
								i_srl  | i_srlv | i_ori  | i_slti | i_beq  |
								i_bne  ;

		assign wmem	=  	i_sw	;

		assign pcsource[1] =  i_jr  | i_j  | i_jal  ;

		assign pcsource[0] =  i_beq & z | i_bne & ~z | i_j | i_jal  ;

endmodule 
















