.org 0x0000
rjmp reset

.org 0x0002
rjmp int1_ISR

reset:
	                ;Loading stack pointer address
      LDI R16,$70
	  OUT SPL,R16
	  LDI R16,$00
	  OUT SPH,R16

	  LDI R16, $01  ; Interface port B pin0 to be output
	  OUT DDRB, R16 ;so to view LED blinking

	  LDI R16,$08
	  OUT DDRD,R16

	  LDI R16, $00   ;Set MCUCR register to enable low level interrupt
	  OUT MCUCR,R16

	  LDI R16, $80   ;Set GICR register to enable interrupt 1
	  OUT GICR,R16

	  LDI R16, $00
	  OUT PORTB, R16

	  LDI R16, $08
	  OUT PORTD, R16
	  LDI R16, $00
	  OUT DDRD, R16
	  
	  SEI
ind_loop:rjmp ind_loop

int1_ISR:IN R16,SREG
		 PUSH R16

		 LDI R16,0x0A
		 MOV R0,R16
		                    ;Modify below loops to make LED blink for 1 sec
	     
		 LDI R16,0x00           
		 OUT PORTB,R16      ;setting PORTB     
		 
	C1:	 LDI R16, $01
		 OUT PORTB,R16
		     
		 LDI R18,4
	A3:  LDI R16,200       ;To acieve 1s delay = 1[clock time period] x (250 x 5[Clock cycles])[First loop] x 200[2nd loop] x 4[3rd loop]            
	A2:  LDI R17,250       
    A1:  NOP
         NOP
		 DEC R17
		 BRNE A1           ; delay of one sec
         DEC R16
		 BRNE A2
		 DEC R18
		 BRNE A3 

		 LDI R16, $00
         OUT PORTB,R16     ;clearing PORTB

		 LDI R18,4
	A3:  LDI R16,200       ;To acieve 1s delay = 1[clock time period] x (250 x 5[Clock cycles])[First loop] x 200[2nd loop] x 4[3rd loop]            
	A2:  LDI R17,250       
    A1:  NOP
         NOP
		 DEC R17
		 BRNE A1           ; delay of one sec
         DEC R16
		 BRNE A2
		 DEC R18
		 BRNE A3 


		 DEC R0             
		 BRNE C1        
		 
		 POP SREG 
		 RETI

	