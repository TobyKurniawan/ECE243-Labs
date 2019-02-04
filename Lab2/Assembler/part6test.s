.define LED_ADDRESS 0x1000
.define SW_ADDRESS 0x3000
.define DELAY 1
.define STACK 255

//Use r1 as the main counter
mvi r1, #0x0000 

//Use r2 as delay counter
mvi	r2, #DELAY

//Use r3 to add or sub
mvi r3, #1

//Use r4 as the LED_ADDRESS 
mvi r4, LED_ADDRESS

//Use r6 as STACK pointer
mvi r6, STACK

	MAIN:	add r1, r3 //increment counter
			st r1, [r4] //store counter into LED 
		
	CONT:	sub r6, r3
			st r1, [r6]
			sub r6, r3
			st r4, [r6]

	// Delay loop for controlling speed of scrolling
	
			mvi	r2, #DELAY				// delay counter 
			mv r5, r7					// save address of next instruction 
	OUTER:	mvi	r0, #SW_ADDRESS			// point to SW port 
			ld	r4, [r0]					// load inner loop delay from SW 
			add	r4, r3					// in case 0 was read
			mv	r0, r7					// save address of next instruction 
	INNER:	sub	r4, r3					// decrement inner loop counter 
			mvnz r7, r0					// continue inner loop 
			sub	r2, r3					// decrement outer loop counter 
			mvnz r7, r5					// continue outer loop
			
			ld r4, [r6]					// restore registers
			add r6, r3
			ld r1, [r6]
			add r6, r3
			mvi	r7, #MAIN 				// execute again 
		

//input: r0
//returns: quotient Q in r2, remainder R in r0
		
	DIV10: 

			sub r6, r3 
			st r1, [r6]
			sub r6, r3 
			st r4, [r6]
			sub r6, r3 
			st r7, [r6] //save registers

			mvi r2, #0 // init Q
			mvi r1, RETDIV // for branching
	DLOOP:	mvi r4, #9 // check if r0 is < 10 yet
			sub r4, r0
			mvnc r7, r3 // if so, then return
	INC: 	add r2, r3 // but if not, then increment Q
			mvi r4, #10
			sub r0, r4 // r0 -= 10
			mvi r7, DLOOP // continue loop
	RETDIV:
			ld r7, [r6]
			add r6, r3
			ld r5, [r6]
			add r6, r3
			ld r1, [r6]
			add r6, r3
			
			mv r7, r5 // return results

//input: r1 in binary
//returns: r1 in decimal
			
	DECNUMBER:	
	
				
			
	
			

			
			
			
