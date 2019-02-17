
bin/check.elf:     file format elf32-littlearm


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
 8000102:	f000 f80d 	bl	8000120 <main>
 8000106:	e7fe      	b.n	8000106 <OnReset+0x2a>
 8000108:	20000000 	.word	0x20000000
 800010c:	08000144 	.word	0x08000144
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

08000120 <main>:
#include<stdint.h>
int main(void)
{
 8000120:	b082      	sub	sp, #8
    volatile uint32_t a=2;
 8000122:	2302      	movs	r3, #2
 8000124:	9301      	str	r3, [sp, #4]
    volatile uint32_t b=10;
 8000126:	3308      	adds	r3, #8
 8000128:	9300      	str	r3, [sp, #0]
    if(a!=b)
 800012a:	9a01      	ldr	r2, [sp, #4]
 800012c:	9b00      	ldr	r3, [sp, #0]
 800012e:	429a      	cmp	r2, r3
 8000130:	d001      	beq.n	8000136 <main+0x16>
        a=b;
 8000132:	9b00      	ldr	r3, [sp, #0]
 8000134:	9301      	str	r3, [sp, #4]
    while(1){
        a++;
 8000136:	9b01      	ldr	r3, [sp, #4]
 8000138:	3301      	adds	r3, #1
 800013a:	9301      	str	r3, [sp, #4]
        b++;
 800013c:	9b00      	ldr	r3, [sp, #0]
 800013e:	3301      	adds	r3, #1
 8000140:	9300      	str	r3, [sp, #0]
 8000142:	e7f8      	b.n	8000136 <main+0x16>
