#include<stdint.h>
int main(void)
{
    volatile uint32_t a=2;
    volatile uint32_t b=10;
    if(a!=b)
        a=b;
    while(1){
        a++;
        b++;
    }
}
