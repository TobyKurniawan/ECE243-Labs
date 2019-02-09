/* Program that converts a binary number to decimal */
           .text               // executable code follows
           .global _start
_start:
            MOV    R4, #N
            MOV    R5, #Digits  // R5 points to the decimal digits storage location
            LDR    R4, [R4]     // R4 holds N
            MOV    R0, R4       // parameter for DIVIDE goes in R0
            BL     DIVIDE
			STRB   R10, [R5, #3] // Thousands digit in R10
			STRB   R9, [R5, #2] // Hundreds digit in R9
            STRB   R1, [R5, #1] // Tens digit is now in R1
            STRB   R0, [R5]     // Ones digit is in R0
END:        B      END

/* Subroutine to perform the integer division by any specified divisor
 * Returns: quotient in R1, and remainder in R0
*/
DIVIDE:     MOV    R2, #0
			MOV	   R6, #DIVISOR // pointing to divisor
			LDR	   R6, [R6] //storing divisor value in R6
THOU:       CMP    R0, R6
            BLT    DIV_1000 // remainder < divisor
            SUB    R0, R6
            ADD    R2, #1
            B      THOU
HUN:		CMP    R0, R6
            BLT    DIV_100 // remainder < divisor
            SUB    R0, R6
            ADD    R2, #1
            B      HUN
TEN:		CMP    R0, R6
            BLT    DIV_END // remainder < divisor
            SUB    R0, R6
            ADD    R2, #1
            B      TEN


DIV_1000:   MOV    R10, R2
			MOV    R6, #100
			MOV    R2, #0
			B      HUN
DIV_100:	MOV    R9, R2
			MOV    R6, #10
			MOV    R2, #0
			B      TEN
DIV_END:    MOV    R1, R2     // quotient in R1 (remainder in R0)
            MOV    PC, LR

N:          .word  9876         // the decimal number to be converted
DIVISOR:	.word  1000		  // the divisor
Digits:     .space 4          // storage space for the decimal digits

            .end
