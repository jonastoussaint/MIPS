# ##################################################################
#
# File name: quadraticEqn.asm 
# Programmer: jtoussaint Jonas Toussaint	
# AssignmentID:  MIPS_Multiply
# Purpose: Write this program, use stored initial values for A and B.
# Due Date:      11/7/2018
#
# ==================================================================
# ==================================================================
#
# Solution Description (pseudo-code): 
#
#   int X, Y;
#   int A = 4;
#   int B = 5;
#   int C = -20;
#   read X;             // PROMPT: Enter value X:
#
#   Y = A*X*X + B+X + C;
#                       // ***** OUTPUT FORMAT
#   write X;            X = xx     ... example: X = 20
#   write Y;            Y = xxxx   ... example: Y = 85
#
# -----------------------------------------------
#   Test Cases:   {3} {-15} {25} {582}
# ------------------------------------------------
#
# ------------------------------------------------
#
#
# ==================================================================
# ==================================================================
#
#  REGISTER USAGE
#  ----------------------------------      
#  Reg    Variable/Expression
#  ----   -------------------
#  $s0   X
#  $s1   Y
#  $s2   A
#  $s3   B
#  $s4   C
# ==================================================================
#
# ***********************
# ****** DATA SECTION
# ***********************
#

             .data
X:        .word 0
Y:        .word 0
A:        .word 0
B:        .word 0
C:        .word 0
Enter_x:  .asciiz "Enter value X: "
endline:  .asciiz "\n"
copyright:  .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"

#
# ***********************
# ****** CODE SECTION 
# ***********************
#
            .text   #--| START
main:

addi $s2, $zero, 4
addi $s3, $zero, 5
addi $s4, $zero, -20

#--------------------------------------------Read X
               
               
               
               
               
# Print prompt
li $v0, 4
la $a0, Enter_x
syscall

# Read in X
li $v0, 5
syscall
move $s0, $v0

# Print endline
li $v0, 4
la $a0, endline
syscall        

#--------------------------------------------Perform Multiplication Calculation
              
	
mul $t0, $s2, $s0
mul $t1, $t0, $s0
add $t2, $t1, $s3
add $t3, $t2, $s0
add $t4, $t3, $s4

move $s1, $t4 

#--------------------------------------------Print labeled output for X and Y


# Print X
li $v0, 1
move $a0, $s0
syscall 

	
# Print endline
li $v0, 4
la $a0, endline
syscall    

	
# Print Y
li $v0, 1
move $a0, $s1
syscall 

	
# Print endline
li $v0, 4
la $a0, endline
syscall        

           
            
             
              
#--------------------------------------------
#--| Print copyright and terminate program.
#--------------------------------------------

li $v0, 4                
la $a0, copyright 
syscall            

            
#-| Terminate program [e.g., return 0;].
li $v0, 10 
syscall            
