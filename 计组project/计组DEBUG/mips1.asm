.data
	mem: .space 400
.text
	ori $t0 $0 6
	ori $t1 $0 8
	lui $t2 0xffff
	ori $t2 $t2 0xffff
	addi $t3 $t2 -2
	lui $t4 0xfabc
	lui $t5 0x6543
	ori $t4 $t4 0xffff
	ori $t5 $t5 0xabcd
	blez $t2 mark1
	mult $t0 $t1
	
	mark1_back:
	lui $s0 0xaaaa
	mfhi $t9
	mflo $t8
	sw $t8 0($0)
	sh $t9 2($0)
	sb $t9 3($0)
	sb $t9 0($0)
	lhu $t8 2($0)
	lbu $t8 0($0)
	lh $t9 0($0)
	lb $t8 3($0)
	mult $t9 $t8
	div $t8 $t9
	multu $t2 $t4
	mfhi $s7
	mflo $s6
	mtlo $t9
	mthi $t8
	mfhi $s7
	mflo $s6
	jal mark2
	addi $t8 $t8 2
	
	ori $s4 $0 0xf0
	sw $t8 -16($s4)
	lb $t8 -15($s4)
	jr $t7
	mfhi $t7
	
	mark1:
	mfhi $t9
	mflo $t8
	mthi $t8
	slt $s0 $t4 $t2
	bne $s0 $0 mark1_back
	div $t4 $t5
	
	mark2:
	addi $t6 $ra -4
	jalr $t7 $t6
	multu $t2 $t4
	mflo $t8
	addu $t8 $t7 $t8
	addi $t8 $t8 -1
	bltz $t8 mark3
	addi $t8 $t8 1
	
	beq $t8 $0 mark4
	mult $t7 $t9
	
	mark4:
	mthi $t1
	mfhi $s7
	mflo $s6
	jr $t1
	
	mark3:
	ori $t0 $0 0x30cc
	jalr $t1 $t0
	addi $t1 $t1 4
	lui $s0 0xbbbb
	lui $s0 0xcccc	#30f8
	ori $s1 0x3104
	jalr $s2 $s1
	addi $s2 $s1 8
	lui $s3 0xaaaa
	lui $s4 0xbbbb
	bgtz $s3 mark5
	sh $s3 4090($0)
	addi $s3 $s3 -1
	jr $s2
	xor $s3 $s3 $s4
	
	mark5:
	mthi $s3 
	mtlo $s4
	mult $s3 $s4
	mflo $t2
	bgez $t2 mark6
	lui $s7 0xffff
	
	
	mark6:
	or $t2 $s7 $0
	slt $t3 $t2 $0
	sltu $t3 $t2 $0
	xori $t3 $t2 0x1bdc
	slti $t4 $t3 -3
	sltiu $t4 $t3 3
	ori $t0 $0 1
	ori $t1 $0 3	#3158
	ori $t2 $0 0x3168
	jalr $s7 $t2
	addi $t1 $t1 -1
	beq $t0 $t1 mark7
	nop
	jr $s7
	addi $s7 $s7 -8
	
	mark7:
	divu $s7 $s6
	mfhi $s7
	mflo $s6
	sh $s7 3332($0)
	ori $t0 $0 4096
	sb $s6 -1600($t0)