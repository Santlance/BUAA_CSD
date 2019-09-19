# basic compute
ori $t0 $0 1
ori $t1 $0 2
addu $t2 $t0 $t1
add $t3 $t2 $t1
lui $t4 0xffff
ori $t4 $t4 0xfff0
addu $t5 $t3 $t4
add $t6 $t5 $t4
lui $t0 0x7fff
ori $t0 $t0 0x1234
addiu $t0 $t0 0xffff
addi $t0 $t0 0xffff
add $t7 $t0 $t6
lui $t8 0xaaaa
addu $t9 $t7 $t8
addiu $t9 $t9 0xffffaaaa
addiu $t9 $t9 -1
addi $t9 $t9 -1
subu $s0 $t9 $t7
subu $s1 $t7 $t9
subu $s2 $s1 $s0
lui $t0 0xffff
ori $t0 $t0 0xfff0
ori $t1 $0 10
sub $s3 $t1 $t0
sub $s4 $t0 $t1
sub $s3 $s4 $s3

# load store

addi $s7 $0 8
addi $t4 $t4 -1
sw $t4 -8($s7)
lb $t0 -8($s7)
addi $t5 $t5 2
sb $t5 -4($s7)
lbu $t1 -7($s7)
lh $t2 -4($s7)
subu $t6 $t6 $s7
sb $t6 -3($s7)
lhu $t3 -4($s7)
sh $t7 -2($s7)
lw $t0 -4($s7)
ori $s0 $s0 1
sw $s0 0($s7)
ori $s1 $s1 2
sh $s1 4($s7)
lw $t1 0($s7)
addi $s2 $s2 -2
sb $s2 6($s7)
lh $t3 6($s7)
sub $s3 $s3 $s7
sb $s3 7($s7)
lbu $t0 7($s7)

# logic
lui $t0 0xabcd
lui $t1 0xcdef
ori $t0 $t0 0x1234
ori $t1 $t1 0x5678
and $t2 $t0 $t1
or $t3 $t2 $t1
and $t4 $t3 $t2
or $t5 $t4 $t3
andi $t6 $t5 0xa8b6
ori $t7 $t6 0x12b4
xor $t8 $t7 $t6
xor $t9 $t8 $t7
xori $t0 $t9 0x7823
andi $t1 $t0 0xffff
nor $t2 $t1 $t0
nor $t3 $t2 $t1
xori $t4 $t3 0xabcd
nor $t5 $t4 $t3

#branch
ori $t0 $0 1
ori $t1 $0 2
lui $t2 0xffff
ori $t2 $t2 0xffff
sub $t2 $t2 $t0
sub $t2 $t2 $t0
bne $t0 $t1 mark1
lui $t4 0xffff
mark1_back:
ori $s0 $0 1
beq $t3 $t4 mark2
addi $t3 $t3 1
mark2_back:
bltz $t2 mark3
addi $t2 $t2 1
mark3_back:
addi $t2 $t2 1
blez $t2 mark4
subu $t2 $t2 $t1
mark4_back:
bgtz $t2 mark5
add $t2 $t2 $t1
mark5_back:
bgez $t2 mark6
addi $t2 $t2 1
mark6_back:
j end
nop

mark1:
ori $s0 $0 2
bne $t4 $0 mark1_back
lui $t3 0xffff
mark2:
addi $t4 $t4 1
beq $t3 $t4 mark2_back
nop 
mark3:
sub $t2 $t2 $t0
bltz $t2 mark3_back
nop
mark4:
blez $t2 mark4_back
addi $t2 $t2 112
mark5:
bgtz $t2 mark5_back
sub $t2 $t2 $t1
mark6:
bgez $0 mark6_back

end:
#shift

lui $t0 0xfff0
ori $t0 $t0 0xabcd
ori $t1 $0 3
sll $t2 $t0 2
sllv $t2 $t2 $t1
srl $t2 $t2 3
addi $t1 $t1 -1
srlv $t2 $t2 $t1
addi $t1 $t1 3
srlv $t2 $t2 $t1
lui $t3 0x8000
or $t2 $t3 $t2
sra $t2 $t2 4
addi $t1 $t1 -3
srav $t2 $t2 $t1
lui $t3 0x7fff
ori $t3 $t3 0xffff
and $t2 $t2 $t3
sra $t2 $t2 2
srav $t2 $t2 $t1

#jump
j mark7
ori $s0 $0 0xffff
mark7_back:
jal mark8
nop
ori $s0 $0 0xaaaa
addiu $s3 $s3 8
jr $s3
nop
ori $s0 $0 0xbbbb
j mark9
nop

mark7:
j mark7_back
addu $s1 $s0 $s0
mark8:
addiu $s2 $ra 16
jalr $s3 $s2
lui $s7 0xffff
mark9:
jr $ra
nop

jal mark10
lui $s6 0xffff
mark10:
addi $s5 $ra 16
jalr $s4 $s5
lui $t7 0xbbbb
lui $t9 0xcccc
j end_2
ori $s7 0xffff
lui $t9 0xffff
lui $t8 0xaaaa
jr $s4
end_2:

#mult_div
ori $t0 $0 3
ori $t1 $0 4
lui $t2 0xffff
ori $t2 $t2 0xfff0
lui $t3 0x7000
ori $t3 $t3 0xffff
lui $t4 0xabcd
ori $t4 $t4 0xefef
mult $t0 $t1
mflo $s0
mthi $t4
mfhi $t4
mult $t2 $t3
mfhi $s1
mflo $s2
multu $t3 $t2
mfhi $s1
mflo $s2
or $s3 $s1 $0
mthi $s2
mtlo $s3
multu $t2 $t4
mfhi $s3
mflo $s4
div $t0 $t1
mfhi $s0
mflo $s1
div $t2 $t0
mfhi $s2
mflo $s3
divu $t2 $t0
mfhi $s2
mflo $s3
div $t3 $t4
mfhi $s2
mflo $s3
mthi $0
mtlo $0
mflo $s3
mfhi $s2
divu $t4 $t3
mfhi $s0
mflo $s1

#setbit
ori $t0 $0 2
ori $t1 $0 5
lui $t2 0x7000
lui $t3 0xffff
ori $t3 $t3 0xffff
slt $s0 $t0 $t3
slt $s0 $t3 $t0
slt $s0 $t3 $t3
slti $s1 $t2 0x7fff
slti $s1 $t3 0
slti $s1 $t3 -1
sltu $s2 $t0 $t3
sltu $s2 $t3 $t2
sltiu $s3 $t1 0x0fff
sltiu $s3 $t3 1