	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	r5, .L19
	add	ip, r1, ip
	ldr	r3, [r5]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r5, #4]
	orr	r0, r2, #-2130706432
	add	r2, r3, ip, lsl #1
	add	r3, r3, r4, lsl #1
.L12:
	add	ip, sp, #12
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r2
	str	r0, [r1, #44]
	bne	.L12
	pop	{r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	ldrb	lr, [sp, #56]	@ zero_extendqisi2
	ldrb	r4, [sp, #56]	@ zero_extendqisi2
	subs	ip, r3, #0
	orr	lr, lr, r4, lsl #8
	strh	lr, [sp, #14]	@ movhi
	ble	.L21
	add	ip, ip, r1
	sub	r5, r2, #2
	rsb	r4, ip, ip, lsl #4
	asr	r5, r5, #1
	sub	fp, r2, #1
	ldr	r7, .L39
	add	r9, r0, r2
	rsb	r3, r1, r1, lsl #4
	add	r8, r2, r2, lsr #31
	add	r1, r0, r4, lsl #4
	asr	r6, fp, #1
	orr	r4, r5, #-2130706432
	str	r4, [sp, #4]
	asr	r8, r8, #1
	sub	r9, r9, #1
	orr	r4, r6, #-2130706432
	add	r3, r0, r3, lsl #4
	ldr	lr, [r7]
	ldr	ip, [r7, #4]
	str	r4, [sp]
	orr	r8, r8, #-2130706432
	and	r9, r9, #1
	and	r0, r0, #1
	and	r5, r2, #1
	add	r10, sp, #14
	b	.L34
.L23:
	cmp	r5, #0
	beq	.L29
	cmp	r2, #1
	ble	.L38
	mov	r6, #0
	add	r4, r3, #1
	add	r4, r4, r4, lsr #31
	bic	r4, r4, #1
	add	r4, lr, r4
	str	r6, [ip, #44]
	str	r10, [ip, #36]
	str	r4, [ip, #40]
	ldr	r4, [sp]
	str	r4, [ip, #44]
.L38:
	add	r6, r3, r3, lsr #31
	bic	r6, r6, #1
	ldrb	r7, [sp, #56]	@ zero_extendqisi2
	ldrh	r4, [lr, r6]
	and	r4, r4, #255
	orr	r4, r4, r7, lsl #8
	strh	r4, [lr, r6]	@ movhi
.L25:
	add	r3, r3, #240
	cmp	r3, r1
	beq	.L21
.L34:
	cmp	r0, #0
	bne	.L23
	cmp	r5, #0
	bne	.L24
	add	r4, r3, r3, lsr #31
	bic	r4, r4, #1
	add	r3, r3, #240
	add	r4, lr, r4
	cmp	r3, r1
	str	r5, [ip, #44]
	str	r10, [ip, #36]
	str	r4, [ip, #40]
	str	r8, [ip, #44]
	bne	.L34
.L21:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L24:
	cmp	r2, #1
	ble	.L26
	add	r4, r3, r3, lsr #31
	bic	r4, r4, #1
	add	r4, lr, r4
	str	r0, [ip, #44]
	str	r10, [ip, #36]
	str	r4, [ip, #40]
	ldr	r4, [sp]
	str	r4, [ip, #44]
.L26:
	add	r4, fp, r3
	add	r4, r4, r4, lsr #31
	bic	r4, r4, #1
	ldrb	r6, [sp, #56]	@ zero_extendqisi2
	ldrh	r7, [lr, r4]
	cmp	r9, #0
	and	r6, r6, #255
	andne	r7, r7, #255
	andeq	r7, r7, #65280
	orrne	r7, r7, r6, lsl #8
	orreq	r7, r7, r6
	strh	r7, [lr, r4]	@ movhi
	b	.L25
.L29:
	cmp	r2, #2
	ble	.L31
	add	r4, r3, #1
	add	r4, r4, r4, lsr #31
	bic	r4, r4, #1
	add	r4, lr, r4
	str	r5, [ip, #44]
	str	r10, [ip, #36]
	str	r4, [ip, #40]
	ldr	r4, [sp, #4]
	str	r4, [ip, #44]
.L31:
	add	r4, fp, r3
	add	r4, r4, r4, lsr #31
	bic	r4, r4, #1
	ldrb	r6, [sp, #56]	@ zero_extendqisi2
	ldrh	r7, [lr, r4]
	cmp	r9, #0
	and	r6, r6, #255
	andne	r7, r7, #255
	andeq	r7, r7, #65280
	orrne	r7, r7, r6, lsl #8
	orreq	r7, r7, r6
	strh	r7, [lr, r4]	@ movhi
	b	.L38
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r2, .L43
	sub	sp, sp, #12
	ldm	r2, {r2, r3}
	ldr	r1, .L43+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldr	r1, .L47
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldm	r1, {r0, r3}
	ldr	r1, .L47+4
	orr	r2, r2, ip, lsl #8
	add	ip, sp, #14
	strh	r2, [sp, #14]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	lr, r2, #0
	ble	.L49
	mov	r4, #0
	ldr	r6, .L55
	rsb	r0, r0, r0, lsl #4
	add	r5, r1, r0, lsl #4
	ldr	r2, [r6]
	add	r0, r5, lr
	ldr	ip, [sp, #16]
	ldr	r1, [r6, #4]
	add	r0, r2, r0, lsl #1
	orr	lr, r3, #-2147483648
	add	r2, r2, r5, lsl #1
	lsl	r3, r3, #1
.L51:
	str	r4, [r1, #44]
	str	ip, [r1, #36]
	str	r2, [r1, #40]
	add	r2, r2, #2
	cmp	r2, r0
	str	lr, [r1, #44]
	add	ip, ip, r3
	bne	.L51
.L49:
	pop	{r4, r5, r6, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r7, .L65
	add	r2, r1, r2
	add	r3, r3, r3, lsr #31
	asr	lr, r3, #1
	rsb	r5, r1, r1, lsl #4
	rsb	r3, r2, r2, lsl #4
	ldr	ip, [sp, #20]
	ldr	r6, [r7]
	ldr	r2, [r7, #4]
	add	r1, r0, r3, lsl #4
	add	r0, r0, r5, lsl #4
	orr	r5, lr, #-2147483648
	lsl	lr, lr, #1
.L59:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r0, r1
	str	r4, [r2, #44]
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	add	ip, ip, lr
	str	r5, [r2, #44]
	bne	.L59
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L68
	ldr	r1, .L68+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L71
	ldr	r1, .L71+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L72:
	.align	2
.L71:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L74:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L74
	mov	r2, #67108864
.L75:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L75
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L82
	moveq	r2, #100663296
	ldr	r1, .L82+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L83:
	.align	2
.L82:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L86
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L87:
	.align	2
.L86:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L92
	add	r1, r1, r3
	sub	r1, r1, #1
	cmp	r1, lr
	bgt	.L94
.L92:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L94:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r3, r0
	ble	.L92
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #512
	ldr	r3, .L99
	add	r2, r3, #1024
.L96:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L96
	bx	lr
.L100:
	.align	2
.L99:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.comm	shadowOAM,1024,4
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
