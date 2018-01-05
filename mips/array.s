.data
list: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
main:
    lui  $s0, 0x1001        # $s0 = 0x10010000
    ori  $s0, $s0, 0x0000   # $s0 = 0x10010000

    li $s1, 0               # i = 0
    li $t2, 10              # $t2 = 10
    li $s2, 0               # $s2 = 0 

for:
    slt  $t0, $s1, $t2      # if (i < 10) => return 1
    beq  $t0, $0, done

    sll  $t0, $s1, 2        # $t0 = i * 4 (byte offset)
    add  $t0, $t0, $s0      # address of array[i]
    lw   $t1, 0($t0)        # $t1 = array[i]
    add  $s2, $s2, $t1      # $s2 = $s2 + $t1
    addi $s1, $s1, 1        # i = i + 1
    j    for
done:
    li $v0, 10
    syscall