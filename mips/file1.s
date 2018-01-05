.globl secondfile

.data
foo: .asciiz "First File.\n"

.text
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal secondfile

	la $a0, foo
	li $v0, 4
	syscall

	lw $ra, 0($sp)	
	addi $sp, $sp, 4

    li $v0, 10
	syscall