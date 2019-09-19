ori $0,$0,0
ori $1,$0,1
ori $2,$0,2
ori $3,$0,3
ori $4,$0,4
ori $5,$0,5
ori $6,$0,6
ori $7,$0,7
ori $8,$0,8
ori $9,$0,9
lui $10,10
ori $11,$0,11
ori $12,$0,12
ori $13,$0,13
ori $14,$0,14
ori $15,$0,15
ori $16,$0,16
ori $17,$0,17
ori $18,$0,18
ori $19,$0,19
ori $20,$0,20
ori $21,$0,21
ori $22,$0,22
ori $23,$0,23
ori $24,$0,24
ori $25,$0,25
ori $26,$0,26
ori $27,$0,27
lui $28,28
ori $29,$0,29
ori $30,$0,30
ori $31,$0,31
addu $t1,$t1,$t2
subu $t1,$t1,$t2
ori $t1,$0,8
sw $t1,0($0)
lw $t1,0($0)
ori $t1,$0,12
sw $t1,-4($t1)
sw $t1,4($t1)
ori $t1,$0,4
loop1:
lw $t1,4($t1)
lw $t1,0($t1)
beq $t1,$0,loop1
addu $t1,$t1,$8
beq $t1,$s0,loop2
nop
a3:
j a1
nop
nop
nop
nop
nop
a1:
jal a2
addu $t1,$ra,$t1
sw $ra,0($8)
addu $8,$8,$4
a2:
subu $t1,$ra,$t1
jr $ra
nop
loop2:
addu $t1,$t1,$t2
subu $t3,$t3,$t4
ori $t1,$t1,0x00001234
jal a3
addu $t1,$ra,$t1