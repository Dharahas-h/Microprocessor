		TTL FACTORIAL
		AREA PROGRAM, CODE, READONLY

		LDR R0, NUM  		;Input
		MOV R1, #1
		CMP R0, #0
		BEQ ENDIT

loop	MUL R2, R1, R0      
		MOV R1, R2        	;Moving result back to R1
		SUBS R0, R0, #1
		BNE loop

ENDIT	STR R1, RESULT
		SWI &11

NUM     DCW &4
RESULT  DCW 0 
		END 
