#ifndef gpio_h
    #define gpio_h
    
    #define AHB2PERIPH_BASE 0x50000000
    #define GPIOA_BASE      (AHB2PERIPH_BASE + 0x00000000)
    #define __IO volatile

    typedef struct
    {
     __IO uint32_t MODER;        
     __IO uint16_t OTYPER;       
     uint16_t RESERVED0;         
     __IO uint32_t OSPEEDR;      
     __IO uint32_t PUPDR;        
     __IO uint16_t IDR;          
     uint16_t RESERVED1;         
     __IO uint16_t ODR;          
     uint16_t RESERVED2;         
     __IO uint32_t BSRR;         
     __IO uint32_t LCKR;         
     __IO uint32_t AFR[2];       
     __IO uint16_t BRR;          
     uint16_t RESERVED3;         
    }GPIO_TypeDef;

    #define GPIOA ((GPIO_TypeDef *) GPIOA_BASE)


#endif