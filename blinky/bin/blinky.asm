
bin/blinky.elf:     file format elf32-littlearm


Disassembly of section .text:

08000000 <VectorTable>:
 8000000:	00 90 00 20 dd 00 00 08 1d 01 00 08 1d 01 00 08     ... ............
 8000010:	1d 01 00 08 1d 01 00 08 1d 01 00 08 1d 01 00 08     ................
 8000020:	1d 01 00 08 1d 01 00 08 1d 01 00 08 1d 01 00 08     ................
 8000030:	1d 01 00 08 1d 01 00 08 1d 01 00 08 1d 01 00 08     ................
 8000040:	1f 01 00 08 1f 01 00 08 1f 01 00 08 1f 01 00 08     ................
 8000050:	1f 01 00 08 1f 01 00 08 1f 01 00 08 1f 01 00 08     ................
 8000060:	1f 01 00 08 1f 01 00 08 1f 01 00 08 1f 01 00 08     ................
 8000070:	1f 01 00 08 1f 01 00 08 1f 01 00 08 1f 01 00 08     ................
 8000080:	1f 01 00 08 1f 01 00 08 1f 01 00 08 1f 01 00 08     ................
 8000090:	1f 01 00 08 1f 01 00 08 1f 01 00 08 1f 01 00 08     ................
 80000a0:	1f 01 00 08 1f 01 00 08 1f 01 00 08 1f 01 00 08     ................
 80000b0:	1f 01 00 08 1f 01 00 08 1f 01 00 08 1f 01 00 08     ................
 80000c0:	1f 01 00 08 1f 01 00 08 1f 01 00 08 1f 01 00 08     ................
 80000d0:	1f 01 00 08 1f 01 00 08 1f 01 00 08                 ............

080000dc <OnReset>:
 * actions (such as making decisions based on the reset cause register, and
 * resetting the bits in that register) are left solely in the hands of the
 * application.
 */
