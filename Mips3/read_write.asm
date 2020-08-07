# ##################################################################
#
# File name:     read_write.asm
# Programmer:	 jtoussaint  Jonas Toussaint
# AssignmentID:  MIPS_intIO
# Purpose:       Demonstrate simple MIPS program performing addition.
# Due Date:      10/16/2018
#
# ==================================================================
# ==================================================================
#


# ==================================================================
#
#  REGISTER USAGE
#  ----------------------------------      
#  Reg    Variable/Expression
#  ----   -------------------
#  $s0    NUM1 
#  $s1    Num2
#  
#
# ==================================================================


# ***********************
# ****** DATA SECTION -- FULL WORD data FIRST, then half-word, then bytes.
# ***********************
#
            .data
NUM1:       .word 0
NUM2:       .word 0
endline:    .asciiz "\n"
Prompt1:    .asciiz "\n Enter Whole Number: "
Prompt2:    .asciiz "\n Enter Second Number: "
outLabel1:  .asciiz " Number 1 = " 
outLabel2:  .asciiz "  = Second Number "
copyright:  .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"
tab:        .asciiz " "

#----------------------------------------------------------------------
#(read_write.asm) Develop MIPS program to read two values into integer
#   variables NUM1 and NUM2, and display each value.
#
#
#       Prompt1: Enter Whole Number: 
#       Output:    Number 1 = xxxx
#
#       Prompt 2: Enter Second Number: 
#       Output:     xxxx = Second Number
#
#
#   Program Requirements:  
#     1. Name the prompts Prompt1 and Prompt2.
#     2. Name the output labels, outLabel1 and outLabel2.
#
#
#   ========================================================
#   USE THESE TEST CASES:  {14334 8724} {0  =12345}
#   ========================================================


#--------------------------------------------
#--| Initialize variables
#--------------------------------------------
 
 lw $s0, NUM1        #Var num1 in $s0
 lw $s1, NUM2        #Var num2 in $s1


#
# ***********************
# ****** CODE SECTION 
# ***********************
#
            .text   #--| START main:
               #--------------------------------------------
               #--| Prompt1: Enter Whole Number: 
               #--| Output:    Number 1 = xxxx
               #--|
               #--| Prompt2: Enter Second Number: 
               #--| Output:     xxxx = Second Number
               #--------------------------------------------
               
              # sw   $s0, NUM1              #-|$s1 ==> Y

#

 main:
 
#-| cout << " Enter Whole Number:
li $v0, 4
la $a0, Prompt1 
syscall     


#-/ reads user input
li $v0, 5
syscall

#-/  moves from register $t0 to $v0
move $s0, $v0


#-| cout << " Number 1 = "
li $v0, 4
la $a0, outLabel1 
syscall 

#-/ Print num1 to screen
li $v0, 1
move $a0, $s0
syscall


#-------------------------------------------------

#-| cout << " Enter Second Number:
li $v0, 4
la $a0, Prompt2 
syscall     


#-/ reads user input
li $v0, 5
syscall

#-/  moves from register $t0 to $v0
move $s1, $v0

li $v0, 4
la $a0, tab 
syscall  


#-/ Print num2 to screen
li $v0, 1
move $a0, $s1
syscall



#-| cout << " xxxx = Second Number "
li $v0, 4
la $a0, outLabel2 
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

