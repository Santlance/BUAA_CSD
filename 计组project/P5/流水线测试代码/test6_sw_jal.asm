ori $1,$0,0x300c
jal loop1
sw $31,-0x300c($1)
loop1:
jal loop2
ori $2,$0,0x928e
loop2:
sw $2,-0x3010($31)
jal loop3
sw $31,8($0)
loop3:
jal loop4
nop
nop
loop4:
sw $31,12($0)
