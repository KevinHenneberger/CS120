.data
number1:	.asciiz "Type in a number: "
number2:	.asciiz "Type in a number: "
newline: .asciiz "\n"
	
.text
main:
    # read/store number
	la $a0, number1
	li $v0, 4
	syscall

	li $v0, 5
	syscall

    move $s0, $v0

    # read/store number
	la $a0, number2
	li $v0, 4
	syscall

    li $v0, 5
	syscall

    move $a0, $v0

    li $t0, 0
for:
    beq $t0, $s0, end

	li $v0, 1
	syscall

    addi $t0, $t0, 1
    j for
end:
    li $v0, 10
	syscall