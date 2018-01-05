.data
newline: .asciiz "\n"
vara: .word 5
varb: .word 6

.text
main:
	la $a0, vara
	la $a1, varb

	jal setvalues

	lw $t0, ($a0)
	move $a0, $t0
	li $v0, 1
	syscall

	la $a0, newline
	li $v0, 4
	syscall

	lw $t1, ($a1)
	move $a0, $t1
	li $v0, 1
 	syscall

	li $v0, 10
	syscall

setvalues:
	addi $sp, $sp, -12
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $ra, 8($sp)

	lw $t0, ($a0)
	lw $t1, ($a1)

	addi $t0, $t0, 10
	addi $t1, $t1, 20

	sw $t0, ($a0)
	sw $t1, ($a1)
	
	move $a0, $t0
	li $v0, 1
	syscall

	la $a0, newline
	li $v0, 4
	syscall

	move $a0, $t1
	li $v0, 1
 	syscall

	la $a0, newline
	li $v0, 4
	syscall
	
	lw $ra, 8($sp)
	lw $a1, 4($sp)
	lw $a0, 0($sp)
	addi $sp, $sp, 12

	jr $ra