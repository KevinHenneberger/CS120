main:

    li $a0, 6           # $a0 = 6

	jal factorial		# call factorial

    move $a0, $v0
	li $v0, 1
	syscall

	li $v0, 10
	syscall

factorial:
	li $t0, 1
	bgt $a0, $t0, else
	addi $v0, $0, 1		# return 1
	jr $ra
else:
    addi $sp, $sp, -8
    sw $a0, 4($sp)		# store $a0
    sw $ra, 0($sp)		# store $ra

    addi $a0, $a0, -1	# argument of n-1
    jal factorial		# call factorial(n-1)

	lw $ra, 0($sp)		# restore $ra
	lw $a0, 4($sp)		# restore $a0
	addi $sp, $sp, 8

	mul $v0, $a0, $v0	# return n * factorial(n-1)
	jr $ra