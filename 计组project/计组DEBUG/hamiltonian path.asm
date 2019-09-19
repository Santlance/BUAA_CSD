.macro read_int(%x)
    li $v0 5
    syscall
    move %x $v0
.end_macro

.data 
  ab: .space 10000
.text 
read_int($s1)  #put n into s1
read_int($s2) #put m into s2

li $t0,0  #set t0  as i
la $s0,ab  #put ab address into t3
li $s3,0 #µİ¹é²ãÊı¼ÆÊı
li $s4,1 #t------(fun(1))
li $s5,0 #flag
for_read_begin:
  slt $t1,$t0,$s2
  beq $t1,$zero,for_read_end
  read_int($t4)  #put a into t4
  read_int($t5)  #put b into t5
  li $t6,9
  mult $t6,$t4
  mflo $t6  #9*a
  add $t7,$t6,$t5  #9*a+b
  li $t6,4
  mult $t6,$t7
  mflo $t7  #4*(9*a+b)
  addu $t7,$s0,$t7  #current address
  li $t6,1
  sw $t6,0($t7)  #set ab[a][b] as 1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  li $t6,9
  mult $t6,$t5
  mflo $t6
  add $t7,$t6,$t4
  li $t6,4
  mult $t6,$t7
  mflo $t7 #4*(9*b+a)
  addu $t7,$s0,$t7  #current address
  li $t6,1
  sw $t6,0($t7)  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ### bulid linjie juzhen
  addi $t0,$t0,1 #i++  
  j for_read_begin
for_read_end:
sw $ra,0($sp)
addi $sp,$sp,-4
jal fun #enter µİ¹é
beq $s5,$0,no
j end
################
fun:
  addi $s3,$s3,1 #cnt++
  beq $s3,$s1,if_1  #if cnt==n
  j else
  if_1:
    li $t6,9
    mult $t6,$s4
    mflo $t6  #9*t
    addi $t7,$t6,1  #9*t+1
    li $t6,4
    mult $t6,$t7
    mflo $t7  #4*(9*t+1)
    addu $t7,$s0,$t7  #current address
    lw $t1,0($t7)  # put ab[t][1] into t1
    beq $t1,1,if_2  #if ab[t][1]==1
    jr $ra
  if_2:
    beq $s5,$0,yes  #if flag==0
    jr $ra
  else:
    li $t1,1
    li $t6,9
    mult $t6,$s4
    mflo $t6  #9*t
    li $t7,4
    mult $t6,$t7
    mflo $t7  #4*(9*t+0)
    addu $t7,$s0,$t7  #current address
    move $s6,$t7
    sw $t1,0($t7)  # set ab[t][0] as 1
    ##for_fun
    li $t0,1 #set $t0 as i
    addi $t1,$s1,1 #set t1 as n+1
    for_fun_begin:
     slt $t2,$t0,$t1
     beq $t2,$0,for_fun_end #for(i=1;i<=n;i++)
     li $t6,9
     mult $t6,$s4
     mflo $t6  #9*t
     add $t6,$t0,$t6 #9*t+i
     li $t7,4
     mult $t6,$t7
     mflo $t7  #4*(9*t+i)
     addu $t7,$s0,$t7  #current address
     lw $t2,0($t7)  # put ab[t][i] into t2
     beq $t2,1,if_3  #if(ab[t][i]==1)
     addi $t0,$t0,1 #i++
     j for_fun_begin
     if_3:
       li $t6,9
       mult $t6,$t0
       mflo $t6  #9*i
       li $t7,4
       mult $t6,$t7
       mflo $t7  #4*(9*i+0)
       addu $t7,$s0,$t7  #current address
       lw $t2,0($t7)  # put ab[i][0] into t2
       beq $t2,$0,digui #if ab[i][0]==0
       addi $t0,$t0,1 # or i++,back to for_fun
       j for_fun_begin
     for_fun_end:
     jr $ra
  digui:
    move $s4,$t0  # save i,(t=i)
    sw $ra,0($sp) 
    addi $sp,$sp,-4
    sw $t0,0($sp)
    addi $sp,$sp,-4
    sw $s6,0($sp)
    addi $sp,$sp,-4
    jal fun
    addi $sp,$sp,4
    lw $s6,0($sp)
    addi $sp,$sp,4
    lw $t0,0($sp)
    addi $sp,$sp,4
    lw $ra,0($sp)
    li $t6,9
    mult $t6,$t0
    mflo $t6  #9*i
    li $t7,4
    mult $t6,$t7
    mflo $t7  #4*(9*i+0)
    addu $t7,$s0,$t7  #current address
    sw $0,0($t7)  # set ab[i][0] as 0
    addi $s3,$s3,-1  #cnt--
    addi $t0,$t0,1  #i++
    j for_fun_begin
yes:
   li $t4,1
   move $s5,$t4 #flag=1
   move $a0,$t4
   li $v0,1 #printf("1\n")
   syscall
   j end
no:
   move $a0,$0
   li $v0,1
   syscall
   j end   

end:
  li $v0,10
  syscall
