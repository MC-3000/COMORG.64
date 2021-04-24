	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata
	.align	2
.LC2:
	.ascii	"\012 Cannot be terminated using Ctrl+C \000"
	.text
	.align	2
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	sigintHandler.6964, %function
sigintHandler.6964:
	@ Nested: function declared inside another function.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	mov	r3, ip
	str	ip, [fp, #-12]
	mov	r1, r3
	mov	r0, #2
	bl	signal
	ldr	r0, .L2
	bl	puts
	ldr	r3, .L2+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	fflush
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L3:
	.align	2
.L2:
	.word	.LC2
	.word	stdout
	.size	sigintHandler.6964, .-sigintHandler.6964
	.section	.rodata
	.align	2
.LTRAMP0:
	.syntax unified
	.arm
	ldr	ip, [pc, #0]
	ldr	pc, [pc, #0]
	.word	0
	.word	0
	.global	__clear_cache
	.align	2
.LC3:
	.ascii	"LED 0-7 by wiringPi\000"
	.align	2
.LC4:
	.ascii	"Setting up problem ... Abort!\000"
	.align	2
.LC5:
	.ascii	"b%d%d%d \012\000"
	.align	2
.LC0:
	.word	0
	.word	2
	.word	3
	.align	2
.LC1:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #140
	add	r3, fp, #4
	str	r3, [fp, #-24]
	sub	ip, fp, #40
	sub	lr, fp, #40
	ldr	r3, .L11
	mov	r4, ip
	ldm	r3, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	str	lr, [ip, #8]
	ldr	r3, .L11+4
	str	r3, [ip, #12]
	add	r3, ip, #16
	mov	r1, r3
	mov	r0, ip
	bl	__clear_cache
	ldr	r2, .L11+8
	sub	r3, fp, #52
	ldm	r2, {r0, r1, r2}
	stm	r3, {r0, r1, r2}
	ldr	r0, .L11+12
	bl	puts
	bl	wiringPiSetup
	mov	r3, r0
	cmn	r3, #1
	bne	.L5
	ldr	r0, .L11+16
	bl	printf
	mov	r0, #1
	bl	exit
.L5:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L6
.L7:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	ldr	r3, [r3, #-40]
	mov	r1, #1
	mov	r0, r3
	bl	pinMode
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L6:
	ldr	r3, [fp, #-16]
	cmp	r3, #3
	ble	.L7
	ldr	r2, .L11+20
	sub	r3, fp, #148
	mov	r1, r2
	mov	r2, #96
	mov	r0, r3
	bl	memcpy
.L10:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L8
.L9:
	ldr	r0, [fp, #-52]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	sub	r3, r3, #136
	ldr	r3, [r3]
	mov	r1, r3
	bl	digitalWrite
	ldr	r0, [fp, #-48]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	sub	r3, r3, #132
	ldr	r3, [r3]
	mov	r1, r3
	bl	digitalWrite
	ldr	r0, [fp, #-44]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	sub	r3, r3, #128
	ldr	r3, [r3]
	mov	r1, r3
	bl	digitalWrite
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	sub	r3, r3, #136
	ldr	r1, [r3]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	sub	r3, r3, #132
	ldr	r0, [r3]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	sub	r3, r3, #128
	ldr	r3, [r3]
	mov	r2, r0
	ldr	r0, .L11+24
	bl	printf
	mov	r0, #1000
	bl	delay
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L8:
	ldr	r3, [fp, #-20]
	cmp	r3, #7
	ble	.L9
	b	.L10
.L12:
	.align	2
.L11:
	.word	.LTRAMP0
	.word	sigintHandler.6964
	.word	.LC0
	.word	.LC3
	.word	.LC4
	.word	.LC1
	.word	.LC5
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"x",%progbits
