.data
buffer:	.space 100
message: .asciiz "Type in a string: "
	
.text
main:
    la $a0, message
	li $v0, 4
	syscall

	la $a0, buffer
	li $a1, 100
	li $v0, 8
	syscall

	la $a0, buffer
	jal toupper

	la $a0, buffer
	li $v0, 4
	syscall

	la $a0, buffer
	jal tolower

	la $a0, buffer
	li $v0, 4
	syscall

	li $v0, 10
	syscall

toupper:
	addi $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	
	move $s0, $a0

loop:
    lb $s1, 0($s0)
	beq $s1, $0, done

	li $s2, 'a'
	blt $s1, $s2, skip

	li $s2, 'z'
	bgt $s1, $s2, skip

	# convert to uppercase
	addi $s1, $s1, -32
	sb $s1, 0($s0)

skip:
    addi $s0, $s0, 1
	j loop

done:
	lw $ra, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 16
	jr $ra

tolower:
	addi $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	
	move $s0, $a0

loop2:
    lb $s1, 0($s0)
	beq $s1, $0, done2

	li $s2, 'A'
	blt $s1, $s2, skip2

	li $s2, 'Z'
	bgt $s1, $s2, skip2

	# convert to lowercase
	addi $s1, $s1, 32
	sb $s1, 0($s0)

skip2:
    addi $s0, $s0, 1
	j loop2

done2:
	lw $ra, 12($sp)
	lw $s2, 8($sp)
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 16
	jr $ra