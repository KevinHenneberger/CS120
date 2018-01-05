.data
message: .asciiz "Enter a Number: "
    
.text
main:
    la $a0, message
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    
    addi $s0, $v0, 5

    move $a0, $s0
    li $v0, 1
    syscall

    li $v0, 10
    syscall