.data
x:	.word 10
y:	.word 20
z:	.word 0

.text
main:
    lw $s0, x
	lw $s1, y
	add $s0, $s0, $s1
	sw $s0, z

	li $v0, 10
	syscall