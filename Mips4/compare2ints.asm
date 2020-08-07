 # ##################################################################
#
# File name:     compare2ints.asm
# Programmer:	 jtoussaint  Jonas Toussaint
# AssignmentID:  MIPS_intCompare
# Purpose:       Develop MIPS programs that perform simple decision making.
# Due Date:      10/24/2018
#
# ==================================================================
#cout << "Enter Number X: "; cin >> X; 
#   cout << "Enter Number Y: "; cin >> Y; 
#   if (X > Y) 
#   {
#      if ( X >= 4)
#         cout << X << " GREATER THAN " << Y << endl
#      else
#         cout << Y << " LESS THAN 4" << endl
#   }
#   else if ( X < Y)
#      cout << X << " BEFORE " << Y << endl; 
#   else
#      cout << X << " EQUALS " << Y << endl;
#
#
#
#               ======================================================
#   TEST CASES: {47, -15}  {-12487,-782821} {2, -5} {5326,6235}
#               ======================================================
#--------------------------------------------------------------------
# ***********************
# ****** DATA SECTION -- FULL WORD data FIRST, then half-word, then bytes.
# ***********************
              .data
ID:           .word  
Hours:        .word 
endline:      .asciiz "\n"
Write:        .asciiz "\nWrite "
Enter_numX:   .asciiz "\nEnter Number X "
copyright:    .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"

#--------------------------------------------
#--| Initialize variables
#--------------------------------------------
 
 lw $s0, X        #Var ID in $s0
 lw $s1, Y        #Var Hours in $s1
 lw $s3, Z
 addi $t0, $s2, 4
 
#---------------------------------------------
#
# ***********************
# ****** CODE SECTION 
# ***********************
#
              .text 
main:


#cout << "Enter Number X ";
li $v0, 4
la $a0, Enter_numX 
syscall 

#cin >> X;
li $v0, 5
syscall

#-/  moves from register $t0 to $v0
move $s0, $v0
 
 
#---------------------------------------------
#cout << "Enter Number Y ";
li $v0, 4
la $a0, Enter_numY 
syscall 

#cin >> Y;
li $v0, 5
syscall

#-/  moves from register $t0 to $v0
move $s1, $v0 



#--------------------------------------nested if-else statements
 
#cout <<  if (X > Y) 
sgt $s2, $s0, $s1
ble $s2, $0, OUTTERELSE

#if ( X >= 4)
sgt $s2, $s0, $t0
ble $s2, $s3, INNERELSE


#-| cout << X
li $v0, 1 
move $a0, $s0      
syscall  

# cout << " GREATER THAN ";
li $v0, 4
la $a0, GT
syscall  
 
#-| cout << Y
li $v0, 1 
move $a0, $s1      
syscall  

 
# cout << "\n";
li $v0, 4
la $a0, endline
syscall  


 li $v0, 4                
 la $a0, copyright 
 syscall            

                              #-| Terminate program [e.g., return 0;].
 li $v0, 10 
 syscall   

  
#      else
#      cout << Y << " LESS THAN 4" << endl  
INNERELSE: 

#-| cout << Y
li $v0, 1 
move $a0, $s1      
syscall  


# cout << " Less THAN 4";
li $v0, 4
la $a0, LT4
syscall  


# cout << "\n";
li $v0, 4
la $a0, endline
syscall


li $v0, 4                
la $a0, copyright 
syscall            

                              	#-| Terminate program [e.g., return 0;].
li $v0, 10 
syscall   


#   else if ( X < Y)
#      cout << X << " BEFORE " << Y << endl; 
OUTTERELSE:


#cout <<  if (X < Y) 
slt $s2, $s0, $s1
ble $s2, $0, ELSE
 
#-| cout << X
li $v0, 1 
move $a0, $s0      
syscall        

# cout << " Before ";
li $v0, 4
la $a0, Before
syscall  


#-| cout << Y
li $v0, 1 
move $a0, $s1      
syscall 


# cout << "\n";
li $v0, 4
la $a0, endline
syscall



li $v0, 4                
la $a0, copyright 
syscall            

                              #-| Terminate program [e.g., return 0;].
 li $v0, 10 
 syscall   


ELSE:

#-| cout << X
li $v0, 1 
move $a0, $s0      
syscall  

# cout << " EQUAL ";
li $v0, 4
la $a0, Equal
syscall 

#-| cout << Y
li $v0, 1 
move $a0, $s1      
syscall  

# cout << "\n";
li $v0, 4
la $a0, endline
syscall

 
 
 
 
 
li $v0, 4                
la $a0, copyright 
syscall            

                              	#-| Terminate program [e.g., return 0;].
li $v0, 10 
syscall     
