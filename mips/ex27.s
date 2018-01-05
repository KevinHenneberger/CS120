.data
list: .word 2, 7, 4, 5, 8, 6, 9, 1, 3, 10

.text
main:
    la $s0, list

    li $t0, 0
    li $t1, 10

    for:
    beq $t0, $t1, done

    lw $a0, 0($s0)
    li $a1, 5

    jal compare

    move $a0, $v0
    li $v0, 1
    syscall

    addi $t0, $t0, 1
    addi $s0, $s0, 4
    j for

    done:
    li $v0, 10
    syscall

compare:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    jal subtract

    lw $ra, 0($sp)
    addi $sp, $sp, 4

    blt $v0, $0, else
    addi $v0, $0, 1
    j skip

    else:
    add $v0, $0, $0

    skip:
    jr $ra

subtract:
    sub $v0, $a0, $a1
    jr $ra