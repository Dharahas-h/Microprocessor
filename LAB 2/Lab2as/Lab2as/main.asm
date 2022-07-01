.CSEG
.org $000
rjmp reset

.org $001
rjmp int0_ISR 

.org $002
rjmp int1_ISR

reset:
	  ;Loading stack pointer address
      LDI R16, LOW(RAMEND)
	  OUT SPL,R16
	  LDI R16, HIGH(RAMEND)    ;initialising stack pointer
	  OUT SPH,R16

	  LDI R16, $01    ;Interface port B pin0 to be output
	  OUT DDRB, R16    ;so to view LED blinking

	  LDI R16, $00    ;Set MCUCR register to enable low level interrupt
	  OUT MCUCR,R16

	  LDI R16, $C0    ;Set GICR register to enable interrupt 1
	  OUT GICR,R16    ;enabling interrupts for PORT.2(INT0) AND PORT.3(INT1)

	  LDI R16,$00     ;Output at PINB(output) set to zero
	  OUT PORTB,R16   ;intially LED will be off
	  
	  LDI R16, $0C    ;Values at PORTD.2(INT0) and PORTD.3(INT1) set to 1 to prevent interrupt initially  
	  OUT DDRD, R16   
	  OUT PORTD, R16
	  LDI R16, $00   ;making PORTD as input 
      OUT DDRD, R16

	  SEI

ind_loop:rjmp ind_loop

int1_ISR:

		 ;Modify below loops to make LED blink for 1 sec
 		 LDI R16, $01
		 OUT PORTB,R16
		 
	L3:  LDI R18,$0F    ;To acieve 1s delay = 1[clock time period] x (250 x 5)[First loop] x 200[2nd loop] x 2[3rd loop]                      
	L2:  LDI R17,$FC    ;Only 2 loops used to reduce computation time because of performance issues of pc
    L1:  NOP             
         NOP             
		 DEC R17        
		 BRNE L1
         DEC R18
		 BRNE L2
		 
		 LDI R16, $00
         OUT PORTB,R16
		 RETI

int0_ISR:
         ; Subroutine makes LED blink for every '1' sec for '10' times
		 LDI R16, $0A
		 MOV R0, R16   
         
	C1:	 LDI R16, $01
		 OUT PORTB,R16    
		 
	     LDI R16,$0F       ;To acieve 1s delay = 1[clock time period] x (250 x 5)[First loop] x 200[2nd loop] x 2[3rd loop]            
	A2:  LDI R17,$FC       ;Only 2 loops used to reduce computation time because of performance issues of pc
    A1:  NOP
         NOP
		 DEC R17
		 BRNE A1
         DEC R16
		 BRNE A2

		 LDI R16, $00
         OUT PORTB,R16

		 DEC R0
		 BRNE C1 
		 RETI