# ##################################################################
#
# File name:     divsion.asm
# Programmer:	 jtoussaint  Jonas Toussaint
# AssignmentID:  MIPS_Division
# Purpose:       Demonstrate simple MIPS program performing addition.
# Due Date:      10/21/2018
#
# ==================================================================
#(classify.asm) Develop a MIPS the following MIPS program.
#
#   int ID, Hours.
#   cout << "Enter ID: "; cin >> ID;
#   cout << "Enter Hours Earned: "; cin >> Hours;
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

#
# ***********************
# ****** CODE SECTION 
# ***********************
#















 li $v0, 4                
      la $a0, copyright 
      syscall            

                              #-| Terminate program [e.g., return 0;].
      li $v0, 10 
      syscall     
          
          







