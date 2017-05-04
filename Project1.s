.data

ArrayA: .double 0.0, 0.0, 0.0, 0.0 # Array 2x2 Initialized

ArrayB: .double 0.0, 0.0, 0.0, 0.0 # Array 2x2 Initialized

iterator_i: .word 0 # i for the loop

iterator_j: .word 0 # j for the loop

strA1: .asciiz "a("

strA2:.asciiz ","

strA3: .asciiz ")"

strA4: .asciiz "="

strB1: .asciiz "b("

strB2:.asciiz ","

strB3: .asciiz ")"

strB4: .asciiz "="

.text 

main:

la $a0, ArrayA #load address

lw $s0, iterator_i

lw $s1, iterator_j

li $s5, 2 # width of the arrays

li $s6, 2 # height of the arrays

Outer_loopA :

bge $s0, $s6, Outer_loop_end_A 

li $s1, 0 # initialize inner-loop counter to 0

Inner_loopA :

bge $s1, $s5 , Inner_loop_end_A #Condition

sll $t6 , $s0 , 1 # i*2 -> $t6

add $t7, $t6 , $s1 # i*2 + j -> $t7

sll $t7, $t7, 3 # (i*2 + j)*8 -> $t7

add $t3, $t7 , $a0 # Address

sll $t6 , $s0 , 1 # i*2 -> $t6

add $t7, $t6 , $s1 # i*2 + j -> $t7

sll $t7, $t7, 3 # (i*2 + j)*8 -> $t7

add $t3, $t7 , $a0 # Address

sll $t6 , $s0 , 1 # i*2 -> $t6

add $t7, $t6 , $s1 # i*2 + j -> $t7

sll $t7, $t7, 3 # (i*2 + j)*8 -> $t7

add $t3, $t7 , $a0 # Address

li $v0 , 4

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

la $a0, strA1

syscall

lw $a0, 0($sp) #Return from the stack

addi $sp, $sp , 4 #Close the stack

li $v0, 1

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

addi $s0, $s0, 1  

move $a0, $s0 #Argument for the print

syscall

lw $a0, 0($sp) #Return from the stack

addi $sp, $sp , 4 #Close the stack

addi $s0, $s0, -1 #Reinstate the iterator

li $v0 , 4

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

la $a0, strA2

syscall

lw $a0, 0($sp) #Return from the stack

addi $sp, $sp , 4 #Close the stack

li $v0, 1

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

addi $s1, $s1, 1 #The index is +1

move $a0, $s1 #Argument for the print

addi $s1, $s1, -1 

syscall

lw $a0, 0($sp) #Return from the stack

addi $sp, $sp , 4 #Close the stack

li $v0 , 4

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

la $a0, strA3

syscall

lw $a0, 0($sp) #Return from the stack

addi $sp, $sp , 4 #Close the stack

li $v0 , 4

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

la $a0, strA4

syscall

lw $a0, 0($sp) #Return from the stack

addi $sp, $sp , 4 #Close the stack

li $v0, 7 # Read double

syscall

sdc1 $f0 , 0($t3) #Fill the array with the double numbers

addi $s1, $s1 , 1 #Next step to the loop

b Inner_loopA 

Inner_loop_end_A:

addi $s0, $s0 , 1

b Outer_loopA 

Outer_loop_end_A:

#-------------------------------------------------
#-------------------------------------------------
#----------- Array B -----------------------------
#-------------------------------------------------

la $a1, ArrayB #load address

li $s0, 0 # Reinitiliaze i

Outer_loopB :

bge $s0, $s6, Outer_loop_end_B

li $s1, 0 # initialize j

Inner_loopB :

bge $s1, $s5 , Inner_loop_end_B #Condition

sll $t6 , $s0 , 1 # i*2 -> $t6

add $t7, $t6 , $s1 # i*2 + j -> $t7

sll $t7, $t7, 3 # (i*2 + j)*8 -> $t7

add $t3 , $t7 , $a1 # Address

li $v0 , 4

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

la $a0, strB1

syscall

lw $a0, 0($sp) #Return from the stack

addi $sp, $sp , 4 #Close the stack

li $v0, 1

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

addi $s0, $s0, 1  

move $a0, $s0 #Argument for the print

syscall

addi $s0, $s0, -1 #Reinstate the iterator

li $v0 , 4

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

la $a0, strB2

syscall

li $v0, 1

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

addi $s1, $s1, 1 #The index is +1

move $a0, $s1 #Argument for the print

addi $s1, $s1, -1 

syscall

li $v0 , 4

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

la $a0, strB3

syscall

li $v0 , 4

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

la $a0, strB4

syscall

li $v0, 7 # Read double

syscall

sdc1 $f0 , 0($t3) #Fill the array with the double numbers

