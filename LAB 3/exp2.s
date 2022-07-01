		TTL QUESTION2
		AREA PROGRAM, CODE, READONLY

Main	LDR R0, LIST    	;loading the address of the list
		MOV R3, #4      	;no. of loops
		MOV R6, #12	 		;shift by

LOOP	LDR R1, [R0], #4	;loading from list	
		MOV R2, #&0F		;AND with 0000 1111 to get low nibble
		AND R1, R1, R2		
		MOV R1, R1, LSL R6	;shift operation
		ADD R5, R5, R1		
		SUB R6, R6, #4
		SUBS R3, R3, #1
		BNE LOOP
	
		STR R5, RESULT
		SWI &11
		

Start	DCD &1C
      	DCD &05
      	DCD &36      ;RESULT = 0x0000C568
      	DCD &28

	
RESULT  DCD 0
LIST 	DCD Start
		END