void OnReset(void)
{
 80000dc:	b510      	push	{r4, lr}

    /*
     * Copy the data segment initializers from flash to SRAM.
     */
    src = &__end_of_text__;
    for(dst = &__data_beg__; dst < &__data_end__;)
 80000de:	4b0a      	ldr	r3, [pc, #40]	; (8000108 <OnReset+0x2c>)
    src = &__end_of_text__;
 80000e0:	4a0a      	ldr	r2, [pc, #40]	; (800010c <OnReset+0x30>)
    for(dst = &__data_beg__; dst < &__data_end__;)
 80000e2:	e003      	b.n	80000ec <OnReset+0x10>
        *dst++ = *src++;
 80000e4:	6811      	ldr	r1, [r2, #0]
 80000e6:	6019      	str	r1, [r3, #0]
 80000e8:	3304      	adds	r3, #4
 80000ea:	3204      	adds	r2, #4
    for(dst = &__data_beg__; dst < &__data_end__;)
 80000ec:	4908      	ldr	r1, [pc, #32]	; (8000110 <OnReset+0x34>)
 80000ee:	428b      	cmp	r3, r1
 80000f0:	d3f8      	bcc.n	80000e4 <OnReset+0x8>
 80000f2:	4b08      	ldr	r3, [pc, #32]	; (8000114 <OnReset+0x38>)
 80000f4:	e002      	b.n	80000fc <OnReset+0x20>
     * Zero fill the bss segment.  This is done with inline assembly
     * since this will clear the value of pulDest if it is not kept in
     * a register.
     */
    for(dst = &__bss_beg__; dst < &__bss_end__;)
        *dst++ = 0;
 80000f6:	2200      	movs	r2, #0
 80000f8:	601a      	str	r2, [r3, #0]
 80000fa:	3304      	adds	r3, #4
    for(dst = &__bss_beg__; dst < &__bss_end__;)
 80000fc:	4a06      	ldr	r2, [pc, #24]	; (8000118 <OnReset+0x3c>)
 80000fe:	4293      	cmp	r3, r2
 8000100:	d3f9      	bcc.n	80000f6 <OnReset+0x1a>

    /*
     * Call user firmware entry
     */
    main();
 8000102:	f000 f81d 	bl	8000140 <main>
 8000106:	e7fe      	b.n	8000106 <OnReset+0x2a>
 8000108:	20000000 	.word	0x20000000
 800010c:	080001a4 	.word	0x080001a4
 8000110:	20000000 	.word	0x20000000
 8000114:	20000000 	.word	0x20000000
 8000118:	20000000 	.word	0x20000000

0800011c <OnUnknownFault>:
/*
 * Point all fault handlers by default to OnUnknownFault
 */

void OnUnknownFault(void)
{
 800011c:	e7fe      	b.n	800011c <OnUnknownFault>

0800011e <OnIrq_CCM_AAR>:
/*
 * Point all interrupt handler by default to OnUnknownIrq
 */

static void OnUnknownIrq(void)
{
 800011e:	e7fe      	b.n	800011e <OnIrq_CCM_AAR>

08000120 <delay>:
        delay(500000);    
    }
}

void delay (int a)
{
 8000120:	b082      	sub	sp, #8
    volatile int i,j;
    for (i=0 ; i < a ; i++)
 8000122:	2300      	movs	r3, #0
 8000124:	9301      	str	r3, [sp, #4]
 8000126:	e005      	b.n	8000134 <delay+0x14>
    {
        j++;
 8000128:	9b00      	ldr	r3, [sp, #0]
 800012a:	3301      	adds	r3, #1
 800012c:	9300      	str	r3, [sp, #0]
    for (i=0 ; i < a ; i++)
 800012e:	9b01      	ldr	r3, [sp, #4]
 8000130:	3301      	adds	r3, #1
 8000132:	9301      	str	r3, [sp, #4]
 8000134:	9b01      	ldr	r3, [sp, #4]
 8000136:	4283      	cmp	r3, r0
 8000138:	dbf6      	blt.n	8000128 <delay+0x8>
    }
    return;
}
 800013a:	b002      	add	sp, #8
 800013c:	4770      	bx	lr
	...

08000140 <main>:
{
 8000140:	b510      	push	{r4, lr}
*RCC_IOPENR    |= 0x00000001;
 8000142:	4a10      	ldr	r2, [pc, #64]	; (8000184 <main+0x44>)
 8000144:	2301      	movs	r3, #1
 8000146:	6811      	ldr	r1, [r2, #0]
 8000148:	430b      	orrs	r3, r1
 800014a:	6013      	str	r3, [r2, #0]
delay(50000);
 800014c:	480e      	ldr	r0, [pc, #56]	; (8000188 <main+0x48>)
 800014e:	f7ff ffe7 	bl	8000120 <delay>
*GPIOA_MODER    = 0x00000400;
 8000152:	2280      	movs	r2, #128	; 0x80
 8000154:	00d2      	lsls	r2, r2, #3
 8000156:	23a0      	movs	r3, #160	; 0xa0
 8000158:	05db      	lsls	r3, r3, #23
 800015a:	601a      	str	r2, [r3, #0]
*GPIOA_OTYPER   = 0x0000;
 800015c:	2300      	movs	r3, #0
 800015e:	4a0b      	ldr	r2, [pc, #44]	; (800018c <main+0x4c>)
 8000160:	8013      	strh	r3, [r2, #0]
*GPIOA_OSPEEDR  = 0x00000000;
 8000162:	4a0b      	ldr	r2, [pc, #44]	; (8000190 <main+0x50>)
 8000164:	6013      	str	r3, [r2, #0]
*GPIOA_PUPDR    = 0x00000000;
 8000166:	4a0b      	ldr	r2, [pc, #44]	; (8000194 <main+0x54>)
 8000168:	6013      	str	r3, [r2, #0]
        *GPIOA_BSRR=0x0020;
 800016a:	2420      	movs	r4, #32
 800016c:	4b0a      	ldr	r3, [pc, #40]	; (8000198 <main+0x58>)
 800016e:	601c      	str	r4, [r3, #0]
        delay(50000);
 8000170:	4805      	ldr	r0, [pc, #20]	; (8000188 <main+0x48>)
 8000172:	f7ff ffd5 	bl	8000120 <delay>
        *GPIOA_BRR=0x0020;
 8000176:	4b09      	ldr	r3, [pc, #36]	; (800019c <main+0x5c>)
 8000178:	801c      	strh	r4, [r3, #0]
        delay(500000);    
 800017a:	4809      	ldr	r0, [pc, #36]	; (80001a0 <main+0x60>)
 800017c:	f7ff ffd0 	bl	8000120 <delay>
 8000180:	e7f3      	b.n	800016a <main+0x2a>
 8000182:	46c0      	nop			; (mov r8, r8)
 8000184:	40021034 	.word	0x40021034
 8000188:	0000c350 	.word	0x0000c350
 800018c:	50000004 	.word	0x50000004
 8000190:	50000008 	.word	0x50000008
 8000194:	5000000c 	.word	0x5000000c
 8000198:	50000018 	.word	0x50000018
 800019c:	50000028 	.word	0x50000028
 80001a0:	0007a120 	.word	0x0007a120
