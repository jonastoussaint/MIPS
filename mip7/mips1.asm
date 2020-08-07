# ##################################################################
#
# File name:     findmax.asm
# Programmer:	 jtoussaint  Jonas Toussaint
# AssignmentID:  MMIPS_LOOPmax
# Purpose:       Develop the following MIPS program that computes the max of 7 inputs..
# Due Date:      10/29/2018
#
# ==================================================================
#Assignment ID:  MIPS_LOOPmax
#
#DUE DATE;       command: CSduedate MIPS_LOOPmax   
#=======================================================
#
#
#
#(findmax.asm) Develop the following MIPS program that computes the max of 7 inputs..
#
#  Pseudo-code:
#
#     cout << "Enter Number: "; cin >> Num;
#     Max = Num;
#     for (k = 2; k <= 7; k++)
#     {
#        if ( Num > Max)  
#           Max = Num
#        cout << "Enter Number: "; cin >> Num;
#     }
#     cout << "MAX = " << Max
#
#
#                   ========================================================
#       TEST CASES: {10,1,2,3,4,5,7} {0,1,-8,-12,5,2,80} {8,13,1,15,14,0,2}
#                   {6,6,6,6,6,6,6} {98,87,76,65,54,43,32} {0,3,6,9,7,4,2}
#                   ========================================================
# ***********************
# ****** DATA SECTION -- FULL WORD data FIRST, then half-word, then bytes.
# ***********************

              .data
NUM:          .word  
Max:          .word 
endline:      .asciiz "\n"
Enter_num:    .asciiz "\nEnter Number: "
copyright:    .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"

#--------------------------------------------
#--| Initialize variables
#--------------------------------------------
 lw $s0, NUM      #Var ID in $s0
 #lw $s1, Y       #Var Hours in $s1
 #lw $s3, Z

              .text
main:
#--------------------------------------------
#cout << "Enter Number: ";
li $v0, 4
la $a0, Enter_num 
syscall 


#cin >> num;
li $v0, 5
syscall

#-/  moves from register $t0 to $v0
move $s0, $v0














li $v0, 4                
la $a0, copyright 
syscall            

                              	#-| Terminate program [e.g., return 0;].
li $v0, 10 
syscall    