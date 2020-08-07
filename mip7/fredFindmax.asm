# ##################################################################
#
# File name:     findmax.asm
# Programmer:	 ftriplett  Frederic Triplett, Jr
# AssignmentID:  MIPS_LOOPmax
# Purpose:       Develop the following MIPS program that computes the max of 7 inputs.
# Due Date:      10/29/2018
#
# ==================================================================
#
# Solution Description (pseudo-code): 
#
#     cout << "Enter Number: "; cin >> Num;
#     Max = Num;
#     for (k = 2; k <= 7; k++)
#     {
#        cout << "Enter Number: "; cin >> Num;
#        if ( Num > Max)  
#           Max = Num
#     }
#     cout << "MAX = " << Max
#
# ==================================================================
#
#  REGISTER USAGE
#  ----------------------------------      
#  Reg    Variable/Expression
#  ----   -------------------
#  $s0    Num
#  $s1    Max
#
#  $t0    k -> [2,7]
#  $t1    7
#
# ==================================================================

# *********************************************************************
# ****** DATA SECTION -- FULL WORD data FIRST, then half-word, then bytes.
# *********************************************************************

              .data
Num:          .word  0
Max:          .word  0
k:            .word  0

endline:      .asciiz "\n"

Num_label:    .asciiz "Enter Number: "
Max_label:    .asciiz "MAX = "

copyright:    .asciiz "\n\n(c) 2018, ftriplett  Frederic Triplett, Jr \n\n"

# ***********************
# ****** CODE SECTION 
# ***********************

              .text   #--| START
main:         #--------------------------------------------
              #--| cout << "Enter Number: "; 
              #--------------------------------------------

              li $v0, 4
              la $a0, Num_label
              syscall

              #--------------------------------------------
              #--| cin >> Num;
              #--------------------------------------------

              li $v0, 5
              syscall
              move $s0, $v0
              sw $s0, Num
              
              #--------------------------------------------
              #--| Max = Num;
              #--------------------------------------------              

              add $s1, $zero, $s0
              sw $s1, Max

              #--------------------------------------------
              #--|  for (k = 2; k <= 7; k++)
              #--|  {
              #--|     cout << "Enter Number: "; cin >> Num;
              #--|     if ( Num > Max)  
              #--|        Max = Num
              #--|  }
              #--------------------------------------------

              #--------------------------------------------   
              #--| Set k = 2 and $t1 to 7
              #--------------------------------------------   
              
              addi $t0, $zero, 2
              sw $t0, k
              
              addi $t1, $zero, 7
              
              #--|  for (k = 2; k <= 7; k++)
forLoopTest:  ble $t0, $t1, forLoop
              bgt $t0, $t1, maxLabel

forLoop:      #--------------------------------------------
              #--| cout << "Enter Number: "; 
              #--------------------------------------------
              li $v0, 4
              la $a0, Num_label
              syscall

              #--------------------------------------------
              #--| cin >> Num;
              #--------------------------------------------
              li $v0, 5
              syscall
              move $s0, $v0
              sw $s0, Num

              #--------------------------------------------
              #--|     if ( Max < Num)  
              #--|        Max = Num
              #--------------------------------------------              
              blt $s0, $s1, k_inc   # if (Num < Max), jump to k_inc
              
              add $s1, $zero, $s0    # Max <= 0 + Num
              sw $s1, Max            # store Max in $s1
                            
              
              #--| Increment k and branch back to forLoop
k_inc:        addi $t0, $t0, 1
              b forLoopTest

              #--------------------------------------------
              #--|  cout << "MAX = " << Max
              #--------------------------------------------

maxLabel:     #-| cout << " MAX = "
              li $v0, 4
              la $a0, Max_label 
              syscall            

              #-| cout << Max
              li $v0, 1 
              move $a0, $s1      
              syscall            
              
              #-| cout << endl; 
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
