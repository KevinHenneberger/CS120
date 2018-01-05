.data
newline: .asciiz "\n"

.text
main:
	li $a0, 5
	li $a1, 6
	
	jal setvalues
	
	li $v0, 1
	syscall

	la $a0, newline
	li $v0, 4
	syscall

	move $a0, $a1
	li $v0, 1
 	syscall

	li $v0, 10
	syscall

setvalues:
	addi $sp, $sp, -12
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $ra, 8($sp)

	addi $a0, $a0, 10
	addi $a1, $a1, 20
	
	li $v0, 1
	syscall

	la $a0, newline
	li $v0, 4
	syscall

	move $a0, $a1
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