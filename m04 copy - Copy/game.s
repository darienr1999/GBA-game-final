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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets.part.0, %function
updateBullets.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L10
	add	r5, r3, #8
	ldm	r5, {r5, r6}
	ldm	r3, {ip, lr}
	sub	sp, sp, #16
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	mov	r4, r0
	ldr	r0, [r0, #4]
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	str	r6, [sp, #12]
	ldr	r5, .L10+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L2
	mov	r1, #0
	ldr	r2, .L10+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	str	r1, [r4, #20]
.L2:
	ldr	r2, [r4]
	ldr	r3, [r4, #12]
	add	r3, r2, r3
	cmp	r3, #1
	movle	r3, #0
	ldrgt	r3, [r4, #8]
	addgt	r2, r3, r2
	strgt	r2, [r4]
	strle	r3, [r4, #20]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	boss
	.word	collision
	.word	bossHealth
	.size	updateBullets.part.0, .-updateBullets.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #256
	ldr	r4, .L16
	mov	r0, #3
	ldr	r2, .L16+4
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L16+12
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	lr, #3
	mov	r5, #16
	mov	r4, #1
	mov	r7, #112
	mov	r6, #80
	mov	r0, #8
	mvn	ip, #1
	ldr	r1, .L16+20
	mov	r2, r3
	str	r3, [r1, #24]
	str	r3, [r1, #36]
	str	r3, [r1, #48]
	str	r3, [r1, #60]
	str	r3, [r1, #68]
	str	r3, [r1, #72]
	str	r3, [r1, #64]
	str	r3, [r1, #76]
	str	r3, [r1, #80]
	ldr	r3, .L16+24
	str	r7, [r1]
	str	r6, [r1, #4]
	str	r5, [r1, #16]
	str	r5, [r1, #20]
	str	r4, [r1, #12]
	str	r4, [r1, #8]
	str	lr, [r1, #40]
	str	lr, [r1, #56]
	str	lr, [r1, #52]
	add	r1, r3, #160
.L13:
	str	r0, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3]
	str	r2, [r3, #20]
	str	r2, [r3, #28]
	stmib	r3, {r2, ip}
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L13
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	83886592
	.word	finalGameSpriteSheetPal
	.word	100728832
	.word	finalGameSpriteSheetTiles
	.word	player
	.word	bullets
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #8
	mov	r2, #0
	mvn	ip, #1
	ldr	r3, .L22
	add	r0, r3, #160
.L19:
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3]
	str	r2, [r3, #20]
	str	r2, [r3, #28]
	stmib	r3, {r2, ip}
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L19
	bx	lr
.L23:
	.align	2
.L22:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r1, .L35
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	beq	.L34
.L25:
	add	r3, r3, #1
	cmp	r3, #5
	bxeq	lr
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	bne	.L25
.L34:
	push	{r4, r5, r6, lr}
	mov	r6, #1
	ldr	r4, .L35+4
	ldr	r5, .L35+8
	ldr	r1, [r4, #16]
	add	r2, r5, r2
	add	lr, r1, r1, lsr #31
	ldr	ip, [r2, #16]
	ldr	r1, [r4]
	add	ip, ip, ip, lsr #31
	add	r1, r1, lr, asr r6
	ldr	lr, [r4, #4]
	sub	r1, r1, ip, asr r6
	str	lr, [r5, r3, lsl #5]
	str	r6, [r2, #20]
	str	r0, [r2, #28]
	str	r1, [r2, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	bullets+20
	.word	player
	.word	bullets
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L91
	ldr	r3, [r5, #60]
	cmp	r3, #0
	beq	.L38
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #16]
	add	r2, r1, r3
	cmp	r2, #159
	movle	r2, #1
	movgt	r2, #0
	cmp	r1, #0
	movle	r2, #0
	cmp	r2, #0
	ldrne	r2, [r5, #52]
	addne	r1, r2, r1
	ldr	r2, [r5]
	add	r3, r3, r2
	strne	r1, [r5, #4]
	cmp	r3, #239
	movle	r3, #1
	movgt	r3, #0
	cmp	r2, #5
	movle	r3, #0
	cmp	r3, #0
	ldrne	r3, [r5, #56]
	addne	r2, r3, r2
	ldr	r3, [r5, #64]
	strne	r2, [r5]
	cmp	r3, #10
	movgt	r2, #0
	movgt	r3, #1
	addle	r3, r3, #1
	strgt	r2, [r5, #60]
	strgt	r2, [r5, #68]
	str	r3, [r5, #64]
	ldr	r7, .L91+4
.L43:
	ldr	r4, .L91+8
	add	r6, r4, #160
.L63:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L89
.L62:
	add	r4, r4, #32
	cmp	r6, r4
	bne	.L63
	ldr	r3, [r7]
	cmp	r3, #0
	bgt	.L37
	ldr	r3, [r5, #80]
	cmp	r3, #60
	addle	r3, r3, #1
	strle	r3, [r5, #80]
	mov	r3, #1
	str	r3, [r5, #76]
.L37:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L89:
	mov	r0, r4
	bl	updateBullets.part.0
	b	.L62
.L38:
	ldr	r2, .L91+12
	ldrh	r2, [r2, #48]
	tst	r2, #64
	str	r3, [r5, #56]
	str	r3, [r5, #52]
	bne	.L45
	mvn	r2, #2
	ldr	r3, [r5, #4]
	cmp	r3, #0
	str	r2, [r5, #52]
	ldrgt	r2, [r5, #8]
	subgt	r3, r3, r2
	strgt	r3, [r5, #4]
.L45:
	ldr	r3, .L91+12
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L48
	mov	r0, #3
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #20]
	ldr	r1, [r5, #8]
	add	r3, r2, r3
	add	r3, r3, r1
	cmp	r3, #160
	addle	r2, r2, r1
	str	r0, [r5, #52]
	strle	r2, [r5, #4]
.L48:
	ldr	r3, .L91+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L51
	mvn	r2, #2
	ldr	r3, [r5]
	ldr	r1, [r5, #8]
	sub	r3, r3, r1
	cmp	r3, #0
	str	r2, [r5, #56]
	strgt	r3, [r5]
.L51:
	ldr	r3, .L91+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L54
	mov	r2, #3
	ldr	r3, [r5]
	ldr	r1, [r5, #8]
	add	r3, r3, r1
	cmp	r3, #224
	str	r2, [r5, #56]
	strle	r3, [r5]
.L54:
	ldr	r3, .L91+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L56
	ldr	r2, .L91+20
	ldrh	r2, [r2]
	ands	r2, r2, #1
	bne	.L56
	ldr	r1, [r5, #48]
	cmp	r1, #1
	beq	.L88
	cmp	r1, #0
	bne	.L56
	mov	r2, #1
.L88:
	str	r2, [r5, #48]
.L56:
	tst	r3, #2
	beq	.L58
	ldr	r2, .L91+20
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L58
	ldr	r2, [r5, #68]
	cmp	r2, #60
	movgt	r2, #1
	strgt	r2, [r5, #60]
.L58:
	tst	r3, #4
	bne	.L85
	ldr	r3, [r5, #72]
	cmp	r3, #15
	ldr	r7, .L91+4
	addle	r3, r3, #1
	bgt	.L90
.L61:
	ldr	r2, [r5, #68]
	cmp	r2, #61
	addle	r2, r2, #1
	str	r3, [r5, #72]
	strle	r2, [r5, #68]
	b	.L43
.L85:
	ldr	r3, .L91+20
	ldrh	r3, [r3]
	ldr	r7, .L91+4
	tst	r3, #4
	ldreq	r3, [r7]
	addeq	r3, r3, #5
	streq	r3, [r7]
	ldr	r3, [r5, #72]
	cmp	r3, #15
	addle	r3, r3, #1
	ble	.L61
.L90:
	ldr	r0, [r5, #48]
	bl	fireBullet
	mov	r3, #1
	b	.L61
.L92:
	.align	2
.L91:
	.word	player
	.word	lives
	.word	bullets
	.word	67109120
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	b	updateBullets.part.0
	.size	updateBullets, .-updateBullets
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L96
	ldr	r3, [r0, #28]
	cmp	r3, #0
	movne	ip, #224
	moveq	ip, #192
	ldrh	r2, [r0]
	ldrh	r3, [r0, #4]
	ldr	r0, .L104
	str	lr, [sp, #-4]!
	lsl	lr, r1, #3
	add	r1, r0, r1, lsl #3
	strh	r2, [r0, lr]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L96:
	mov	r2, #512
	ldr	r3, .L104
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L105:
	.align	2
.L104:
	.word	shadowOAM
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L116
	ldr	r2, [r3, #76]
	cmp	r2, #0
	push	{r4, r5, r6, lr}
	bne	.L107
	ldr	r2, [r3, #60]
	cmp	r2, #0
	beq	.L115
	mov	r1, #2
.L114:
	ldm	r3, {r2, ip}
	ldr	r3, .L116+4
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	b	.L110
.L107:
	mov	r2, #512
	ldr	r3, .L116+4
	strh	r2, [r3]	@ movhi
	add	r0, r0, #1
.L110:
	mov	r4, r0
	ldr	r5, .L116+8
	add	r6, r0, #5
.L111:
	mov	r1, r4
	mov	r0, r5
	add	r4, r4, #1
	bl	drawBullets
	cmp	r4, r6
	add	r5, r5, #32
	bne	.L111
	ldr	r3, .L116+12
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L115:
	ldr	r2, [r3, #48]
	cmp	r2, #1
	moveq	r1, #64
	beq	.L114
	cmp	r2, #0
	bne	.L110
	ldm	r3, {r1, ip}
	ldr	r3, .L116+4
	orr	r1, r1, #16384
	strh	r1, [r3, #2]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	b	.L110
.L117:
	.align	2
.L116:
	.word	player
	.word	shadowOAM
	.word	bullets
	.word	.LANCHOR0
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoss, %function
initBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, #0
	mov	r4, #1
	mov	r7, #30
	mov	r6, #192
	mov	r5, #24
	mov	r1, #8
	mov	r2, lr
	ldr	ip, .L128
	ldr	r3, .L128+4
	str	lr, [ip, #4]
	add	r0, r3, #1072
	str	lr, [ip, #16]
	str	lr, [ip, #20]
	str	lr, [ip, #36]
	str	lr, [ip, #52]
	str	lr, [ip, #56]
	str	lr, [ip, #64]
	str	lr, [ip, #72]
	str	lr, [ip, #60]
	str	r7, [ip]
	str	r6, [ip, #8]
	str	r5, [ip, #12]
	str	r4, [ip, #28]
	str	r4, [ip, #32]
	str	r4, [ip, #40]
	str	r4, [ip, #68]
	str	r4, [ip, #44]
	str	r4, [ip, #48]
	add	r0, r0, r1
.L119:
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #20]
	str	r2, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L119
	mov	r4, #16
	mov	lr, #240
	mov	ip, #3
	mov	r2, #0
	mov	r0, #2
	ldr	r3, .L128+8
	add	r1, r3, #132
.L120:
	str	r4, [r3, #12]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L120
	mov	r4, #160
	mov	lr, #64
	mov	ip, #14
	mov	r2, #0
	mov	r0, #1
	ldr	r3, .L128+12
	add	r1, r3, #264
.L121:
	str	r4, [r3, #12]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L121
	mov	r2, #0
	ldr	r3, .L128+16
	add	r1, r3, #128
.L122:
	str	r2, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [r3, #20]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L122
	mov	r1, #32
	mov	lr, #120
	mov	ip, #80
	mov	r0, #1
	ldr	r3, .L128+20
	str	lr, [r3]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #24]
	str	ip, [r3, #4]
	str	r0, [r3, #20]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L129:
	.align	2
.L128:
	.word	boss
	.word	bossBullets
	.word	waves
	.word	rays
	.word	portals
	.word	mine
	.size	initBoss, .-initBoss
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initPlayer
	bl	initBoss
	ldr	r3, .L132
	mov	lr, pc
	bx	r3
	mov	r0, #1
	mov	lr, #380
	ldr	r1, .L132+4
	ldr	ip, .L132+8
	str	r0, [r1]
	ldr	r4, .L132+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L132+16
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L133:
	.align	2
.L132:
	.word	hideSprites
	.word	lives
	.word	bossHealth
	.word	DMANow
	.word	shadowOAM
	.size	initGame, .-initGame
	.align	2
	.global	updateBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoss, %function
updateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L147
	ldr	r3, [r2, #40]
	cmp	r3, #0
	bne	.L135
	mov	r3, #1
	str	r3, [r2, #40]
	bx	lr
.L135:
	cmp	r3, #1
	push	{r4, lr}
	beq	.L143
	cmp	r3, #2
	beq	.L144
	cmp	r3, #3
	beq	.L145
	cmp	r3, #4
	beq	.L146
.L134:
	pop	{r4, lr}
	bx	lr
.L143:
	ldr	r3, .L147+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L144:
	ldr	r3, .L147+8
	mov	lr, pc
	bx	r3
	b	.L134
.L145:
	ldr	r3, .L147+12
	mov	lr, pc
	bx	r3
	b	.L134
.L146:
	ldr	r3, .L147+16
	mov	lr, pc
	bx	r3
	b	.L134
.L148:
	.align	2
.L147:
	.word	boss
	.word	phase1
	.word	phase2
	.word	phase3
	.word	phase4
	.size	updateBoss, .-updateBoss
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	pop	{r4, lr}
	b	updateBoss
	.size	updateGame, .-updateGame
	.align	2
	.global	initBossBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBossBullets, %function
initBossBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #8
	mov	r2, #0
	ldr	r3, .L155
	add	r0, r3, #1072
	add	r0, r0, r1
.L152:
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #20]
	str	r2, [r3, #28]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L152
	bx	lr
.L156:
	.align	2
.L155:
	.word	bossBullets
	.size	initBossBullets, .-initBossBullets
	.align	2
	.global	drawBossBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBossBullets, %function
drawBossBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L158
	ldr	r3, [r0, #28]
	cmp	r3, #1
	moveq	r2, #160
	str	lr, [sp, #-4]!
	beq	.L166
	cmp	r3, #0
	moveq	r2, #128
	beq	.L166
	cmp	r3, #2
	bne	.L160
	mov	r2, #256
.L166:
	ldr	lr, [r0]
	ldr	r3, .L167
	ldr	r0, [r0, #4]
	lsl	ip, r1, #3
	strh	lr, [r3, ip]	@ movhi
	add	r3, r3, r1, lsl #3
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	add	r1, r1, #1
.L160:
	ldr	r3, .L167+4
	ldr	lr, [sp], #4
	str	r1, [r3]
	bx	lr
.L158:
	mov	r0, #512
	ldr	r2, .L167
	lsl	r3, r1, #3
	strh	r0, [r2, r3]	@ movhi
	ldr	r3, .L167+4
	add	r1, r1, #1
	str	r1, [r3]
	bx	lr
.L168:
	.align	2
.L167:
	.word	shadowOAM
	.word	.LANCHOR0
	.size	drawBossBullets, .-drawBossBullets
	.align	2
	.global	initWaves
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWaves, %function
initWaves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #3
	mov	r4, #16
	mov	lr, #240
	mov	r2, #0
	mov	r0, #2
	ldr	r3, .L173
	add	r1, r3, #132
.L170:
	str	r4, [r3, #12]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L170
	pop	{r4, lr}
	bx	lr
.L174:
	.align	2
.L173:
	.word	waves
	.size	initWaves, .-initWaves
	.align	2
	.global	drawWaves
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWaves, %function
drawWaves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L176
	ldr	r3, [r0, #28]
	cmp	r3, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	beq	.L180
	cmp	r3, #2
	movne	r6, #4
	moveq	r6, #132
	movne	r8, #6
	moveq	r8, #134
.L177:
	ldr	r5, [r0]
	ldrh	r3, [r0, #4]
	ldr	r7, .L187
	orr	r4, r5, #16384
	add	r0, r3, #224
	lsl	r4, r4, #16
	lsl	r0, r0, #16
	ldr	r9, .L187+4
	lsr	r4, r4, #16
	lsr	r0, r0, #16
	add	r2, r7, r1, lsl #3
.L178:
	add	lr, r3, #32
	orr	ip, r3, r9
	lsl	r3, lr, #16
	lsr	r3, r3, #16
	cmp	r0, r3
	strh	r4, [r2]	@ movhi
	strh	r8, [r2, #4]	@ movhi
	strh	ip, [r2, #2]	@ movhi
	add	r2, r2, #8
	bne	.L178
	add	r3, r1, #7
	lsl	r2, r3, #3
	orr	r0, r0, #16384
	add	r3, r7, r3, lsl #3
	strh	r5, [r7, r2]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r6, [r3, #4]	@ movhi
	ldr	r3, .L187+8
	add	r1, r1, #8
	str	r1, [r3]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L176:
	mov	r0, #512
	ldr	r2, .L187
	lsl	r3, r1, #3
	strh	r0, [r2, r3]	@ movhi
	ldr	r3, .L187+8
	add	r1, r1, #8
	str	r1, [r3]
	bx	lr
.L180:
	mov	r6, #68
	mov	r8, #70
	b	.L177
.L188:
	.align	2
.L187:
	.word	shadowOAM
	.word	-32768
	.word	.LANCHOR0
	.size	drawWaves, .-drawWaves
	.align	2
	.global	initRays
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRays, %function
initRays:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #14
	mov	r4, #160
	mov	lr, #64
	mov	r2, #0
	mov	r0, #1
	ldr	r3, .L193
	add	r1, r3, #264
.L190:
	str	r4, [r3, #12]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L190
	pop	{r4, lr}
	bx	lr
.L194:
	.align	2
.L193:
	.word	rays
	.size	initRays, .-initRays
	.align	2
	.global	drawRays
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRays, %function
drawRays:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	push	{r4, r5, r6, r7, lr}
	add	r3, r1, #1
	bne	.L196
	mov	r2, #512
	ldr	r0, .L214
	lsl	r3, r3, #3
	lsl	ip, r1, #3
	strh	r2, [r0, ip]	@ movhi
	strh	r2, [r0, r3]	@ movhi
	ldr	r3, .L214+4
	add	lr, r0, r1, lsl #3
	add	r1, r1, #4
	strh	r2, [lr, #16]	@ movhi
	strh	r2, [lr, #24]	@ movhi
	str	r1, [r3]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L196:
	ldr	r2, [r0, #40]
	cmp	r2, #0
	ldr	ip, [r0, #36]
	ldr	lr, [r0, #28]
	beq	.L198
	cmp	ip, #0
	bne	.L199
	cmp	lr, #0
	beq	.L206
	cmp	lr, #2
	movne	r5, #8
	moveq	r5, #136
	movne	r6, #4
	moveq	r6, #132
.L200:
	ldr	r4, [r0, #4]
	ldrh	r0, [r0]
	ldr	r2, .L214
	ldr	lr, .L214+8
	lsl	r7, r1, #3
	add	ip, r4, #32
	orr	r0, r0, #16384
	strh	r0, [r2, r7]	@ movhi
	orr	r4, r4, lr
	lsl	r7, r3, #3
	orr	ip, ip, lr
	add	r3, r2, r3, lsl #3
	add	lr, r2, r1, lsl #3
	strh	r6, [lr, #4]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	strh	r0, [r2, r7]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r5, [r3, #4]	@ movhi
	ldr	r3, .L214+4
	add	r1, r1, #2
	str	r1, [r3]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L198:
	cmp	ip, #0
	bne	.L202
	cmp	lr, #0
	beq	.L209
	cmp	lr, #2
	movne	r4, #576
	moveq	r4, #580
	movne	r5, #448
	moveq	r5, #452
.L203:
	ldm	r0, {r0, r2}
	ldr	lr, .L214+8
	ldr	r6, .L214
	orr	r2, r2, lr
	lsl	r7, r1, #3
	add	ip, r0, #32
	lsl	r2, r2, #16
	orr	r0, r0, lr
	strh	r0, [r6, r7]	@ movhi
	lsr	r2, r2, #16
	orr	ip, ip, lr
	lsl	r0, r3, #3
	add	lr, r6, r1, lsl #3
	add	r3, r6, r3, lsl #3
	strh	r2, [lr, #2]	@ movhi
	strh	r5, [lr, #4]	@ movhi
	strh	ip, [r6, r0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	ldr	r3, .L214+4
	add	r1, r1, #2
	str	r1, [r3]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L199:
	cmp	lr, #2
	movhi	r2, #0
	ldrls	ip, .L214+12
	addls	r2, ip, lr, lsl #2
	ldrls	r2, [r2, #12]
	ldrls	ip, [ip, lr, lsl #2]
	ldrh	r4, [r0]
	ldrh	lr, [r0, #4]
	addls	r2, r2, ip, lsl #5
	ldr	r0, .L214
	lslls	r2, r2, #16
	orr	lr, lr, #49152
	add	r5, r0, r1, lsl #3
	lsrls	r2, r2, #16
	lsl	r6, r1, #3
	strh	r4, [r0, r6]	@ movhi
	strh	lr, [r5, #2]	@ movhi
	strh	r2, [r5, #4]	@ movhi
	add	r6, r4, #64
	lsl	r5, r3, #3
	add	r3, r0, r3, lsl #3
	strh	r6, [r0, r5]	@ movhi
	add	ip, r1, #2
	strh	lr, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ldr	r3, .L214+4
	lsl	r5, ip, #3
	add	r4, r4, #128
	add	ip, r0, ip, lsl #3
	add	r1, r1, #3
	strh	r4, [r0, r5]	@ movhi
	strh	lr, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	str	r1, [r3]
	bx	lr
.L202:
	cmp	lr, #2
	ldrls	r2, .L214+16
	ldrls	r3, .L214+20
	ldrls	ip, [r2, lr, lsl #2]
	ldrls	r2, [r3, lr, lsl #2]
	ldrh	r3, [r0, #4]
	addls	r2, r2, ip, lsl #5
	lslls	ip, r2, #16
	movhi	ip, r2
	add	lr, r3, #256
	ldr	r2, .L214
	ldrh	r6, [r0]
	ldr	r5, .L214+24
	lsl	r0, lr, #16
	lsrls	ip, ip, #16
	lsr	r0, r0, #16
	add	r2, r2, r1, lsl #3
.L205:
	add	r4, r3, #64
	orr	lr, r3, r5
	lsl	r3, r4, #16
	lsr	r3, r3, #16
	cmp	r3, r0
	strh	r6, [r2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	add	r2, r2, #8
	bne	.L205
	ldr	r3, .L214+4
	add	r1, r1, #4
	str	r1, [r3]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L206:
	mov	r5, #72
	mov	r6, #68
	b	.L200
.L209:
	ldr	r4, .L214+28
	ldr	r5, .L214+32
	b	.L203
.L215:
	.align	2
.L214:
	.word	shadowOAM
	.word	.LANCHOR0
	.word	-32768
	.word	.LANCHOR1
	.word	CSWTCH.34
	.word	CSWTCH.33
	.word	-16384
	.word	578
	.word	450
	.size	drawRays, .-drawRays
	.align	2
	.global	initPortals
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPortals, %function
initPortals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L220
	add	r1, r3, #128
.L217:
	str	r2, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [r3, #20]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L217
	bx	lr
.L221:
	.align	2
.L220:
	.word	portals
	.size	initPortals, .-initPortals
	.align	2
	.global	drawPortals
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPortals, %function
drawPortals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	cmp	r3, #0
	add	ip, r1, #2
	add	r3, r1, #1
	bne	.L223
	mov	r0, #512
	ldr	r2, .L235
	lsl	r3, r3, #3
	lsl	r1, r1, #3
	strh	r0, [r2, r1]	@ movhi
	strh	r0, [r2, r3]	@ movhi
	ldr	r3, .L235+4
	str	ip, [r3]
	bx	lr
.L223:
	ldr	r2, [r0, #28]
	cmp	r2, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r2, [r0, #20]
	beq	.L225
	cmp	r2, #0
	beq	.L228
	cmp	r2, #1
	ldr	r5, .L235+8
	ldr	r6, .L235+12
	movne	r5, #452
	movne	r6, #448
.L226:
	ldr	lr, [r0, #4]
	ldrh	r0, [r0]
	ldr	r2, .L235
	ldr	r7, .L235+16
	lsl	r4, r1, #3
	orr	r0, r0, #16384
	strh	r0, [r2, r4]	@ movhi
	add	r4, lr, #32
	orr	r4, r4, r7
	orr	lr, lr, r7
	add	r1, r2, r1, lsl #3
	lsl	r7, r3, #3
	add	r3, r2, r3, lsl #3
	strh	r6, [r1, #4]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	strh	r0, [r2, r7]	@ movhi
	strh	r4, [r3, #2]	@ movhi
	strh	r5, [r3, #4]	@ movhi
	ldr	r3, .L235+4
	pop	{r4, r5, r6, r7, r8, lr}
	str	ip, [r3]
	bx	lr
.L225:
	cmp	r2, #0
	beq	.L230
	cmp	r2, #1
	movne	r4, #640
	moveq	r4, #648
	movne	r5, #512
	moveq	r5, #520
.L227:
	ldr	r2, [r0, #4]
	ldr	lr, .L235+16
	ldr	r7, [r0]
	ldr	r6, .L235
	orr	r2, r2, lr
	add	r0, r7, #32
	lsl	r2, r2, #16
	orr	r7, r7, lr
	lsl	r8, r1, #3
	lsr	r2, r2, #16
	add	r1, r6, r1, lsl #3
	orr	r0, r0, lr
	lsl	lr, r3, #3
	add	r3, r6, r3, lsl #3
	strh	r7, [r6, r8]	@ movhi
	strh	r5, [r1, #4]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r6, lr]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	ldr	r3, .L235+4
	pop	{r4, r5, r6, r7, r8, lr}
	str	ip, [r3]
	bx	lr
.L230:
	ldr	r4, .L235+20
	ldr	r5, .L235+24
	b	.L227
.L228:
	ldr	r5, .L235+28
	ldr	r6, .L235+32
	b	.L226
.L236:
	.align	2
.L235:
	.word	shadowOAM
	.word	.LANCHOR0
	.word	466
	.word	462
	.word	-32768
	.word	646
	.word	518
	.word	458
	.word	454
	.size	drawPortals, .-drawPortals
	.align	2
	.global	drawBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoss, %function
drawBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L252
	ldr	r7, .L252+4
	ldrh	r1, [r8]
	add	r2, r7, r0, lsl #3
	mov	lr, r2
	mov	ip, r1
	mov	r3, #352
	ldr	r4, [r8, #4]
	orr	r9, r4, #16384
	lsl	r9, r9, #16
	lsr	r9, r9, #16
.L238:
	add	r5, r3, #4
	strh	r3, [lr, #4]	@ movhi
	lsl	r3, r5, #16
	lsr	r3, r3, #16
	add	r6, ip, #32
	orr	r5, ip, #16384
	cmp	r3, #376
	lsl	ip, r6, #16
	strh	r9, [lr]	@ movhi
	strh	r5, [lr, #2]	@ movhi
	lsr	ip, ip, #16
	add	lr, lr, #8
	bne	.L238
	mov	r3, #384
	add	ip, r4, #8
	orr	ip, ip, #16384
	lsl	ip, ip, #16
	ldr	r5, .L252+8
	lsr	ip, ip, #16
.L239:
	add	lr, r3, #4
	strh	r3, [r2, #52]	@ movhi
	lsl	r3, lr, #16
	lsr	r3, r3, #16
	add	r4, r1, #32
	orr	lr, r1, r5
	cmp	r3, #408
	lsl	r1, r4, #16
	strh	ip, [r2, #48]	@ movhi
	strh	lr, [r2, #50]	@ movhi
	lsr	r1, r1, #16
	add	r2, r2, #8
	bne	.L239
	ldr	r5, .L252+12
	add	r1, r0, #12
	ldr	r0, .L252+16
	str	r1, [r5]
	bl	drawWaves
	ldr	r1, [r5]
	ldr	r0, .L252+20
	bl	drawWaves
	ldr	r1, [r5]
	ldr	r0, .L252+24
	bl	drawWaves
	ldr	r4, .L252+28
	add	r6, r4, #1072
	add	r6, r6, #8
.L240:
	mov	r0, r4
	ldr	r1, [r5]
	add	r4, r4, #36
	bl	drawBossBullets
	cmp	r4, r6
	bne	.L240
	ldr	r3, [r8, #40]
	sub	r2, r3, #3
	cmp	r2, #1
	bhi	.L241
	ldr	r1, [r5]
	ldr	r0, .L252+32
	bl	drawPortals
	ldr	r1, [r5]
	ldr	r0, .L252+36
	bl	drawPortals
	ldr	r1, [r5]
	ldr	r0, .L252+40
	bl	drawPortals
	ldr	r1, [r5]
	ldr	r0, .L252+44
	bl	drawPortals
	ldr	r3, [r8, #40]
.L241:
	sub	r3, r3, #2
	cmp	r3, #2
	bhi	.L246
	ldr	r4, .L252+48
	add	r6, r4, #264
.L245:
	mov	r0, r4
	ldr	r1, [r5]
	add	r4, r4, #44
	bl	drawRays
	cmp	r4, r6
	bne	.L245
.L246:
	ldr	r1, .L252+52
	ldr	r3, [r1, #16]
	cmp	r3, #0
	ldr	r3, [r5]
	beq	.L244
	ldr	r2, [r1, #4]
	mvn	r2, r2, lsl #17
	mov	r0, #768
	mvn	r2, r2, lsr #17
	ldr	ip, [r1]
	lsl	r1, r3, #3
	strh	ip, [r7, r1]	@ movhi
	add	r7, r7, r3, lsl #3
	strh	r2, [r7, #2]	@ movhi
	strh	r0, [r7, #4]	@ movhi
	add	r3, r3, #1
.L244:
	str	r3, [r5]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L253:
	.align	2
.L252:
	.word	boss
	.word	shadowOAM
	.word	-32768
	.word	.LANCHOR0
	.word	waves
	.word	waves+44
	.word	waves+88
	.word	bossBullets
	.word	portals
	.word	portals+32
	.word	portals+64
	.word	portals+96
	.word	rays
	.word	mine
	.size	drawBoss, .-drawBoss
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L256
	ldr	r0, [r4]
	bl	drawPlayer
	ldr	r0, [r4]
	bl	drawBoss
	mov	ip, #1
	mov	r3, #512
	str	ip, [r4]
	mov	r2, #117440512
	ldr	r4, .L256+4
	mov	r0, #3
	ldr	r1, .L256+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L257:
	.align	2
.L256:
	.word	.LANCHOR0
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.align	2
	.global	initMine
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMine, %function
initMine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #32
	mov	lr, #120
	mov	r2, #0
	mov	ip, #80
	mov	r0, #1
	ldr	r3, .L260
	str	lr, [r3]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #4]
	str	r0, [r3, #20]
	str	r2, [r3, #16]
	str	r2, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L261:
	.align	2
.L260:
	.word	mine
	.size	initMine, .-initMine
	.align	2
	.global	drawMine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMine, %function
drawMine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L271
	ldr	r3, [r1, #16]
	cmp	r3, #0
	beq	.L268
	ldr	r2, [r1, #4]
	mvn	r2, r2, lsl #17
	mov	ip, #768
	mvn	r2, r2, lsr #17
	str	lr, [sp, #-4]!
	ldr	r3, .L271+4
	ldr	lr, [r1]
	lsl	r1, r0, #3
	strh	lr, [r3, r1]	@ movhi
	add	r3, r3, r0, lsl #3
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	ldr	r3, .L271+8
	add	r0, r0, #1
	str	r0, [r3]
	ldr	lr, [sp], #4
	bx	lr
.L268:
	ldr	r3, .L271+8
	str	r0, [r3]
	bx	lr
.L272:
	.align	2
.L271:
	.word	mine
	.word	shadowOAM
	.word	.LANCHOR0
	.size	drawMine, .-drawMine
	.set	CSWTCH.34,CSWTCH.32
	.set	CSWTCH.33,CSWTCH.31
	.global	comboCounter
	.comm	bossHealth,4,4
	.comm	lives,4,4
	.global	count
	.comm	mine,28,4
	.comm	portals,128,4
	.comm	rays,264,4
	.comm	waves,132,4
	.comm	bossBullets,1080,4
	.comm	boss,80,4
	.comm	bullets,160,4
	.comm	player,84,4
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	CSWTCH.32, %object
	.size	CSWTCH.32, 12
CSWTCH.32:
	.word	0
	.word	0
	.word	8
	.type	CSWTCH.31, %object
	.size	CSWTCH.31, 12
CSWTCH.31:
	.word	20
	.word	12
	.word	24
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	count, %object
	.size	count, 4
count:
	.word	1
	.bss
	.align	2
	.type	comboCounter, %object
	.size	comboCounter, 4
comboCounter:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
