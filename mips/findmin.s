.data
list: .word 9, 5, 30, 8, 2, 11, 0
	
.text
main:
	la $a0, list
	jal findmin
    move $s0, $v0

    li $v0, 10
    syscall

findmin:
	lw $v0, 0($a0)

loop:
    lw $s0, 0($a0)
	beq $s0, $0, done
	blt $v0, $s0, skip
	move $v0, $s0

skip:
    addi $a0, $a0, 4
	j loop

done:
	jr $ra