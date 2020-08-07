# ##################################################################
#
# File name:     findmax.asm
# Programmer:	 jtoussaint  Jonas Toussaint
# AssignmentID:  MMIPS_LOOPmax
# Purpose:       Develop the following MIPS program that computes the max of 7 inputs..
# Due Date:      10/29/2018
#
# ==================================================================
#Assignment ID:  MIPS_LOOPwhile
#
#--------------------------------------------------------
#
#(sumtillmax.asm) Compute sum until sum reaches or exceeds a specified value.
#
#   int Num, sum = 0;
#   int Max;
#   cout << "Enter MAX: "; cin >> Max;
#   cout << "MAX = " <<  Max << endl;
#   cout << endl << "USED: ";
#   while (sum < Max)
#   {
#      cin >> Num;
#      cout << Num << " ";
#      sum = sum + Num;
#   }
#   cout << "END\n";
#   cout << "\nSUM = " << sum << endl;
#
#
#   Sample input: 15 3 2 8 5 7
#
#   Output format: MAX = 15
#                  USED: 3 2 8 5 END
#                  SUM = 18
#
#
#   Use TEST CASES:  { 4 5 4 3 2 1 }   { 3 0 0 1 1 2 5 }  { 0 0 0 0 5 0 } 
#                   { 18 2 4 6 7 8 }  { -5 -2 -3 -4 -5 }
#-------------------------------------------------------------------------
# ***********************
# ****** DATA SECTION -- FULL WORD data FIRST, then half-word, then bytes.
# ***********************

              .data
              
Num:          .word  
Max:          .word 0
sum:          .word 0
endline:      .asciiz "\n"
Enter_Max:    .asciiz "\nEnter Max: "
use:          .asciiz "USED: "
copyright:    .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"
maxtoequal:   .asciiz "MAX = "
space:        .asciiz " "
end:          .asciiz "END\n"
sumX:         .asciiz "\nSUM = "
#--------------------------------------------
#--| Initialize variables
#----------------ciiz ----------------------------
# lw $s0, Num      	#Var NUM in $s0
# lw $s1, Max      	#Var Max in $s1 
# addi $s2, $zero, 0	#sum = 0;
# lw $s2  sum
              .text
 main:
 
#cout << "Enter Number: ";
li $v0, 4
la $a0, Enter_Max 
syscall 
 

li $v0, 5		#cin >> Max;
syscall 
 
move $s1, $v0		#-/  moves from register from $v0 to $s0 
 

#cout << "Max = ";
li $v0, 4
la $a0, maxtoequal
syscall  
 
 
 
#-| cout << Max
li $v0, 1 
move $a0, $s1      
syscall  
 

#cout << "\n";
li $v0, 4
la $a0, endline
syscall   
 
 
#cout << "\n";
li $v0, 4
la $a0, endline
syscall  

 
#cout << "USED: ";
li $v0, 4
la $a0, use
syscall   
 
 
#----------------------------------------------------------while Loop begins

while:  bgt $s2, $s1, exit
	

	li $v0, 5		#cin >> Num;
	syscall 
	move $s0, $v0		#-/  moves from register from $v0 to $s0 
	sw $s0, Num
	
	#-| cout << Num
	li $v0, 1 
	move $a0, $s0      
	syscall 
	
	#cout << " ";
	li $v0, 4
	la $a0, space
	syscall  
		
	add $s2, $s2, $s0
	
	b while


 
 
#cout << "END\n";
exit: li $v0, 4
      la $a0, end
      syscall  

#cout << "\nSUM = ";
li $v0, 4
la $a0, sumX
syscall 
 
#-| cout << sum
li $v0, 1 
move $a0, $s2      
syscall 

#cout << "\n;
li $v0, 4
la $a0, endline
syscall 

 
 
 
 
 
li $v0, 4                
la $a0, copyright 
syscall            

                              	#-| Terminate program [e.g., return 0;].
li $v0, 10 
syscall    
 
 
 
