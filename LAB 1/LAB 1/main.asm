;
; LAB 1.asm
;
; Created: 01-09-2021 14:38:39
; Author : Dharahas
;


; Replace with your application code
 .CSEG
    LDI R16, $03 ; $03 is one operand
	LDI R17, $04 ; $04 is another
	ADD R16, R17 ; Adding and storing in R16
	MOV R3, R16  ; moving result to R3
  NOP

 .CSEG 
    LDI R16, $17
	LDI R17, $00 ; The 16-bit word is 0x 0017
	LDI R18, $02
	LDI R19, $14 ; The 16-bit word is 0x 1402
	ADD R16, R18 
	ADC R17, R19 ; Adding with carry 
	MOV R5, R16  ; Moving the result to R3 and R4
	MOV R6, R17  ; R5 contians Low, R6 contains High
  NOP 

.CSEG 
    LDI R16, $F3
	LDI R17, $03
	MUL R16, R17
	MOV R7, R0   ; R7 AND R8 contains the result 
	MOV R8, R1   ; R7 containing low and R8 containing high value
  NOP

.CSEG 
    LDI ZL, LOW(NUM<<1)
	LDI ZH, HIGH(NUM<<1)
	LDI XL, $60
	LDI XH, $00
b:	LPM R16, Z+
	LPM R17, Z
	CP R16, R17
	BRGE a 
	ST X, R17
  NOP
a : ST X, R16
  

NUM : .db $03,$02

   
    
