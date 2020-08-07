# ##################################################################
#
# File name:     classify.asm
# Programmer:	 jtoussaint  Jonas Toussaint
# AssignmentID:  MIPS_Decision
# Purpose:       Demonstrate simple MIPS program performing addition.
# Due Date:      10/24/2018
#
# ==================================================================
#(classify.asm) Develop a MIPS the following MIPS program.
#
#   int ID, Hours.
#   cout << "Enter ID: "; cin >> ID;
#   cout << "Enter Hours Earned: "; 
#   cin >> Hours;
#   cout << "ID " << ID " has earned " << Hours << " credit hours." 
#        << endl;
#   cout << ID << " is a ";
#   
#   //-| Apply the classification rules.
#   if (Hours > 90)
#       cout << " SENIOR" << endl;
#   else if (Hours > 60) 
#      cout << " JUNIOR" << endl;
#   else if (Hours > 30)
#      cout << " SOPHOMORE" << endl;
#   else 
#      cout << " FRESHMAN" << endl;
#
#--------------------------------------------------------------------
#--------------------------------------------------------------------
#
# Hours > 90 ==> Senior;     Hours > 60 ==> Junior
#     Hours > 30 ==> Sophomore;  Hours >  0 ==> Freshman 
#
#               ======================================================
#   TEST CASES: {12345, 12} {54321, 60} {379242, 89} {8432173, 31}
#               {4807, 48} {33592, 30} {11837, 75}
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
Enter_ID:     .asciiz "\nEnter ID: "
Enter_hr:     .asciiz "Enter Hours Earned: "
id:           .asciiz "ID "
hasEarn:      .asciiz " has earned "
creditHour:   .asciiz " credit hours."
isA:          .asciiz " is a "
copyright:    .asciiz "\n\n(c) 2018, jtoussaint Jonas Toussaint \n\n"
freshman:     .asciiz " FRESHMAN"
sophmore:     .asciiz " SOPHMORE"
junior:       .asciiz " JUNIOR"
senior:       .asciiz " SENIOR"
#
# ***********************
# ****** CODE SECTION 
# ***********************
#
              .text 
main:

#--------------------------------------------
#--| Initialize variables
#--------------------------------------------
 
 lw $s0, ID           #Var ID in $s0
 lw $s1, Hours        #Var Hours in $s1
 addi $t0, $zero, 29  #put 30 in $t0
 addi $t1, $zero, 59  #put 60 in $t1
 addi $t2, $zero, 89  #put 90 in $t2
 #lw $s3 
 #lw $s4 
 
#--------------------------------------------

#cout << "Enter ID: ";
li $v0, 4
la $a0, Enter_ID 
syscall 

#cin >> ID;
li $v0, 5
syscall

#-/  moves from register $t0 to $v0
move $s0, $v0


#   cout << "Enter Hours Earned: "; 
li $v0, 4
la $a0, Enter_hr 
syscall 


#   cin >> Hours;
li $v0, 5
syscall


#-/  moves from register $t0 to $v0
move $s1, $v0


#   cout << "ID " << ID << " has earned " << Hours << " credit hours." 
#        << endl;

#   cout << "ID "; 
li $v0, 4
la $a0, id 
syscall 


#-| cout << ID
li $v0, 1 
move $a0, $s0      
syscall  


# cout << "has earned ";
li $v0, 4
la $a0, hasEarn
syscall 


#-| cout << Hours
li $v0, 1 
move $a0, $s1      
syscall  


# cout << " credit hours.";
li $v0, 4
la $a0, creditHour
syscall 


# cout << "\n;
li $v0, 4
la $a0, endline
syscall 


#-| cout << ID
li $v0, 1 
move $a0, $s0      
syscall  


# cout << " is a "
li $v0, 4
la $a0, isA
syscall 



#//-| Apply the classification rules.

#------------------------------------Senior
#    if (Hours > 90) 
#    cout << " SENIOR" << endl;
sgt $s2, $s1, $t2
ble $s2, $0, JUNIOR

# cout << " SENIOR"
li $v0, 4
la $a0, senior
syscall 

# cout << "\n;
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




#----------------------------------Junior

JUNIOR:

#else if (Hours > 60) 
#cout << " JUNIOR" << endl;
sgt  $s2, $s1, $t1
ble $s2, 0, SOPHMORE

# cout << " JUNIOR
li $v0, 4
la $a0, junior
syscall 


# cout << "\n;
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
 
 
 SOPHMORE:
#----------------------------------Sophmore

#else if (Hours < 30) 
#cout << " SOPHMORE" << endl;
sgt  $s2, $s1, $t0
ble  $s2, $0, FRESHMAN
#j FRESHMAN
# cout << " 
li $v0, 4
la $a0, sophmore
syscall 


# cout << "\n;
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

 FRESHMAN:
#----------------------------------Freshman

#else (Hours < 30) 
#cout << " FRESHMAN" << endl;

#sle $s2, $s1, $t0

# cout << " 
li $v0, 4
la $a0, freshman
syscall 

# cout << "\n;
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
          
      