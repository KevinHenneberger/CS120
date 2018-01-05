.data
name1: .asciiz "aaa"
name2: .asciiz "bbb"
name3: .asciiz "ccc"
space: .asciiz " "
newline: .asciiz "\n"

.text
main: 
	la $a0, name1
	jal subroutine

	la $a0, name2
	jal subroutine

	la $a0, name3
	jal subroutine

	li $v0, 10
	syscall

subroutine:
	add $s0, $a0, $0
	li $s1, 0

loop:
	lb $s2, 0($s0)
	beq $s2, $0, end

	add $s1, $s1, $s2
	addi $s0, $s0, 1
	j loop

end:
	li $v0, 4
	syscall

	la $a0, space
	li $v0, 4
	syscall

	move $a0, $s1
	li $v0, 1
	syscall

	la $a0, newline
	li $v0, 4
	syscall

	jr $ra