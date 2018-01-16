.data	
	intpr1:		.asciiz "Enter value of X1: "
	intpr2:		.asciiz "Enter value of X2: "
	intpr3:		.asciiz "Enter value of Y1: "
	intpr4:		.asciiz "Enter value of Y2: "
	radi: 		.asciiz "The sqrt of the radicad is not an integer"
	space:		.asciiz "\n"
.text 

sqrt:
	
	# Print "Enter value of X1: "
	li $v0, 4
	la $a0, intpr1
	syscall
	
	# Take Value of X1 into $t1
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Print "Enter value of X2: "
	li $v0, 4
	la $a0, intpr2
	syscall
	
	# Take Value of X2 into $t2
	li $v0, 5
	syscall
	move $t2, $v0
	
	# Print "Enter value of Y1: "
	li $v0, 4
	la $a0, intpr3
	syscall
	
	# Take Value of Y1 into $t3
	li $v0, 5
	syscall
	move $t3, $v0

	# Print "Enter value of Y2: "
	li $v0, 4
	la $a0, intpr4
	syscall
	
	# Take Value of Y2 into $t4
	li $v0, 5
	syscall
	move $t4, $v0
	
	# X1 - Y1 squared 
	sub $t5, $t1, $t3
	mul $s0, $t5, $t5
	mflo $s1
		
	# X2 - Y2 squared 
	sub $t6, $t2, $t4
	mul $s2, $t6, $t6
	mflo $s3
		
	# (X1 - Y1)^2 + (X2 - Y2)^2
	add $t7, $s1, $s3

	# Functions that test for perfect squares
	beq $t7, 0, square0
	beq $t7, 1, square1
	beq $t7, 4, square2
	beq $t7, 9, square3
	beq $t7, 16, square4
	beq $t7, 25, square5
	beq $t7, 36, square6
	beq $t7, 49, square7
	beq $t7, 64, square8
	beq $t7, 81, square9
	beq $t7, 100, square10
	beq $t7, 121, square11
	beq $t7, 144, square12
	beq $t7, 169, square13
	beq $t7, 196, square14
	beq $t7, 225, square15
	
	# Prints the message radi for values that aren't perfect squares
	radicand: 
		li $v0, 4
		la $a0, radi
		syscall
		j main
	
	# Functions to calculate sqrt of perfect squares
	square0: 
		div $t7, $t7, 1
		j printsqrt
	square1: 
		div $t7, $t7, 1
		j printsqrt
	square2: 
		div $t7, $t7, 2
		j printsqrt
	square3: 
		div $t7, $t7, 3
		j printsqrt
	square4: 
		div $t7, $t7, 4
		j printsqrt
	square5: 
		div $t7, $t7, 5
		j printsqrt
	square6: 
		div $t7, $t7, 6
		j printsqrt
	square7: 
		div $t7, $t7, 7
		j printsqrt
	square8: 
		div $t7, $t7, 8
		j printsqrt
	square9: 
		div $t7, $t7, 9
		j printsqrt
	square10: 
		div $t7, $t7, 10
		j printsqrt
	square11: 
		div $t7, $t7, 11
		j printsqrt
	square12: 
		div $t7, $t7, 12
		j printsqrt
	square13: 
		div $t7, $t7, 13
		j printsqrt
	square14: 
		div $t7, $t7, 14
		j printsqrt
	square15: 
		div $t7, $t7, 15
		j printsqrt
		
	# Function to print the sqrt
	printsqrt:
		li $v0, 1
		move $a0, $t7
		syscall
		j main
		
	
	main:
		# Blank space
		li $v0, 4
		la $a0, space
		syscall
		# Jump to beginning of program
		j sqrt
	
