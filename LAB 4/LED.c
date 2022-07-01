#include "LPC23xx.h"

int main()
{
	int input, hnible, lnible, prod;
	FIO3DIR = 0xFF;                   
	FIO4DIR = 0x00;
	
	while (1)
	{
		input = FIO4PIN;
		hnible = input >> 4;
		lnible = input & 0x0F;
		prod = hnible*lnible;
		FIO3PIN = prod;
	}
	return 0;
}	
