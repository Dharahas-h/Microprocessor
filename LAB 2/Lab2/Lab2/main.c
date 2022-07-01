#define F_CPU 1000000  // clock frequency

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

ISR (INT1_vect)
{
	int i;
	for (i=1;i<=10;i++) // for 10 times LED blink

	{
		PORTB=1;
		_delay_ms(1000);   // delay of 1 sec
		PORTB=0;
		_delay_ms(1000);
		
	}
}


int main(void)
{
	//Set the input/output pins appropriately
	//To enable interrupt and port interfacing
	//For LED to blink
	          //Set appropriate data direction for D
	DDRB=1;   //Make PB0 as output
	MCUCR=0;  //Set MCUCR to level triggered
	GICR=128;
	DDRD=8;    //Enable interrupt 1
	PORTD=8;
	DDRD=0;
	sei();       // global interrupt flag

	while (1) //wait
	{

	}
}