addi $s1, $s1 , 1 #Next step to the loop

b Inner_loopB 

Inner_loop_end_B:

addi $s0, $s0 , 1

b Outer_loopB 

Outer_loop_end_B:

#---------------------------------------------
#---------------------------------------------
#--------------Array C------------------------
#---------------------------------------------


.data

ArrayC: .double 0.0, 0.0, 0.0, 0.0 # Array 2x2 Initialized

iterator_k: .word 0 # k for the loop

strC1: .asciiz "c("

strC2:.asciiz ","

strC3: .asciiz ")"

strC4: .asciiz "="

space: .asciiz "\n"

.text

la $a2, ArrayC #load address

la $a0, ArrayA

la $a1, ArrayB #load address

lw $s2, iterator_k

li $s0, 0

li $s1, 0

jal MulFunction 

andi $t8, $t8, 0 # Clear the register

addi $t8, $t8, 2 # Constant for the loops

Print_loop1 :

bge $s0, $t8 , exit_print_loop1

li $s1, 0 # Reinitialize j

Print_loop2:

bge $s1, $t8, exit_print_loop2

sll $t6 , $s0 , 1 # i*2 -> $t6

add $t7, $t6 , $s1 # i*2 + j -> $t7

sll $t7, $t7, 3 # (i*2 + j)*8 -> $t7

add $t3, $t7 , $a2 # Address for C

li $v0 , 4

addi $sp, $sp, -4 #stack implementation in order
sw $a0, 0($sp)    #to free register $a0

andi $a0, $a0, 0 #clear register $a0

la $a0, strC1

syscall

li $v0, 1

addi $s0, $s0, 1  

move $a0, $s0 #Argument for the print

syscall

addi $s0, $s0, -1 #Reinstate the iterator

li $v0 , 4

la $a0, strC2

syscall

li $v0, 1

addi $s1, $s1, 1  # Right index and also next step to the loop

move $a0, $s1 #Argument for the print

syscall

li $v0 , 4

la $a0, strC3

syscall

li $v0 , 4

la $a0, strC4

syscall

lw $a0, 0($sp) #Return from the stack

addi $sp, $sp , 4 #Close the stack

li $v0 , 3 

ldc1 $f12 , 0($t3)

syscall

li $v0 , 4

la $a0, space

syscall

b Print_loop2 

exit_print_loop2:

addi $s0, $s0, 1 

b Print_loop1

exit_print_loop1:

li $v0, 10
syscall

#------------------------------------------------
#------------------------------------------------
#----------Function for Multiplication-----------
#------------------------------------------------

MulFunction:

addi $sp, $sp, -32 # In order to save the registers $s0,$s1,$s2

sw $s0, 0($sp)

sw $s1, 4($sp)

sw $s2, 8($sp)

andi $t8, $t8, 0 # Clear the register

addi $t8, $t8, 2 # Constant for the loops

Loop1:

bge $s0 , $t8, end_loop1

li $s1 , 0 # Reinitialize j 

Loop2 :

bge $s1, $t8, end_loop2

li $s2, 0 # Reinitialize k 

Loop3:

bge $s2, $t8, end_loop3

sll $t0 , $s0 , 1 # i*2 -> $t0

add $t1, $t0 , $s1 # i*2 + j -> $t1

sll $t1, $t1, 3 # (i*2 + j)*8 -> $t1

add $t3, $t1 , $a2 # Address for C

sll $t2 , $s0 , 1 # i*2 -> $t2

add $t5, $t2 , $s2 # i*2 + k -> $t5

sll $t5, $t5, 3 # (i*2 + k)*8 -> $t5

add $t4, $t5 , $a0 # Address for A

sll $t6 , $s2 , 1 # k*2 -> $t6

add $t7, $t6 , $s1 # k*2 + j -> $t7

sll $t7, $t7, 3 # (k*2 + j)*8 -> $t7

add $t9, $t7 , $a1 # Address for B

ldc1 $f0, 0($t4) # Load A[] element

ldc1 $f2, 0($t9) # Load B[] element

ldc1 $f6, 0($t3) # Load C[] element

mul.d $f4, $f2, $f0 # A*B

add.d $f6, $f6, $f4 # C = C + A*B

sdc1 $f6, 0($t3) # Create the C array 

addi $s2, $s2 , 1 # k = k + 1

b Loop3 

end_loop3 :

addi $s1, $s1, 1 # j = j + 1

b Loop2 

end_loop2 :

addi $s0, $s0, 1 # i = i + 1

b Loop1 

end_loop1:

move $v1 , $a2

lw $s0, 0($sp)

lw $s1, 4($sp)

lw $s2, 8($sp)

addi $sp, $sp, 32 

jr $ra

