.text
main:
    addi $a0, $0, 2
    addi $a1, $0, 3

    jal f1
    
    move $a0, $v0

    li $v0, 1
    syscall

    li $v0, 10
    syscall

# return (($a0 + 5) * ($a1 + 6))^2
f1:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    addi $t0, $a0, 5
    addi $t1, $a1, 6
    mul $a0, $t0, $t1

    jal f2

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    
    jr $ra

# return $a0^2
f2:
    mul $v0, $a0, $a0
    jr $ra