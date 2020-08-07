# ##################################################################
#
# File name:     sumarray4.asm
# Programmer:	 jtoussaint  Jonas Toussaint
# AssignmentID:  MIPS_ARRAY1
# Purpose:       Write a program to compute sums of pairs of elements
#                in a 4-element array.
# Due Date:      11/02/2018
#
# ==================================================================
# Assignment ID:  MIPS_LOOPwhile                                   \
#                                                                  \
# ==================================================================
#
#(sumarray4.asm) Write a program to compute sums of pairs of elements
#              in a 4-element array.
#
#   Pseudo-code:
#
#    int Val[4] = {17, -14, 8, 72};
#    int sum13, sum13new, sum02, SUM;
#
#    sum02 = Val[0] + Val[2];
#    sum13 = Val[1] + Val[3];
#    SUM = sum02 + sum13;
#    cout << "\nSUM02 = " << sum02 << endl;
#    cout << "\nSUM13 = " << sum13 << endl;
#    cout << "\nARRAY SUM = " << SUM << endl;
#
#    cout << "\nEnter value for Val[1]: "; cin >> Val[1];
#    cout << "\nEnter value for Val[3]: "; cin >> Val[3];
#    sum13new = Val[1] + Val[3];
#
#    SUM = sum02 + sum13new;
#    cout << "\nNEW SUM13 = " << sum13new << endl;
#    cout << "\nNEW ARRAY SUM = " << SUM << endl;
#
#
#   ========================================================
#   USE THESE TEST CASES:  { 1 2 }  { 2 13 }  { 97 -79 }  { 0 0 }
#   ========================================================

# ***********************
# ****** DATA SECTION -- FULL WORD data FIRST, then half-word, then bytes.
# ***********************

			.data
			
sum13:			.word    
sum13new:		.word
sum02:			.word
SUM:			.word
endline:      		.asciiz "\n"
Enter_val_1:            .asciiz "\nEnter value for Val[1]: "
Enter_val_3:    	.asciiz "\nEnter value for Val[3]: "
nArraySum:      	.asciiz "\nNEW ARRAY SUM = "
sum13_str:    		.asciiz "\nNEW SUM13 = "
sum02_str:    		.asciiz "\nSUM02 = "
sumWord13:               .asciiz "\nSUM13 = "
arraySum:               .asciiz "\nARRAY SUM = "
copyright:    		.asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"

#---------------------------
# Registers                \
#===========================
# $s6  =>  sum13           \
# $s8, =>  sum13new        \
# $s3, =>  sum02           \
# $s7, =>  SUM	           \					
#---------------------------		
			

val:	.word 17, -14, 8, 72
			
			
			.text

#--------------------------------------------
#  Load Values int val[];                   \
#--------------------------------------------


la $t0, val
lw $s1, 0($t0)

la $t0, val
lw $s4, 4($t0)

la $t0, val
lw $s0, 8($t0)

la $t0, val
lw $s5, 12($t0)

#--------------------------------------------
#  Calculation:                             \
#  sum02 = Val[0] + Val[2];                 \
#  sum13 = Val[1] + Val[3];                 \
#  SUM = sum02 + sum13;                     \
#--------------------------------------------			


add $s3, $s0, $s1
add $s6, $s4, $s5
add $s7, $s6, $s3																																																												
																																																									
main:
			
#===============================================
#		Sum02			       \
#					       \
#===============================================

#cout << "\nSUM02 = ";
li $v0, 4
la $a0, sum02_str 
syscall 


#-| cout << sum02		
li $v0, 1 
move $a0, $s3      
syscall 


#cout << "\n;
li $v0, 4
la $a0, endline 
syscall 

#===============================================
#		Sum13			       \
#					       \
#===============================================

#cout << "\nNEW SUM13 = ";
li $v0, 4
la $a0, sumWord13 
syscall 


#-| cout << sum13			
li $v0, 1 
move $a0, $s6      
syscall 


#cout << "\n;
li $v0, 4
la $a0, endline 
syscall 

#===============================================
#		SUM			       \
#					       \
#===============================================

#cout << "\nNEW ARRAY SUM = ";
li $v0, 4
la $a0, arraySum 
syscall 


#-| cout << SUM			
li $v0, 1 
move $a0, $s7      
syscall 


#cout << "\n;
li $v0, 4
la $a0, endline 
syscall 


#----------------------------------------#
#  Enter  1st value into array           \
#					 \
#----------------------------------------#


#cout << "\nEnter value for Val[1]: ";
li $v0, 4
la $a0, Enter_val_1 
syscall 


#-/ reads user input
li $v0, 5
syscall

#-/  moves from register $v0 to $s4
move $s4, $v0



#---------------------------------------#
#                                       \
#cout << "\nEnter value for Val[3]: "   \ 
#---------------------------------------#

#cout << "\nEnter value for Val[3]: "
li $v0, 4
la $a0, Enter_val_3 
syscall 



#-/ reads user input
li $v0, 5
syscall

#-/  moves from register $v0 to $s4
move $s5, $v0


add $s2, $s4, $s5

add $s7, $s3, $s2 


#-----------------------------------------#
#  cout << "\nNEW SUM13 = ";              \
#                                         \
#-----------------------------------------#

#cout << "\nNEW SUM13 = ";
li $v0, 4
la $a0, sum13_str 
syscall 


#-| cout << sum13new			
li $v0, 1 
move $a0, $s2      
syscall 


#cout << "\n;
li $v0, 4
la $a0, endline 
syscall 

#------------------------------------------#
#                                          \
#  cout << "SUM";                          \
#------------------------------------------# 

#cout << "SUM";
li $v0, 4
la $a0, nArraySum 
syscall 


#-| cout << SUM			
li $v0, 1 
move $a0, $s7      
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