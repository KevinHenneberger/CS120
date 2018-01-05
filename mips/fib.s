.data
space: .asciiz " "

.text
main:
    addi $s0, $0, 1
    addi $s1, $0, 1
    add $t0, $0, $0
    addi $t1, $0, 10

    while:
        beq $t0, $t1, end

        add $s2, $s0, $s1   # c = a + b;
        move $s0, $s1       # a = b;
        move $s1, $s2       # b = c;

        move $a0, $s2
        li $v0, 1
        syscall 

        la $a0, space
        li $v0, 4
        syscall

        addi $t0, $t0, 1
        j while
    end:
        li $v0, 10
        syscall