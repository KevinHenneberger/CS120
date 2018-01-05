.data
list: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0

.text
main:
    la $a0, list
    li $s0, 0

    for:
    lw $t0, 0($a0)
    beq $t0, $0, done
    add $s0, $s0, $t0
    addi $a0, $a0, 4
    j for

    done:
    li $v0, 10
    syscall