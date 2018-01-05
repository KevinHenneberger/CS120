.data
list: .word 1, 3, 5, 42, 5, 0

.text
main:
    la $s0, list
    li $s1, 0

    for:
    li $t1, 42
    lw $t0, 0($s0)

    beq $t0, $0, done1
    beq $t0, $t1, done2

    addi $s0, $s0, 4
    addi $s1, $s1, 1
    j for

    done1:
    addi $s1, $0, -1

    li $v0, 10
    syscall

    done2:
    li $v0, 10
    syscall