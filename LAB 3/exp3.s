		TTL EVENorODD
		AREA PROGRAM, CODE, READONLY
       		
		LDR R0, NUM
		MOV R1, #1
		
		AND R2, R0, R1
		STR R2, RESULT    ;IF RESULT = "1" then it is odd and even if it's "0"

NUM   	DCW &24
RESULT 	DCW 0
		END
