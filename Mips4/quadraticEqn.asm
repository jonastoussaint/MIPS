# ##################################################################
#
# File name:     division.asm
# Programmer:	 jtoussaint  Jonas Toussaint
# AssignmentID:  MIPS_Division 
# Purpose:       Demonstrate simple MIPS program performing division.
# Due Date:      10/25/2018
#
# ==================================================================

#(quadraticEqn.asm) Write this program, use stored initial values for A and B.
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
#
#   ------------------------------------------------
#   Test Cases:   {3} {-15} {25} {582}
#   ------------------------------------------------
#
#   ------------------------------------------------

#
#  REGISTER USAGE
#  ----------------------------------      
#  Reg    Variable/Expression
#  ----   -------------------
#  $s0    X 
#  $s1    Y 
#  $s2    A =4
#  $s3    B = 5
#  $s4    C = -20
#  $t0    B+X  
#  $t1    B+X + C
#  $t2    
#  $t3    A*X*X 
# ==================================================================

main:
.text   #--| START main:
#
# ***********************
# ****** CODE SECTION 
# ***********************
#
              .data 0
X:            .word 0
Y:            .word 0
A:            .word 0
B:            .word 0 
C:            .word 0                  
enter_Value:  .asciiz "Enter value X: "
copyright:    .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"
endline:      .asciiz "\n"
Write:        .asciiz "\n Write "

               #--------------------------------------------
               #--| Perform the calculation Y = A*X*X + B+X + C;
               #--------------------------------------------

              
            addi $s0, $zero, 4      #-|$t2 <= A = 4 
            addi $s1, $zero, 5      #-|$t2 <= B = 5 
            addi $s2, $zero, -20    #-|$t2 <= C = -20
           
               
	    

#-| cout << " Enter value X: "
li $v0, 4
la $a0, enter_Value 
syscall 


# Read in X
li $v0, 5
syscall
move $s0, $v0


mul $t0, $s2, $s0
mul $t1, $t0, $s0
add $t2, $t1, $s3
add $t3, $t2, $s0
add $t4, $t3, $s4

move $s1, $t4 









#-| cout << " Write X";
li $v0, 4
la $a0, Write
syscall 

#-/ Print num1 to screen
li $v0, 1
move $a0, $s0
syscall


#-| cout << "\n"
li $v0, 4
la $a0, endline 
syscall 



#-| cout << " Write Y";
li $v0, 4
la $a0, Write
syscall  

#-/ Print num1 to screen
li $v0, 1
move $a0, $s1
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

