# ##################################################################
#
# File name:     demo.asm
# Programmer:	 jtoussaint  Jonas Toussaint
# AssignmentID:  MIPS0
# Purpose:       Demonstrate simple MIPS program performing addition.
# Due Date:      10/17/2018
#
# ==================================================================

#
# ***********************
# ****** DATA SECTION -- FULL WORD data FIRST, then half-word, then bytes.
# ***********************
#
            .data
endline:    .asciiz "\n"
tabOver:    .asciiz "  "
Fat:        .asciiz "FAT"
Cat:        .asciiz "CAT"
Ran:        .asciiz "RAN"
Fast:       .asciiz "FAST"
copyright:  .asciiz "\n\n(c) 2018, Jtoussaint Jonas Toussaint \n\n"

#
# ***********************
# ****** CODE SECTION 
# ***********************
#
    
            
            .text   #--| START
main:


            #--------------------------------------------
            #--| Print labeled output for X, then Y .
            #--|   a) write "X = ", X;  
            #--|   b) write "Y = ", Y; 
            #--------------------------------------------
            
            
            #-| cout << "FAT"
            
li $v0, 4
la $a0, Fat 
syscall 

            #-| cout << "\n"
li $v0, 4 
la  $a0, endline      
syscall 

            #-| cout << "  "
li $v0, 4 
la $a0, tabOver      
syscall 
            
            #-| cout << "  CAT"
li $v0, 4 
la $a0, Cat      
syscall 

            #-| cout << "\n"
li $v0, 4 
la $a0, endline      
syscall 

            #-| cout << "  "
li $v0, 4 
la $a0, tabOver      
syscall 

            #-| cout << "  "
li $v0, 4 
la $a0, tabOver      
syscall 

            #-| cout << "  RAN"
li $v0, 4 
la $a0, Ran      
syscall 

            #-| cout << "\n"
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
            
            
            
            
            
   
         