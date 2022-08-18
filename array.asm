.data
    A: 
        .word 2, 3, 1, 4, 8, 20, 30, 7, 9, 15 # Initialize the array A in memory

    .text
    .globl main
main: 
    # Load the address of A[0] to $a3
    la      $a3, A

    # Getting user integer input K into register v0
    li $v0, 5
    syscall

    # Moving the integer input to another register: $t0 <- K
    move $a1, $v0

    # Your code goes here…
    # Don’t forget that the final result must be in $v1 before exit
    addi $v1, $0, 0 # counter 
isGreater:

    beq     $t0, 10,exit 
    
    # load word from addrs and goes to the next addrs
    lw      $a2, 0($a3)
    addi    $a3, $a3, 4
    
    addi    $t0, $t0, 1
    
    slt $s0, $a2, $a1
    
    beq $s0, $0, isGreater
    
    addi $v1, $v1, 1
    
 
    jal      isGreater


exit:
    li      $v0, 10
    syscall
