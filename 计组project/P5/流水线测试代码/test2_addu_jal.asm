ori $1,$0,122
jal loop1
addu $2,$31,$1

loop1:
ori $3,$0,239
jal loop2
addu $4,$3,$31
loop2:
jal loop3
ori $5,$0,23
loop3:
addu $6,$31,$5
jal loop4
ori $7,$0,55
loop4:
addu $8,$7,$31
jal loop5
ori $9, $0, 64
loop5:
ori $9, $9, 32
addu $10, $31,$9
jal loop6
ori $11, $0, 128
loop6:
ori $11, $11, 4
addu $12, $11, $31



