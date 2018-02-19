#Ryan Horoff
#CDA3101 Programming Assignment 1
#Jan 24 2018 - Feb 5 2018

.data

result: .asciiz"Average of positive array elements: "
array:  .word 92, -19, -91, 36, 19, 75, -3, -67, -17, -13, 61, 23 #Array Declaration
sum:    .word   0 #Sum variable declaration
average:    .word   0 #Average variable declaration
i:  .word   0

.text
main:

lw $t0, array #Store the initial value of the array in t0
lw $t1, i #Store the initial index of the array in t1
lw $t2, sum #store the intial value of the sum in t2
lw $s0, average #Store the initial value of the average in s0
addi $s1, $zero, 0 #Store the number of positive values


LOOP:
    lw $t3, array($t1) #Store A[i] in $t3
    slt $t4, $zero, $t3 #If 0 < A[i]
    beq $t4, $zero, ELSE #Branch to ELSE if above statement is false
    
    add $t2, $t2, $t3 #Sum += A[i]
    addi $t1, $t1, 4 #i += 1 (*4 due to bit addressing)
    addi $s1, $s1, 1 #add 1 to the number of positive values
    
    beq $t1, 44, ENDLOOP#if i == 11, (*4 due to bit addressing)
    
    j LOOP
ELSE:
     addi $t1, $t1, 4 #i += 1 (*4 due to bit addressing)
     beq $t1, 44, ENDLOOP#if i == 11, (*4 due to bit addressing)
     j LOOP
ENDLOOP:
    div $t2, $s1 #sum/number of positive values
    mflo $s0 #store division result in average
    
li $v0, 4
la $a0, result
syscall
        
li $v0, 1
la $a0, ($s0)
syscall

li $v0, 10
syscall #End the program