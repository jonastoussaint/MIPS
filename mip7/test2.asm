#======================================================================
# Assignment: TEST2mips 
# File name:  test2.asm
# Author:    
# Submit:     CSsubmit TEST2mips test2.asm test2.log
#======================================================================
#
   # Pseudo-code:
   # --------------------------------------------------
   #   Display copyright.
   #
   #   int Num, negCount=0, zeroCount=0, posSum=0;
   #   for (k = 1; k <= 7; k++)
   #   {
   #      cin >> Num;
   #      cout << Num;
   #      if ( Num < 0)  
   #         negCount++;
   #      if (Num > 0)
   #         posSum += Num;
   #      else
   #         zeroCount++;
   #   }
   #
   #   cout << "\nNEGATIVE COUNT = " << negCount << endl;
   #   cout << "\nPOSITIVE SUM = " << posSum << endl;
   #   cout << "\nZERO COUNT = " << zeroCount << endl;
   #
   #   Display copyright.
   # --------------------------------------------------

# ***********************
# ****** DATA SECTION
# ***********************
#
            .data
X:          .word  14
Y:          .word  0
endline:    .asciiz "\n"
neg_Label:  .asciiz "\nNEGATIVE COUNT = "
pos_Label:  .asciiz "\nPOSITIVE SUM = "
zero_Label: .asciiz "\nZERO COUNT = "
copyright:  .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"

#
# ***********************
# ****** CODE SECTION 
# ***********************
#

#  Pseudo-code:
#
#     int Num, negCount=0, zeroCount=0, posSum=0;
#     for (k = 1; k <= 7; k++)
#     {
#        cin >> Num;
#        cout << Num;
#        if ( Num < 0)  
#           negCount++;
#        if (Num > 0)
#           posSum += Num;
#        else
#           zeroCount++;
#     }
#
#     cout << "\nNEGATIVE COUNT = " << negCount << endl;
#     cout << "\nPOSITIVE SUM = " << posSum << endl;
#     cout << "\nZERO COUNT = " << zeroCount << endl;
#
#
#
#                   ========================================================
#       TEST CASES: {0,1,2,3,4,5,6} {0,1,-8,-12,5,2,80} {0,0,0,0,0,0,0}
#                  {-6,-6,-6,-6,-6,-6,-6} {0,3,-6,0,7,-4,9}
#                  ========================================================


Num:          .word  
negCount:     .word  0
zeroCount:    .word  0
posSum:	      .word  0
k:            .word  0

            .text   #--| START
main:

            #--------------------------------------------------------------
            #--| Register Usage (recommended):
            #--|          $t0 -- for loop variable k = 1,2,..,7
            #--|          $t1 -- Num
            #--|          $t2 -- posSum
            #--|          $t3 -- zeroCount
            #--|          $t4 -- negCount
            #--------------------------------------------------------------
START: 


              #--------------------------------------------   
              #--| Set k = 1 and $t1 to 7
              #--------------------------------------------   
              
              addi $t0, $zero, 1
              sw $t0, k
              
              addi $s7, $zero, 7
              
              #--|  for (k = 2; k <= 7; k++)
forLoopTest:  ble $t0, $s7, forLoop
              bgt $t0, $s7, out

forLoop:   
        
              #-/ cin >> Num;
             
              li $v0, 5
              syscall
              move $t1, $v0
              sw $t1, Num

              #-| cout << Num;
              li $v0, 1 
              move $a0, $t1      
              syscall
              
                          
                                      
                                                              
              #cout <<  if (Num < 0) 
	      slt $s2, $t0, $zero
              addi $t0, $t0, 1
              
              
              
              #cout <<  if (Num > 0) 
	      sgt $s2, $t0, 0
              add $t2, $t2, $t1
              
                 
              
              #cout <<  if (Num = 0)
              seq $s2, $t0, $zero
              addi $t3, $t3, 1
              
              
              
              #--| Increment k and branch back to forLoop
k_inc:        addi $t0, $t0, 1
              b forLoopTest

              

out:

#cout << "\nNEGATIVE COUNT = ";
li $v0, 4
la $a0, neg_Label
syscall 


#-| cout << negCount
li $v0, 1 
move $a0, $s1      
syscall 


#cout << "\n;
li $v0, 4
la $a0, endline
syscall 


#cout << "\nPOSITIVE SUM = ";
li $v0, 4
la $a0, pos_Label
syscall 


#-| cout << posSum
li $v0, 1 
move $a0, $s1      
syscall 


#cout << "\n;
li $v0, 4
la $a0, endline
syscall 


#cout << "\nNEGATIVE COUNT = ";
li $v0, 4
la $a0, zero_Label
syscall 


#-| cout << zeroCount
li $v0, 1 
move $a0, $s1      
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
