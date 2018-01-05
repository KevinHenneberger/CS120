.data
list: .word 1, 2, 3, 4, 5, 0

.text
main:
    la $s0, list

    add $s2, $s2, $0

    for: 
        lw $t0, 0($s0)

        beq $t0, $0, done

        add $s2, $s2, $t0

        addi $s0, $s0, 4

        j for
    done: 
        li $v0, 10
        syscall