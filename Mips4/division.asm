# ##################################################################
#
# File name:     division.asm
# Programmer:	 jtoussaint  Jonas Toussaint
# AssignmentID:  MIPS_Division 
# Purpose:       Demonstrate simple MIPS program performing division.
# Due Date:      10/25/2018
#
# ==================================================================

#(division.asm) Develop a MIPS the following MIPS program.
#
#   int X = 20;
#   int Y = 17;
#   int D, R, Q;
#   read D;
#   Q = X / D;
#   R = Y % D
#
#   write Q;
#   write R;
#--------------------------------------------------------------------
#--------------------------------------------------------------------
#   Requirements:
#
#      a) NO INPUT (reads) required.
#      b) Output must look like:
#
#                X = xx     ... example: X = 20
#                Y = xx     ... example: Y = 19
#                D = xx     ... example: Y = 4
#                Q = xx     ... example: Y = 5
#                R = xx     ... example: Y = 3
#
#
#--------------------------------------------------------------------
#   Test Cases:   {4} {12} {20} {1}
#--------------------------------------------------------------------


#  REGISTER USAGE
#  ----------------------------------      
#  Reg    Variable/Expression
#  ----   -------------------
#  $s0    X 
#  $s1    Y 
#  $s2    D
#  $s3    R
#  $s4    Q
# ==================================================================
#
# ***********************
# ****** DATA SECTION -- FULL WORD data FIRST, then half-word, then bytes.
# ***********************

            .data
X:          .word  20
Y:          .word  17
D:          .word  
R:          .word  
Q:          .word  
endline:    .asciiz "\n"
X1:         .asciiz "\nX = "
Y1:         .asciiz "\nY = "
D1:         .asciiz "\nD = "
R1:         .asciiz "\nR = "
Q1:         .asciiz "\nQ = "
Write:      .asciiz "\nWrite "
Read:       .asciiz "\nRead D: "
copyright:  .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"


#
# ***********************
# ****** CODE SECTION 
# ***********************
#
      .text   #--| START main:
      main:
#--------------------------------------------
#--| Initialize variables
#--------------------------------------------    

lw $s0 X 
lw $s1 Y 
lw $s2 D
lw $s3 R
lw $s4 Q

            
#-/ reads user input
li $v0, 5
syscall
move $s2, $v0
 
      
#-| cout << "\n "
li $v0, 4
la $a0, endline
syscall             
                
#-| cout << "\nX=  "
li $v0, 4
la $a0, X1 
syscall                             
 
mflo $s4            
#Perform the division      
div $s4, $s0, $s2     # Q = X / D

#sw  $s4, Q            #-|$s2 ==> Q
 
mfhi $s3  
#Perform the modulo     
div $s3, $s2, $s1    # R = Y % D

#sw  $s3, R           #-|$s2 ==> Q
           
                                 
                                                             
#--------------------------------------output                          
                                                               
                                              
#-| cout << X
li $v0, 1 
move $a0, $s0      
syscall 

#-| cout << "\nY =  "
li $v0, 4
la $a0, Y1
syscall 

#-| cout << Y
li $v0, 1 
move $a0, $s1      
syscall 

#-| cout << "\nD =  "
li $v0, 4
la $a0, D1
syscall 

#-| cout << D
li $v0, 1 
move $a0, $s2      
syscall 

#-| cout << "\nR =  "
li $v0, 4
la $a0, Q1
syscall 

#-| cout << R
li $v0, 1 
move $a0, $s3       
syscall 

#-| cout << "\nQ =  "
li $v0, 4
la $a0, R1
syscall 

#-| cout << Q
li $v0, 1 
move $a0, $s4      
syscall 
      
                          

li $v0, 4                
la $a0, copyright 
syscall            

                              #-| Terminate program [e.g., return 0;].
li $v0, 10 
syscall     
