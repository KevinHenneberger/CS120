.data
space: .asciiz " "

.text
main:
    li $s0, 1
    li $t0, 10

    for:
        beq $s0, $t0, end
        sll $t1, $s0, 1

        move $a0, $t1
        li $v0, 1
        syscall

        la $a0, space
        li $v0, 4
        syscall

        addi $s0, $s0, 1
        j for 
    end:
        li $v0, 10
        syscall