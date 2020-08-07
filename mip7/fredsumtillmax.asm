# ##################################################################
#
# File name:     sumtillmax.asm
# Programmer:	 ftriplett  Frederic Triplett, Jr.
# AssignmentID:  MIPS_LOOPwhile
# Purpose:       Compute sum until sum reaches or exceeds a specified value.
# Due Date:      10/29/2013
#
# ==================================================================
# ==================================================================
#
# Solution Description (pseudo-code): 
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
# ==================================================================
# ==================================================================
#
#  REGISTER USAGE
#  ----------------------------------      
#  Reg    Variable/Expression
#  ----   -------------------
#  $s0    Max 
#  $s1    sum
#  $s2    Num
#
# ==================================================================
#
# ***********************
# ****** DATA SECTION -- FULL WORD data FIRST, then half-word, then bytes.
# ***********************
#
              .data
Max:          .word  0
sum:          .word  0
Num:          .word  0

endline:      .asciiz "\n"
space:        .asciiz " "

Max_prompt:   .asciiz "Enter MAX: "
Max_label:    .asciiz "MAX = "
used_Label:   .asciiz "\nUSED: "
end_Label:    .asciiz "END\n"
sum_Label:    .asciiz "\nSUM = "

copyright:    .asciiz "\n\n(c) 2018, ftriplett  Frederic Triplett, Jr \n\n"

#
# ***********************
# ****** CODE SECTION 
# ***********************
#
            .text   #--| START
main:
              #--------------------------------------------
              #--| cout << "Enter MAX: "; cin >> Max;
              #--| cout << "MAX = " <<  Max << endl;
              #--| cout << endl << "USED: ";
              #--------------------------------------------

              li $v0, 4
              la $a0, Max_prompt
              syscall
              
              li $v0, 5
              syscall
              move $s0, $v0
              sw $s0, Max
              
              li $v0, 4
              la $a0, Max_label
              syscall 
              
              li $v0, 1
              move $a0, $s0
              syscall
              
              li $v0, 4
              la $a0, endline
              syscall
              
              li $v0, 4
              la $a0, used_Label
              syscall

               #--------------------------------------------
               #--|   while (sum < Max)
               #--|   {
               #--|      cin >> Num;
               #--|      cout << Num << " ";
               #--|      sum = sum + Num;
               #--|   }
               #--------------------------------------------
whileLoop:     bgt $s1, $s0, sum_print
               
               li $v0, 5
               syscall
               move $s2, $v0
               sw $s2, Num
               
               li $v0, 1
               move $a0, $s2
               syscall
               
               li $v0, 4
               la $a0, space
               syscall
               
               add $s1, $s1, $s2
               b whileLoop
               
               #--------------------------------------------
               #   cout << "END\n";
               #   cout << "\nSUM = " << sum << endl;
               #--------------------------------------------
sum_print:     li $v0, 4
               la $a0, end_Label
               syscall
               
               li $v0, 4
               la $a0, sum_Label
               syscall
               
               li $v0, 1
               move $a0, $s1
               syscall
               
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