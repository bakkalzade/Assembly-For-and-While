main:
	# Getting user integer input a into register v0
	 li $v0, 5
	 syscall
	 # Moving the integer input to another register: $t0 <- a
	 move $t0, $v0	#a
	# Getting the second user integer input a into register v0
	 li $v0, 5
	 syscall
	 # Moving the integer input to another register: $t1 <- b
	 move $t1, $v0	#b
	# Your code goes here…
	
	li $v1,0 #result
	li $s1,1
	
	slt $t3,$t0,$t1
      	
      	beq $t0,$t1, equal
	beq $t3,$s1, punish
	beq $t3,$zero,award
	
	
	li $v0, 10
	syscall
	
	 
	
	

equal:
	addi $t3, $t3,61
	
	add $v1,$v1,$t1 #2a+2b
	add $v1,$v1,$t1
	add $v1,$v1,$t0
	add $v1,$v1,$t0
	
	j exit
	
punish:
	add $v1,$v1,$t0 #a-3b
	sub $v1,$v1,$t1
	sub $v1,$v1,$t1
	sub $v1,$v1,$t1
	
	j exit

award:
	add $v1,$v1,$t0 #3a+b
	add $v1,$v1,$t0
	add $v1,$v1,$t0
	add $v1,$v1,$t1
	j exit
	
exit:
	
	# Don’t forget that the final result must be in $v1 before exit
	# Exit from the simulator function
	li $v0, 10
	syscall