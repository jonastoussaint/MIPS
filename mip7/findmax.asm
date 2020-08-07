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
              
Num:          .word 0 
Max:          .word 0
k:            .word 0
endline:      .asciiz "\n"
Enter_num:    .asciiz "\nEnter Number: "
copyright:    .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"
maxtoequal:   .asciiz "MAX = "

#--------------------------------------------
#--| Initialize variables
#--------------------------------------------
 #lw $s0, Num      #Var NUM in $s0
 #lw $s1, Max      #Var Max in $s1


              .text
main:
#--------------------------------------------


#cout << "Enter Number: ";
li $v0, 4
la $a0, Enter_num 
syscall 



li $v0, 5		#cin >> num;
syscall
move $s0, $v0		#-/  moves from register from $v0 to $s0
sw $s0, Num





add $s1, $zero, $s0		#-/  set Max = Num
sw $s1, Max


#--------------------------------------


#li $t0 7          	#t0 is a constant 7
#li $t1 2          	#t0 is a constant 2


addi $t0, $zero, 2
sw $t0, k
              
addi $t1, $zero, 7


forLoopTest:  ble $t0, $t1, forloop
              bgt $t0, $t1, maxXX


forloop:

        #cout << "Enter Number: ";
	li $v0, 4
	la $a0, Enter_num 
	syscall 
	
	
	#cin >> num;
	li $v0, 5
	syscall
	move $s0, $v0	       #-/  set Max = Num
	sw $s0, Num
	
	
	blt $s0, $s1, k_inc     # if (Num < Max)
        add $s1, $zero, $s0   # Max <= 0 + Num
        sw $s1, Max            
	
	
	
k_inc: 

addi $t0, $t0, 1  #add 1 to t1
b  forLoopTest         #jump back to the top





maxXX:



#cout << "Max = ";
li $v0, 4
la $a0, maxtoequal 
syscall 


#-| cout << Max
li $v0, 1 
move $a0, $s1      
syscall  




li $v0, 4                
la $a0, copyright 
syscall            

                              	#-| Terminate program [e.g., return 0;].
li $v0, 10 
syscall    