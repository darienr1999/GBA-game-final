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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+12
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startScreen2Pal
	.word	startScreen2Tiles
	.word	100720640
	.word	startScreen2Map
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4352
	mov	r0, #39936
	mov	r2, #0
	push	{r4, lr}
	strh	r1, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	ldr	r1, .L8
	ldr	r0, .L8+4
	ldrh	lr, [r1, #48]
	ldr	ip, .L8+8
	ldr	r1, .L8+12
	strh	lr, [r0]	@ movhi
	ldr	r0, .L8+16
	strh	r2, [r1]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	ldr	r1, .L8+20
	strh	r2, [r0]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L8+36
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	67109120
	.word	buttons
	.word	6660
	.word	oldButtons
	.word	vOff
	.word	setupSounds
	.word	setupInterrupts
	.word	stopSound
	.word	menu_length
	.word	menu_data
	.word	playSoundA
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r3, #1616
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L12+12
	mov	r0, #3
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	bg2Pal
	.word	bg2Tiles
	.word	100720640
	.word	bg2Map
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause.part.0, %function
pause.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L19+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L20:
	.align	2
.L19:
	.word	buttons
	.word	unpauseSound
	.size	pause.part.0, .-pause.part.0
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #30
	push	{r4, lr}
	ldr	r3, .L23
	strh	r1, [r2, #18]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L23+8
	mov	lr, pc
	bx	r4
	mov	ip, #2
	ldr	r0, .L23+12
	mov	r3, #256
	str	ip, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L23+16
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L23+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L23+24
	ldr	r1, .L23+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	state
	.word	pause2Pal
	.word	pause2Tiles
	.word	100720640
	.word	pause2Map
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L27
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	pause.part.0
.L28:
	.align	2
.L27:
	.word	oldButtons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #30
	mov	r5, #3
	ldr	r2, .L31
	ldr	r3, .L31+4
	ldr	r4, .L31+8
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r0, r5
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L31+12
	mov	lr, pc
	bx	r4
	ldr	ip, .L31+16
	mov	r0, r5
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L31+20
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r3, #960
	mov	r2, #100663296
	ldr	r1, .L31+24
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r3, #1024
	ldr	r2, .L31+28
	ldr	r1, .L31+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	vOff
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	state
	.word	YouWinPal
	.word	YouWinTiles
	.word	100720640
	.word	YouWinMap
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L41
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	ands	r3, r3, #8
	bxne	lr
	mov	r1, #67108864
	push	{r4, lr}
	ldr	r2, .L41+8
	strh	r3, [r1, #18]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L41+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L41+16
	ldr	r3, .L41+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	menu_length
	.word	menu_data
	.word	playSoundA
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r3, .L45
	ldrh	r3, [r3]
	add	r3, r3, #20
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	push	{r4, lr}
	strh	r3, [r2, #18]	@ movhi
	ldr	r3, .L45+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L45+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L45+12
	mov	lr, pc
	bx	r4
	mov	ip, #4
	ldr	r0, .L45+16
	mov	r3, #256
	str	ip, [r0]
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L45+20
	mov	lr, pc
	bx	r4
	mov	r3, #2064
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L45+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L45+28
	ldr	r1, .L45+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	state
	.word	losePal
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L58
	ldr	r3, .L58+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	ldr	r2, .L58+8
	sub	r3, r3, #1
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L58+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L48
	ldr	r3, .L58+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L55
.L48:
	ldr	r3, .L58+24
	ldr	r3, [r3, #80]
	cmp	r3, #60
	bgt	.L56
	ldr	r3, .L58+28
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L57
.L50:
	mov	r3, #67108864
	ldrh	r2, [r4]
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L56:
	mov	r2, #50
	ldr	r3, .L58+32
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L58+40
	ldr	r3, .L58+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+48
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L58+52
	ldr	r3, .L58+56
	mov	lr, pc
	bx	r3
	bl	goToLose
	ldr	r3, .L58+28
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L50
.L57:
	mov	r2, #30
	ldr	r3, .L58+32
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	bl	goToWin
	b	.L50
.L55:
	mov	r2, #30
	ldr	r3, .L58+60
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L48
.L59:
	.align	2
.L58:
	.word	vOff
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	player
	.word	bossHealth
	.word	stopSound
	.word	loseSound_length
	.word	loseSound_data
	.word	playSoundA
	.word	gameOver_length
	.word	gameOver_data
	.word	playSoundB
	.word	pauseSound
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.align	2
	.global	goToInstruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L63
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L63+4
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L63+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L63+12
	mov	r0, #3
	ldr	r1, .L63+16
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L63+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L64:
	.align	2
.L63:
	.word	DMANow
	.word	instructionPal
	.word	instructionTiles
	.word	100720640
	.word	instructionMap
	.word	state
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L92
	ldrh	r3, [r3]
	ands	r2, r3, #8
	push	{r4, lr}
	beq	.L66
	ldr	r1, .L92+4
	ldrh	r1, [r1]
	tst	r1, #8
	bne	.L66
	ldr	r1, .L92+8
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L89
.L66:
	tst	r3, #64
	beq	.L67
	ldr	r1, .L92+4
	ldrh	r1, [r1]
	tst	r1, #64
	bne	.L67
	ldr	ip, .L92+8
	ldr	r1, [ip]
	cmp	r1, #0
	beq	.L90
.L67:
	tst	r3, #128
	beq	.L69
	ldr	r3, .L92+4
	ldrh	r3, [r3]
	ands	ip, r3, #128
	bne	.L69
	ldr	lr, .L92+8
	ldr	r3, [lr]
	cmp	r3, #0
	bne	.L91
.L69:
	cmp	r2, #0
	beq	.L65
	ldr	r3, .L92+4
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L65
	ldr	r3, .L92+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L65
	pop	{r4, lr}
	b	goToInstruction
.L90:
	mov	lr, #1
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+12
	ldr	r4, .L92+16
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L92+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+24
	ldr	r1, .L92+28
	mov	lr, pc
	bx	r4
.L65:
	pop	{r4, lr}
	bx	lr
.L89:
	ldr	r3, .L92+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+40
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L92+44
	ldr	r3, .L92+48
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L91:
	ldr	r4, .L92+16
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L92+52
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L92+56
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L92+24
	ldr	r1, .L92+60
	mov	lr, pc
	bx	r4
	b	.L65
.L93:
	.align	2
.L92:
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR1
	.word	startScreenPal
	.word	DMANow
	.word	startScreenTiles
	.word	100720640
	.word	startScreenMap
	.word	initGame
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.word	startScreen2Pal
	.word	startScreen2Tiles
	.word	startScreen2Map
	.size	start, .-start
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L110
	ldr	fp, .L110+4
	ldr	r3, .L110+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L110+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r9, .L110+16
	ldr	r8, .L110+20
	ldr	r10, .L110+24
	ldr	r7, .L110+28
	ldr	r4, .L110+32
.L96:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L104
.L98:
	.word	.L102
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L99
	.word	.L97
.L99:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L100:
	tst	r0, #8
	beq	.L104
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L101:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L102:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L97:
	tst	r0, #8
	beq	.L104
	tst	r3, #8
	beq	.L109
.L104:
	mov	r0, r3
	b	.L96
.L109:
	ldr	r3, .L110+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L96
.L111:
	.align	2
.L110:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game
	.word	pause.part.0
	.word	win
	.word	67109120
	.word	goToStart
	.size	main, .-main
	.text
	.align	2
	.global	instruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L117
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L117+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L118:
	.align	2
.L117:
	.word	oldButtons
	.word	buttons
	.size	instruction, .-instruction
	.global	instr
	.comm	vOff,2,2
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	player,84,4
	.comm	bossHealth,4,4
	.comm	lives,4,4
	.global	screen
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	1
	.set	.LANCHOR0,. + 0
	.type	screen, %object
	.size	screen, 2
screen:
	.short	30
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	instr, %object
	.size	instr, 4
instr:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
