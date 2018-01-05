.data
foo: .asciiz "Second File.\n"

.text
.globl secondfile

secondfile:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, foo
	li $v0, 4
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4

	jr $ra