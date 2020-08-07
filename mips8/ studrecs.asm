# ##################################################################
#
# File name:     studrecs.asm
# Programmer:    jtoussaint Jonas Toussaint
# AssignmentID:  MIPS_STRUCT1
# Purpose:       Write a program to read enrollment data for three students, 
#                and compute the total hours.
# Due Date:      11/10/18
#
# ==================================================================
# ==================================================================
#
# Solution Description (pseudo-code): 
#
#  struct Stud
#  {
#    char FirstInit;
#    char LastName[15]; // Up to 14 characters. 
#    int hrsEarned;     // Cumulative hours.
#    int Class;         // 1=FR, 2=SO, 3=JR, 4=SR
#  };
#  int totHours = 0;
#
#  Stud S1 = {'E',"Jones",118,3};
#  Stud S2, S3;
#
#  Read data for S2 and S3: FirstInit, LastName, Class, hrsEarned
#
#  Compute totHours = S1.hrsEarned + S1.hrsEarned+S3.hrsEarned
#
#  Print "TOTAL HOURS EARNED = ", totHours
#
#  Print students in the order S3, S2, S1, in the format:
#
#     THIRD:  Class hrsEarned LastName,FirstInit 
#     SECOND: Class hrsEarned LastName,FirstInit 
#     FIRST:  Class hrsEarned LastName,FirstInit 
#
#      //**  Example: FIRST:  3 118 Jones,E 
#
# ==================================================================
# ==================================================================
#
#  REGISTER USAGE
#  ----------------------------------      
#  Reg    Variable/Expression
#  ----   -------------------
#  $s1    Stud1  
#  $s2    Stud2
#  $s3    Stud3
#  $t0    totHours
# ==================================================================
#
# ***********************
# ****** DATA SECTION -- FULL WORD data FIRST, then half-word, then bytes.
# ***********************
#
              .data

              
              .word 118
              .word 3
S1:           .byte 'E'
S2:           .space 24
S3:           .space 24
	      .asciiz "Jones"
endline:      .asciiz "\n"
space:        .asciiz " "
comma:        .asciiz ","
first:        .asciiz "\nFIRST: "
second:       .asciiz "\nSECOND: "
third:        .asciiz "\nTHIRD: "
total:        .asciiz "\nTOTAL HOURS EARNED = "
copyright:    .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"

#
# ***********************
# ****** CODE SECTION
# ***********************
#  
            .text   #--| START

main:
               #--------------------------------------------
               #--| Load addresses of S1, S2, S3.
               #--------------------------------------------

          la $s1,S1
          la $s2,S2       
          la $s3,S3

               #--------------------------------------------
               #--| Read data for S2: FirstInit, LastName, Class, hrsEarned.
               #--------------------------------------------
          li $v0,12
          syscall
          sb $v0,($s2) 

          li $v0,4      
          la $a0,endline
          syscall

          li $v0,8
          la $a0,1($s2)
          li $a1,15
          syscall

          li $v0,5
          syscall
          sw $v0,20($s2)

          li $v0,5
          syscall
          sw $v0,16($s2)

               #--------------------------------------------
               #--| Read data for S3: FirstInit, LastName, Class, hrsEarned.
               #--------------------------------------------
          li $v0,12
          syscall
          sb $v0,($s3) 

          li $v0,4      
          la $a0,endline
          syscall

          li $v0,8
          la $a0,1($s3)
          li $a1,15
          syscall

          li $v0,5
          syscall
          sw $v0,20($s3)

          li $v0,5
          syscall
          sw $v0,16($s3)


               #--------------------------------------------
               #--| Compute totHours = S1.hrsEarned + S1.hrsEarned + S3.hrsEarned.
               #--------------------------------------------
          lw $t1,8($s1)
          lw $t2,16($s2)
          lw $t3,16($s3)

          add $t0,$t1,$t2
          add $t0,$t0,$t3

               #--------------------------------------------
               #--|  Print "TOTAL HOURS EARNED = ", totHours.
               #--------------------------------------------
          li $v0, 4      
          la $a0, total
          syscall       

          li $v0,1
          move $a0,$t0
          syscall

          li $v0, 4      
          la $a0, endline
          syscall  
               #--------------------------------------------
               #--| Print students in the order S3, S2, S1. 
               #--------------------------------------------

             #-|Print THIRD:  Class hrsEarned LastName,FirstInit
          li $v0, 4
          la $a0, total
          syscall    

          li $v0, 4
          la $a0, space
          syscall   

          li $v0, 1
          lw $a0, 20($s3)
          syscall  

          li $v0, 4   
          la $a0, space   
          syscall

          li $v0, 1
          lw $a0, 16($s3)
          syscall

          li $v0, 4   
          la $a0, space   
          syscall

          li $v0, 4
          la $a0, 1($s3)
          syscall

          li $v0, 4   
          la $a0,comma   
          syscall

          li $v0, 11
          lb $a0, ($s3)
          syscall

          li $v0, 4      
          la $a0, endline
          syscall     

              #-|Print SECOND:  Class hrsEarned LastName,FirstInit
          li $v0, 4
          la $a0, second
          syscall      

          li $v0, 1
          lw $a0, 20($s2)
          syscall  

          li $v0, 4   
          la $a0, space   
          syscall

          li $v0, 1
          lw $a0, 16($s2)
          syscall

          li $v0, 4   
          la $a0, space   
          syscall

          li $v0, 4
          la $a0, 1($s2)
          syscall

          li $v0, 4   
          la $a0, comma   
          syscall

          li $v0, 11
          lb $a0, ($s2)
          syscall

          li $v0, 4      
          la $a0, endline
          syscall 


             #-|Print FIRST:  Class hrsEarned LastName,FirstInit
          li $v0, 4
          la $a0, first
          syscall      

          li $v0,4
          la $a0,space
          syscall 

          li $v0, 1
          lw $a0, 12($s1)
          syscall  

          li $v0, 4   
          la $a0, space   
          syscall

          li $v0, 1
          lw $a0, 8($s1)
          syscall

          li $v0, 4   
          la $a0, space   
          syscall

          li $v0, 4
          la $a0, 1($s1)
          syscall

          li $v0, 4   
          la $a0, comma   
          syscall

          li $v0, 11
          lb $a0, ($s1)
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

