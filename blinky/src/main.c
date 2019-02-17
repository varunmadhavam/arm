#include<stdint.h>
#include<gpio.h>

void delay (int a);

int main(void)
{
uint32_t* GPIOA_MODER   = (uint32_t*)0x50000000;
uint16_t* GPIOA_OTYPER  = (uint16_t*)0x50000004;
uint32_t* GPIOA_OSPEEDR = (uint32_t*)0x50000008;
uint32_t* GPIOA_PUPDR   = (uint32_t*)0x5000000C;
uint32_t* GPIOA_BSRR    = (uint32_t*)0x50000018;
uint16_t* GPIOA_BRR     = (uint16_t*)0x50000028;
uint32_t* RCC_IOPENR    = (uint32_t*)0x40021034;

*RCC_IOPENR    |= 0x00000001;
delay(50000);
*GPIOA_MODER    = 0x00000400;
*GPIOA_OTYPER   = 0x0000;
*GPIOA_OSPEEDR  = 0x00000000;
*GPIOA_PUPDR    = 0x00000000;

while(1)
    {
        *GPIOA_BSRR=0x0020;
        delay(500000);
        *GPIOA_BRR=0x0020;
        delay(500000);    
    }
}

void delay (int a)
{
    volatile int i,j;
    for (i=0 ; i < a ; i++)
    {
        j++;
    }
    return;
}
