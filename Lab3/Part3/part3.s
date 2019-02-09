/* Program that finds the largest number in a list of integers	*/

            .text                   // executable code follows
            .global _start                  
_start:                             
            MOV     R4, #RESULT     // R4 points to result location
            LDR     R0, [R4, #4]    // R0 holds the number of elements in the list
            MOV     R1, #NUMBERS    // R1 points to the start of the list
            BL      LARGE           
            STR     R0, [R4]        // R0 holds the subroutine return value

END:        B       END             

/* Subroutine to find the largest integer in a list
 * Parameters: R0 has the number of elements in the lisst
 *             R1 has the address of the start of the list
 * Returns: R0 returns the largest item in the list
 */
LARGE:  	MOV 	R2, R0 // intializing the loop counter in R2
			LDR		R0, [R1] //initializing R0 as the first element in list
LOOP:		SUBS 	R2, #1
			BEQ		DONE
			ADD 	R1, #4 //iterating one element further in the list
			LDR 	R3, [R1] // loading the next element
			CMP 	R0, R3
			BGE 	LOOP // check if R0 < R3
			MOV		R0, R3
			B 		LOOP 
DONE:		MOV 	PC, LR

RESULT:     .word   0           
N:          .word   7           // number of entries in the list
NUMBERS:    .word   4, 5, 3, 6  // the data
            .word   1, 8, 2                 

            .end                            

