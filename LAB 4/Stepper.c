#include "LPC23xx.h"

void delay(void)
{
	for(int i=0; i<0xFF ; i++);
}

int main()
{
	IODIR0 = 0xFFFFFFFF;
	
	while(1)
	{
		IOPIN0 = 0x00000240;
		delay();
		IOPIN0 = 0x00000140;
		delay();
		IOPIN0 = 0x00000180;
		delay();
		IOPIN0 = 0x00000280;
		delay();
	}
	
	return 0;
}