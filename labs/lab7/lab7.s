.data
space: .asciiz " "
newline: .asciiz "\n"

.text
main: 
    li $s2, 11
    li $s0, 0

    fori: 
    beq $s0, $s2, donei
    li $s1, 0

    forj: 
    beq $s1, $s2, donej

    mul $a0, $s0, $s1

    jal f1
    
    move $a0, $v0
    li $v0, 1
    syscall 

    la $a0, space
    li $v0, 4
    syscall 

    addi $s1, $s1, 1
    j forj

    donej:

    la $a0, newline
    li $v0, 4
    syscall

    addi $s0, $s0, 1
    j fori

    donei:
    li $v0, 10
    syscall

f1:
    mul $v0, $a0, $a0
    jr $ra
