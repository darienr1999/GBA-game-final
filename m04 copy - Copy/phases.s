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
	.file	"phases.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBossBullets.part.0, %function
updateBossBullets.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L20
	ldr	ip, [r5, #16]
	sub	sp, sp, #16
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	ldr	r6, [r5, #20]
	ldr	lr, [r5, #4]
	mov	r4, r0
	ldr	r0, [r0, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L20+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L2
	ldr	r3, [r4, #28]
	cmp	r3, #2
	beq	.L17
	ldr	r2, [r5, #48]
	cmp	r3, r2
	beq	.L18
.L4:
	ldr	r2, .L20+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
.L2:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L5
	ldr	r2, [r4]
	ldr	r3, [r4, #12]
	add	r3, r2, r3
	cmp	r3, #180
	bgt	.L6
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	add	r3, r1, r3
	cmp	r3, #235
	movle	r3, #1
	movgt	r3, #0
	cmp	r1, #1
	movle	r3, #0
	cmp	r3, #0
	bne	.L19
.L6:
	mov	r3, #0
	str	r3, [r4, #20]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	add	r3, r2, r3
	cmp	r3, #240
	movgt	r3, #0
	ldrle	r3, [r4, #8]
	addle	r2, r3, r2
	strle	r2, [r4, #4]
	strgt	r3, [r4, #20]
	strgt	r3, [r4, #32]
.L1:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bne	.L2
	b	.L4
.L19:
	ldr	r0, [r4, #8]
	ldr	r3, [r4, #24]
	add	r2, r0, r2
	add	r1, r3, r1
	str	r2, [r4]
	str	r1, [r4, #4]
	b	.L1
.L18:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bne	.L4
	b	.L2
.L21:
	.align	2
.L20:
	.word	player
	.word	collision
	.word	lives
	.size	updateBossBullets.part.0, .-updateBossBullets.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWaves.part.0, %function
updateWaves.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L34
	ldr	ip, [r5, #16]
	sub	sp, sp, #16
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	ldr	r6, [r5, #20]
	ldr	lr, [r5, #4]
	mov	r4, r0
	ldr	r0, [r0, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L34+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L23
	ldr	r3, [r4, #28]
	cmp	r3, #2
	beq	.L32
	ldr	r2, [r5, #48]
	cmp	r3, r2
	beq	.L33
.L25:
	ldr	r2, .L34+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
.L23:
	ldr	r3, [r4]
	cmp	r3, #160
	movgt	r3, #0
	ldrle	r2, [r4, #8]
	addle	r3, r2, r3
	strle	r3, [r4]
	strgt	r3, [r4, #20]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bne	.L23
	b	.L25
.L33:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bne	.L25
	b	.L23
.L35:
	.align	2
.L34:
	.word	player
	.word	collision
	.word	lives
	.size	updateWaves.part.0, .-updateWaves.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMine.part.0, %function
updateMine.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L54
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	sub	sp, sp, #16
	ldr	r4, .L54+4
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r6, .L54+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r2, .L54+12
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L38
	ldr	r3, [r4, #4]
	ldr	r2, [r5]
	add	r1, r3, #8
	cmp	r2, r1
	ble	.L39
	ldr	r2, [r4, #20]
	add	r3, r2, r3
	str	r3, [r4, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L38:
	ldr	r3, [r4]
	ldr	r2, [r5, #4]
	add	r1, r3, #16
	cmp	r2, r1
	ble	.L42
	ldr	r2, [r4, #20]
	add	r3, r2, r3
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	add	r1, r3, #7
	cmp	r2, r1
	bgt	.L43
	ldr	r2, [r4, #20]
	sub	r3, r3, r2
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	add	r1, r3, #7
	cmp	r2, r1
	bgt	.L41
	ldr	r2, [r4, #20]
	sub	r3, r3, r2
	str	r3, [r4, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	add	r1, r3, #15
	cmp	r2, r1
	movle	r1, #1
	movgt	r1, #0
	cmp	r2, r3
	movle	r1, #0
	cmp	r1, #0
	movne	r3, #1
	strne	r3, [r4, #24]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	add	r1, r3, #15
	cmp	r2, r1
	movle	r1, #1
	movgt	r1, #0
	cmp	r2, r3
	movle	r1, #0
	cmp	r1, #0
	movne	r3, #0
	strne	r3, [r4, #24]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	player
	.word	mine
	.word	collision
	.word	lives
	.size	updateMine.part.0, .-updateMine.part.0
	.align	2
	.global	fireBossBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBossBullet, %function
fireBossBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L85
	ldr	r0, [r3, #40]
	cmp	r0, #1
	push	{r4, r5, r6, r7, r8, r9, lr}
	beq	.L82
	cmp	r0, #4
	beq	.L83
.L56:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L83:
	mov	r0, #1
	mov	lr, #2
	mov	r4, r0
	mov	r6, #80
	mov	r7, #120
	ldr	r5, [r3, #32]
	ldr	ip, .L85+4
.L66:
	mov	r3, #0
	ldr	r2, .L85+4
	b	.L71
.L67:
	add	r3, r3, #1
	cmp	r3, #30
	add	r2, r2, #36
	beq	.L70
.L71:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L67
	add	r3, r3, r3, lsl #3
	add	r2, ip, r3, lsl #2
	cmp	r0, #1
	str	lr, [r2, #28]
	str	r1, [r2, #24]
	beq	.L84
	str	r6, [ip, r3, lsl #2]
	str	lr, [r2, #4]
	str	r5, [r2, #8]
	str	r4, [r2, #20]
	str	r4, [r2, #32]
.L70:
	cmp	r0, #2
	beq	.L56
	add	r0, r0, #1
	b	.L66
.L82:
	ldr	lr, [r3, #28]
	subs	lr, lr, #0
	mov	r7, r0
	movne	lr, #1
	mov	r5, #120
	ldr	r4, [r3, #36]
	ldr	r6, [r3, #32]
	ldr	ip, .L85+4
	add	r8, r4, #1
	sub	r9, r4, #1
.L58:
	mov	r3, #0
	ldr	r2, .L85+4
	b	.L64
.L59:
	add	r3, r3, #1
	cmp	r3, #30
	add	r2, r2, #36
	beq	.L63
.L64:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L59
	add	r3, r3, r3, lsl #3
	add	r2, ip, r3, lsl #2
	str	r1, [ip, r3, lsl #2]
	subs	r3, r0, #1
	stmib	r2, {r5, r6}
	str	r7, [r2, #20]
	str	r1, [r2, #32]
	str	lr, [r2, #28]
	streq	r9, [r2, #24]
	beq	.L72
	cmp	r3, #1
	streq	r4, [r2, #24]
	strne	r8, [r2, #24]
	beq	.L72
.L63:
	cmp	r0, #3
	beq	.L56
.L72:
	add	r0, r0, #1
	b	.L58
.L84:
	str	r0, [r2, #20]
	str	lr, [ip, r3, lsl #2]
	str	r7, [r2, #4]
	str	r5, [r2, #8]
	str	r1, [r2, #32]
	add	r0, r0, #1
	b	.L66
.L86:
	.align	2
.L85:
	.word	boss
	.word	bossBullets
	.size	fireBossBullet, .-fireBossBullet
	.align	2
	.global	updateBossBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBossBullets, %function
updateBossBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	b	updateBossBullets.part.0
	.size	updateBossBullets, .-updateBossBullets
	.align	2
	.global	updateWaves
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWaves, %function
updateWaves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	b	updateWaves.part.0
	.size	updateWaves, .-updateWaves
	.align	2
	.global	fireWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireWave, %function
fireWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L107
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L92
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L98
	ldr	r2, [r3, #108]
	cmp	r2, #0
	bxne	lr
	mov	r2, #2
.L92:
	push	{r4, r5, lr}
	mov	r4, #1
	mov	r0, #0
	ldr	ip, .L107+4
	add	r1, r2, r2, lsl #2
	ldr	lr, [ip, #28]
	add	r1, r2, r1, lsl r4
	lsl	r5, r1, #2
	cmp	lr, r4
	add	r1, r3, r1, lsl #2
	str	r0, [r3, r5]
	str	r0, [r1, #4]
	str	r4, [r1, #20]
	lsl	r5, r2, #2
	beq	.L106
	cmp	lr, #0
	streq	r4, [r1, #28]
	beq	.L95
	mov	r0, #2
.L106:
	str	r0, [r1, #28]
.L95:
	ldr	r1, [ip, #40]
	cmp	r1, #4
	moveq	r1, #1
	addeq	r5, r5, r2
	addeq	r2, r2, r5, lsl r1
	addeq	r3, r3, r2, lsl #2
	streq	r1, [r3, #8]
	pop	{r4, r5, lr}
	bx	lr
.L98:
	mov	r2, #1
	b	.L92
.L108:
	.align	2
.L107:
	.word	waves
	.word	boss
	.size	fireWave, .-fireWave
	.align	2
	.global	phase1
	.syntax unified
	.arm
	.fpu softvfp
	.type	phase1, %function
phase1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L150
	ldr	r3, [r4, #52]
	cmp	r3, #15
	bgt	.L144
.L111:
	ldr	r3, [r4, #56]
	cmp	r3, #300
	ble	.L114
	mov	r2, #0
	ldr	r3, [r4, #28]
	sub	r1, r3, r2
	rsbs	r3, r1, #0
	adc	r3, r3, r1
	str	r2, [r4, #56]
	str	r3, [r4, #28]
.L114:
	ldr	r3, [r4, #72]
	cmp	r3, #200
	ble	.L143
	ldr	r2, [r4, #60]
	cmp	r2, #5
	ble	.L117
.L143:
	ldr	r1, [r4, #52]
	add	r3, r3, #1
	add	r1, r1, #1
.L116:
	ldr	r5, .L150+4
	ldr	r2, [r4, #56]
	ldr	r0, [r5, #20]
	add	r2, r2, #1
	cmp	r0, #0
	str	r3, [r4, #72]
	str	r1, [r4, #52]
	str	r2, [r4, #56]
	bne	.L145
.L121:
	ldr	r3, [r5, #64]
	cmp	r3, #0
	bne	.L146
.L122:
	ldr	r3, [r5, #108]
	cmp	r3, #0
	bne	.L147
.L123:
	ldr	r4, .L150+8
	add	r5, r4, #1072
	add	r5, r5, #8
	b	.L125
.L124:
	add	r4, r4, #36
	cmp	r4, r5
	beq	.L148
.L125:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L124
	mov	r0, r4
	add	r4, r4, #36
	bl	updateBossBullets.part.0
	cmp	r4, r5
	bne	.L125
.L148:
	pop	{r4, r5, r6, lr}
	bx	lr
.L117:
	sub	r2, r2, #3
	bics	r3, r2, #2
	beq	.L149
	bl	fireWave
	ldr	r1, [r4, #52]
	ldr	r2, [r4, #60]
	add	r1, r1, #1
.L120:
	mov	r3, #1
	add	r2, r2, r3
	str	r2, [r4, #60]
	b	.L116
.L144:
	ldr	r3, [r4, #64]
	add	r3, r3, #1
	str	r3, [r4, #64]
	bl	fireBossBullet
	mov	r3, #0
	ldr	r2, [r4, #64]
	cmp	r2, #9
	str	r3, [r4, #52]
	ble	.L111
	mov	r1, #0
	ldr	r3, [r4, #36]
	ldr	r2, [r4, #68]
	cmp	r3, #0
	rsbne	r2, r2, #0
	add	r3, r3, r2
	strne	r2, [r4, #68]
	str	r3, [r4, #36]
	str	r1, [r4, #64]
	b	.L111
.L147:
	ldr	r0, .L150+12
	bl	updateWaves.part.0
	b	.L123
.L146:
	ldr	r0, .L150+16
	bl	updateWaves.part.0
	b	.L122
.L145:
	mov	r0, r5
	bl	updateWaves.part.0
	b	.L121
.L149:
	mov	r5, #2
	ldr	r6, [r4, #28]
	str	r5, [r4, #28]
	bl	fireWave
	ldr	r2, [r4, #60]
	cmp	r2, #5
	ldrne	r1, [r4, #52]
	moveq	r1, #1
	str	r6, [r4, #28]
	streq	r5, [r4, #40]
	addne	r1, r1, #1
	b	.L120
.L151:
	.align	2
.L150:
	.word	boss
	.word	waves
	.word	bossBullets
	.word	waves+88
	.word	waves+44
	.size	phase1, .-phase1
	.align	2
	.global	phase4
	.syntax unified
	.arm
	.fpu softvfp
	.type	phase4, %function
phase4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L185
	ldr	r2, [r3, #16]
	cmp	r2, #0
	moveq	r2, #1
	push	{r4, r5, r6, lr}
	ldr	r4, .L185+4
	streq	r2, [r3, #16]
	bl	updateMine.part.0
	ldr	r3, [r4, #52]
	cmp	r3, #15
	bgt	.L179
.L163:
	ldr	r3, [r4, #56]
	cmp	r3, #200
	ble	.L154
	mov	r2, #0
	ldr	r3, [r4, #28]
	sub	r1, r3, r2
	rsbs	r3, r1, #0
	adc	r3, r3, r1
	str	r2, [r4, #56]
	str	r3, [r4, #28]
.L154:
	ldr	r3, [r4, #72]
	cmp	r3, #300
	addle	r3, r3, #1
	bgt	.L180
.L156:
	ldr	r5, .L185+8
	ldr	r1, [r4, #56]
	ldr	r2, [r4, #52]
	ldr	r0, [r5, #20]
	add	r1, r1, #1
	add	r2, r2, #1
	cmp	r0, #0
	str	r3, [r4, #72]
	str	r1, [r4, #56]
	str	r2, [r4, #52]
	bne	.L181
.L157:
	ldr	r3, [r5, #64]
	cmp	r3, #0
	bne	.L182
.L158:
	ldr	r3, [r5, #108]
	cmp	r3, #0
	bne	.L183
.L159:
	ldr	r4, .L185+12
	add	r5, r4, #1072
	add	r5, r5, #8
	b	.L161
.L160:
	add	r4, r4, #36
	cmp	r4, r5
	beq	.L184
.L161:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L160
	mov	r0, r4
	add	r4, r4, #36
	bl	updateBossBullets.part.0
	cmp	r4, r5
	bne	.L161
.L184:
	pop	{r4, r5, r6, lr}
	bx	lr
.L179:
	ldr	r3, [r4, #64]
	add	r3, r3, #1
	str	r3, [r4, #64]
	bl	fireBossBullet
	mov	r3, #0
	str	r3, [r4, #52]
	b	.L163
.L183:
	ldr	r0, .L185+16
	bl	updateWaves.part.0
	b	.L159
.L182:
	ldr	r0, .L185+20
	bl	updateWaves.part.0
	b	.L158
.L181:
	mov	r0, r5
	bl	updateWaves.part.0
	b	.L157
.L180:
	bl	fireWave
	mov	r3, #1
	b	.L156
.L186:
	.align	2
.L185:
	.word	mine
	.word	boss
	.word	waves
	.word	bossBullets
	.word	waves+88
	.word	waves+44
	.size	phase4, .-phase4
	.align	2
	.global	updateRays
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRays, %function
updateRays:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #16
	bne	.L203
.L187:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L203:
	ldr	r5, .L206
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r6, .L206+4
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L187
	ldr	r3, [r4, #28]
	cmp	r3, #2
	beq	.L204
	ldr	r2, [r5, #48]
	cmp	r3, r2
	beq	.L205
.L192:
	ldr	r2, .L206+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	b	.L187
.L205:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bne	.L192
	b	.L187
.L204:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bne	.L187
	b	.L192
.L207:
	.align	2
.L206:
	.word	player
	.word	collision
	.word	lives
	.size	updateRays, .-updateRays
	.align	2
	.global	fireRays
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireRays, %function
fireRays:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	movne	r3, #1
	strne	r3, [r0, #36]
	bx	lr
	.size	fireRays, .-fireRays
	.align	2
	.global	stopRays
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopRays, %function
stopRays:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r0, #36]
	strne	r3, [r0, #20]
	bx	lr
	.size	stopRays, .-stopRays
	.align	2
	.global	chargeRayV
	.syntax unified
	.arm
	.fpu softvfp
	.type	chargeRayV, %function
chargeRayV:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, .L263
	ldr	r3, [r9, #40]
	cmp	r3, #2
	sub	sp, sp, #20
	beq	.L259
	cmp	r3, #3
	beq	.L260
.L218:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L260:
	mov	ip, #0
	mov	r7, #64
	mov	r10, ip
	mov	r9, ip
	mov	r8, ip
	mov	r6, #160
	mov	lr, #1
	ldr	r5, .L263+4
	mov	r4, r5
	mov	r3, r5
	ldr	fp, [r5, #48]
	ldr	r5, [r5, #4]
.L230:
	cmp	ip, #0
	str	r7, [r3, #16]
	str	r6, [r3, #12]
	str	r8, [r3, #36]
	str	lr, [r3, #40]
	beq	.L261
	cmp	ip, #1
	beq	.L262
	cmp	ip, #2
	str	lr, [r3, #28]
	str	lr, [r3, #20]
	bne	.L227
	cmp	r9, #0
	strne	r5, [r4, #4]
	cmp	r10, #0
	strne	fp, [r4, #48]
	str	r2, [r4, #92]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L261:
	mov	r5, r0
	mov	r9, #1
	str	ip, [r4, #28]
	str	lr, [r3, #20]
.L227:
	add	ip, ip, #1
	add	r3, r3, #44
	b	.L230
.L259:
	mov	ip, #0
	ldr	r5, .L263+4
	ldr	r3, [r5, #92]
	str	r3, [sp, #4]
	ldr	r3, [r5, #48]
	str	r3, [sp, #12]
	ldr	r3, [r5, #4]
	mov	r4, r5
	str	r3, [sp]
	mov	r10, ip
	mov	fp, ip
	mov	r8, ip
	mov	r7, #64
	mov	r6, #160
	mov	lr, #1
	mov	r3, r5
	str	ip, [sp, #8]
	ldr	r9, [r9, #44]
.L223:
	cmp	ip, #0
	str	r7, [r3, #16]
	str	r6, [r3, #12]
	str	r8, [r3, #36]
	str	lr, [r3, #40]
	beq	.L239
	cmp	ip, #1
	beq	.L240
	cmp	r9, #5
	beq	.L241
	mov	r10, #1
	str	r2, [sp, #4]
.L236:
	mov	r5, #2
.L221:
	cmp	ip, #2
	str	r5, [r3, #28]
	str	lr, [r3, #20]
	beq	.L222
.L234:
	add	ip, ip, #1
	add	r3, r3, #44
	b	.L223
.L239:
	mov	fp, #1
	str	r0, [sp]
.L220:
	cmp	r9, #5
	bne	.L236
	str	lr, [r3, #28]
	str	lr, [r3, #20]
	b	.L234
.L222:
	cmp	fp, #0
	ldrne	r3, [sp]
	strne	r3, [r4, #4]
	ldr	r3, [sp, #8]
	cmp	r3, #0
	ldrne	r3, [sp, #12]
	strne	r3, [r4, #48]
	cmp	r10, #0
	ldrne	r3, [sp, #4]
	strne	r3, [r4, #92]
	b	.L218
.L241:
	mov	r10, #1
	str	r2, [sp, #4]
	mov	r5, r10
	b	.L221
.L240:
	str	r1, [sp, #12]
	str	ip, [sp, #8]
	b	.L220
.L262:
	mov	fp, r1
	mov	r10, ip
	str	ip, [r3, #28]
	str	ip, [r3, #20]
	b	.L227
.L264:
	.align	2
.L263:
	.word	boss
	.word	rays
	.size	chargeRayV, .-chargeRayV
	.align	2
	.global	chargeRayH
	.syntax unified
	.arm
	.fpu softvfp
	.type	chargeRayH, %function
chargeRayH:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L324
	ldr	r3, [r8, #40]
	sub	sp, sp, #28
	cmp	r3, #2
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	beq	.L319
	cmp	r3, #3
	beq	.L320
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L320:
	ldr	r5, [r8, #48]
	mov	r0, #0
	cmp	r5, #2
	cmpne	r5, #5
	ldr	r9, .L324+4
	mov	lr, r9
	moveq	r10, #1
	movne	r10, #0
	mov	r6, r0
	mov	r4, r0
	mov	fp, #240
	mov	ip, #1
	mov	r1, r9
	ldr	r8, [r9, #220]
	ldr	r7, [r9, #176]
	str	r0, [sp, #12]
	ldr	r9, [r9, #132]
	str	lr, [sp, #16]
	sub	r5, r5, #3
.L282:
	mov	lr, #64
	cmp	r3, #3
	str	fp, [r1, #148]
	str	lr, [r1, #144]
	str	r4, [r1, #168]
	str	ip, [r1, #152]
	str	r4, [r1, #172]
	str	ip, [r1, #136]
	beq	.L321
	ldr	lr, [sp, #4]
	cmp	r3, #4
	movne	r8, r2
	movne	r0, #1
	moveq	r7, lr
	moveq	r6, #1
	cmp	r10, #0
	strne	ip, [r1, #160]
	bne	.L291
	cmp	r5, #1
	bls	.L322
.L291:
	cmp	r3, #5
	beq	.L323
.L278:
	add	r1, r1, #44
	add	r3, r3, #1
	b	.L282
.L319:
	mov	ip, #0
	mov	r1, #3
	ldr	r4, .L324+4
	ldr	r3, [r4, #176]
	str	r3, [sp, #20]
	ldr	r3, [r4, #132]
	mov	lr, r4
	str	r3, [sp, #12]
	mov	r7, r1
	mov	fp, ip
	mov	r0, ip
	mov	r6, #240
	mov	r5, #64
	mov	r9, #1
	mov	r3, r4
	str	ip, [sp, #16]
	ldr	r8, [r8, #44]
	ldr	r10, [r4, #220]
.L270:
	cmp	r1, #3
	str	r6, [r3, #148]
	str	r5, [r3, #144]
	str	r0, [r3, #168]
	str	r0, [r3, #172]
	str	r7, [r3, #136]
	beq	.L293
	cmp	r1, #4
	beq	.L294
	cmp	r8, #5
	mov	r10, r2
	mov	ip, #1
	moveq	r4, #0
	beq	.L268
.L287:
	mov	r4, #2
.L268:
	cmp	r1, #5
	str	r4, [r3, #160]
	str	r9, [r3, #152]
	beq	.L269
.L285:
	add	r1, r1, #1
	add	r3, r3, #44
	b	.L270
.L269:
	cmp	fp, #0
	ldrne	r3, [sp, #12]
	strne	r3, [lr, #132]
	ldr	r3, [sp, #16]
	cmp	r3, #0
	ldrne	r3, [sp, #20]
	strne	r3, [lr, #176]
	cmp	ip, #0
	strne	r10, [lr, #220]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L293:
	mov	fp, #1
	ldr	r4, [sp, #8]
	str	r4, [sp, #12]
.L267:
	cmp	r8, #5
	bne	.L287
	str	r0, [r3, #160]
	str	r9, [r3, #152]
	b	.L285
.L323:
	add	r3, sp, #12
	ldm	r3, {r3, lr}
	cmp	r3, #0
	strne	r9, [lr, #132]
	cmp	r6, #0
	strne	r7, [lr, #176]
	cmp	r0, #0
	strne	r8, [lr, #220]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L322:
	str	r10, [r1, #160]
	b	.L291
.L294:
	ldr	r4, [sp, #4]
	str	r4, [sp, #20]
	mov	r4, #1
	str	r4, [sp, #16]
	b	.L267
.L321:
	cmp	r10, #0
	beq	.L315
	ldr	lr, [sp, #16]
	str	r4, [lr, #160]
.L318:
	mov	lr, #1
	ldr	r9, [sp, #8]
	str	lr, [sp, #12]
	b	.L278
.L315:
	cmp	r5, #1
	ldrls	lr, [sp, #16]
	strls	ip, [lr, #160]
	b	.L318
.L325:
	.align	2
.L324:
	.word	boss
	.word	rays
	.size	chargeRayH, .-chargeRayH
	.align	2
	.global	phase2
	.syntax unified
	.arm
	.fpu softvfp
	.type	phase2, %function
phase2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L434
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L424
.L327:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	bne	.L425
.L328:
	ldr	r3, [r4, #108]
	cmp	r3, #0
	bne	.L426
.L329:
	ldr	r4, .L434+4
	add	r5, r4, #1072
	add	r5, r5, #8
	b	.L331
.L330:
	add	r4, r4, #36
	cmp	r4, r5
	beq	.L427
.L331:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L330
	mov	r0, r4
	add	r4, r4, #36
	bl	updateBossBullets.part.0
	cmp	r4, r5
	bne	.L331
.L427:
	ldr	r5, .L434+8
	ldr	r4, [r5, #44]
	cmp	r4, #1
	beq	.L428
	cmp	r4, #2
	beq	.L429
	cmp	r4, #3
	beq	.L430
	cmp	r4, #4
	beq	.L431
	cmp	r4, #5
	beq	.L361
	ldr	r4, [r5, #72]
	add	r4, r4, #1
.L336:
	ldr	r0, .L434+12
	str	r4, [r5, #72]
	bl	updateRays
	ldr	r0, .L434+16
	bl	updateRays
	ldr	r0, .L434+20
	bl	updateRays
	ldr	r0, .L434+24
	bl	updateRays
	ldr	r0, .L434+28
	bl	updateRays
	ldr	r0, .L434+32
	pop	{r4, r5, r6, lr}
	b	updateRays
.L426:
	ldr	r0, .L434+36
	bl	updateWaves.part.0
	b	.L329
.L425:
	ldr	r0, .L434+40
	bl	updateWaves.part.0
	b	.L328
.L424:
	mov	r0, r4
	bl	updateWaves.part.0
	b	.L327
.L428:
	mov	r0, #0
	mov	r2, #128
	mov	r1, #64
	bl	chargeRayV
	ldr	r0, [r5, #72]
	sub	r3, r0, #251
	cmp	r3, #148
	bls	.L432
	cmp	r0, #400
	ble	.L423
	mov	r0, #0
	ldr	r3, .L434+12
	add	r1, r3, #264
.L339:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	strne	r0, [r3, #20]
	add	r3, r3, #44
	cmp	r1, r3
	bne	.L339
	mov	r3, #2
	str	r3, [r5, #44]
	b	.L336
.L432:
	ldr	r3, .L434+12
	add	r1, r3, #264
.L335:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r4, [r3, #36]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L335
.L423:
	add	r4, r0, #1
	b	.L336
.L431:
	mov	r2, #176
	mov	r1, #109
	mov	r0, #24
	bl	chargeRayV
	mov	r2, #100
	mov	r0, #14
	mov	r1, r2
	bl	chargeRayH
	ldr	r4, [r5, #72]
	sub	r3, r4, #251
	cmp	r3, #148
	bhi	.L355
	mov	r0, #1
	ldr	r3, .L434+12
	add	r1, r3, #264
.L357:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L357
.L422:
	add	r4, r4, #1
	b	.L336
.L429:
	mov	r2, #48
	mov	r1, #112
	mov	r0, #176
	bl	chargeRayV
	ldr	r4, [r5, #72]
	sub	r3, r4, #251
	cmp	r3, #148
	bhi	.L341
	mov	r0, #1
	ldr	r3, .L434+12
	add	r1, r3, #264
.L343:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L343
	b	.L422
.L430:
	mov	r2, #152
	mov	r1, #88
	mov	r0, #24
	bl	chargeRayV
	mov	r2, #78
	mov	r0, #14
	mov	r1, r2
	bl	chargeRayH
	ldr	r4, [r5, #72]
	sub	r3, r4, #251
	cmp	r3, #148
	bhi	.L348
	mov	r0, #1
	ldr	r3, .L434+12
	add	r1, r3, #264
.L350:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L350
	b	.L422
.L341:
	cmp	r4, #400
	ble	.L422
	mov	r0, #0
	ldr	r3, .L434+12
	add	r1, r3, #264
.L346:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	strne	r0, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L346
	mov	r3, #3
	mov	r4, #1
	str	r3, [r5, #44]
	b	.L336
.L361:
	mov	r2, #142
	mov	r1, #78
	mov	r0, #14
	bl	chargeRayV
	mov	r2, #96
	mov	r0, #32
	mov	r1, r2
	bl	chargeRayH
	ldr	r4, [r5, #72]
	sub	r3, r4, #251
	cmp	r3, #148
	bls	.L433
	cmp	r4, #400
	ble	.L422
	mov	r0, #0
	ldr	r3, .L434+12
	add	r1, r3, #264
.L367:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	strne	r0, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L367
	mov	r3, #3
	mov	r4, #1
	str	r3, [r5, #40]
	b	.L336
.L348:
	cmp	r4, #400
	ble	.L422
	mov	r0, #0
	ldr	r3, .L434+12
	add	r1, r3, #264
.L353:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	strne	r0, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L353
	mov	r3, #4
	mov	r4, #1
	str	r3, [r5, #44]
	b	.L336
.L355:
	cmp	r4, #400
	ble	.L422
	mov	r0, #0
	ldr	r3, .L434+12
	add	r1, r3, #264
.L360:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	strne	r0, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L360
	mov	r3, #5
	mov	r4, #1
	str	r3, [r5, #44]
	b	.L336
.L433:
	mov	r0, #1
	ldr	r3, .L434+12
	add	r1, r3, #264
.L364:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L364
	b	.L422
.L435:
	.align	2
.L434:
	.word	waves
	.word	bossBullets
	.word	boss
	.word	rays
	.word	rays+44
	.word	rays+88
	.word	rays+132
	.word	rays+176
	.word	rays+220
	.word	waves+88
	.word	waves+44
	.size	phase2, .-phase2
	.align	2
	.global	spawnPortals
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnPortals, %function
spawnPortals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #1
	mov	lr, #64
	mov	r5, #56
	mov	r4, #120
	mov	ip, #16
	mov	r0, #144
	mov	r1, #0
	ldr	r3, .L438
	str	r5, [r3, #4]
	str	r4, [r3, #36]
	str	lr, [r3, #8]
	str	lr, [r3, #40]
	str	r2, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #48]
	str	r2, [r3, #60]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	ip, [r3, #12]
	str	ip, [r3, #44]
	str	r0, [r3]
	str	r0, [r3, #32]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	pop	{r4, r5, lr}
	bx	lr
.L439:
	.align	2
.L438:
	.word	portals
	.size	spawnPortals, .-spawnPortals
	.align	2
	.global	stopPortals
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopPortals, %function
stopPortals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r0, #16]
	bx	lr
	.size	stopPortals, .-stopPortals
	.align	2
	.global	spawnPortalsLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnPortalsLeft, %function
spawnPortalsLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #1
	mov	r1, #0
	mov	r4, #24
	mov	lr, #88
	mov	ip, #16
	mov	r0, #64
	ldr	r3, .L447
	str	r4, [r3]
	str	lr, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #4]
	str	r2, [r3, #48]
	str	r2, [r3, #36]
	str	r2, [r3, #52]
	str	ip, [r3, #8]
	str	ip, [r3, #40]
	str	r0, [r3, #12]
	str	r0, [r3, #44]
	str	r1, [r3, #28]
	str	r1, [r3, #20]
	str	r1, [r3, #60]
	pop	{r4, lr}
	bx	lr
.L448:
	.align	2
.L447:
	.word	portals
	.size	spawnPortalsLeft, .-spawnPortalsLeft
	.align	2
	.global	spawnPortalsRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnPortalsRight, %function
spawnPortalsRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #1
	mov	r5, #24
	mov	r4, #16
	mov	lr, #64
	mov	ip, #0
	mov	r1, #224
	ldr	r3, .L453
	cmp	r0, #0
	str	r2, [r3, #80]
	str	r5, [r3, #64]
	str	r4, [r3, #72]
	str	lr, [r3, #76]
	str	ip, [r3, #92]
	str	r1, [r3, #68]
	bne	.L450
	mov	ip, #88
	str	r4, [r3, #104]
	str	lr, [r3, #108]
	str	r2, [r3, #84]
	str	r2, [r3, #112]
	str	r0, [r3, #124]
	str	r1, [r3, #100]
	str	r0, [r3, #116]
	str	ip, [r3, #96]
	pop	{r4, r5, lr}
	bx	lr
.L450:
	mov	r0, #88
	str	r4, [r3, #104]
	str	lr, [r3, #108]
	str	ip, [r3, #84]
	str	r2, [r3, #112]
	str	ip, [r3, #124]
	str	r1, [r3, #100]
	str	r2, [r3, #116]
	str	r0, [r3, #96]
	pop	{r4, r5, lr}
	bx	lr
.L454:
	.align	2
.L453:
	.word	portals
	.size	spawnPortalsRight, .-spawnPortalsRight
	.align	2
	.global	firePortals
	.syntax unified
	.arm
	.fpu softvfp
	.type	firePortals, %function
firePortals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #88
	mov	r0, #24
	mov	r1, r2
	push	{r4, lr}
	bl	chargeRayH
	mov	r0, #1
	ldr	r3, .L463
	add	r1, r3, #264
.L457:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L457
	pop	{r4, lr}
	bx	lr
.L464:
	.align	2
.L463:
	.word	rays
	.size	firePortals, .-firePortals
	.align	2
	.global	phase3
	.syntax unified
	.arm
	.fpu softvfp
	.type	phase3, %function
phase3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L570
	ldr	r4, [r5, #48]
	cmp	r4, #1
	beq	.L564
	cmp	r4, #2
	ldr	r3, [r5, #72]
	beq	.L565
	cmp	r4, #3
	beq	.L566
	cmp	r4, #4
	beq	.L567
	cmp	r4, #5
	beq	.L506
.L561:
	add	r4, r3, #1
.L470:
	ldr	r0, .L570+4
	str	r4, [r5, #72]
	bl	updateRays
	ldr	r0, .L570+8
	bl	updateRays
	ldr	r0, .L570+12
	bl	updateRays
	ldr	r0, .L570+16
	bl	updateRays
	ldr	r0, .L570+20
	bl	updateRays
	ldr	r0, .L570+24
	pop	{r4, r5, r6, r7, r8, lr}
	b	updateRays
.L565:
	sub	r2, r3, #51
	cmp	r2, #98
	bls	.L563
	sub	r2, r3, #151
	cmp	r2, #98
	bhi	.L479
	mov	r0, #0
	bl	spawnPortalsRight
	ldr	r3, [r5, #72]
.L479:
	sub	r2, r3, #251
	cmp	r2, #148
	bls	.L560
	cmp	r3, #400
	ble	.L561
	mov	r0, #0
	ldr	r3, .L570+4
	add	r1, r3, #264
.L483:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	strne	r0, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L483
	mov	r0, #0
	ldr	r3, .L570+28
	add	r1, r3, #128
.L485:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	strne	r0, [r3, #16]
	add	r3, r3, #32
	cmp	r1, r3
	bne	.L485
	mov	r3, #3
	mov	r4, #1
	str	r3, [r5, #48]
	b	.L470
.L563:
	mov	r1, #1
	mov	r0, #0
	mov	lr, #16
	mov	ip, #64
	mov	r6, #24
	mov	r4, #88
	ldr	r2, .L570+28
	str	r1, [r2, #16]
	str	r1, [r2, #4]
	str	r1, [r2, #48]
	str	r1, [r2, #36]
	str	r1, [r2, #52]
	str	r6, [r2]
	str	r4, [r2, #32]
	str	lr, [r2, #8]
	str	lr, [r2, #40]
	str	ip, [r2, #12]
	str	ip, [r2, #44]
	str	r0, [r2, #28]
	str	r0, [r2, #20]
	str	r0, [r2, #60]
	b	.L561
.L564:
	bl	spawnPortals
	mov	r2, #120
	mov	r0, #56
	mov	r1, r2
	bl	chargeRayV
	ldr	r0, [r5, #72]
	sub	r3, r0, #251
	cmp	r3, #148
	bls	.L568
	cmp	r0, #400
	ble	.L559
	mov	r0, #0
	ldr	r3, .L570+4
	add	r1, r3, #264
.L473:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	strne	r0, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L473
	mov	r0, #0
	ldr	r3, .L570+28
	add	r1, r3, #128
.L475:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	strne	r0, [r3, #16]
	add	r3, r3, #32
	cmp	r1, r3
	bne	.L475
	mov	r3, #2
	str	r3, [r5, #48]
	b	.L470
.L566:
	sub	r2, r3, #51
	cmp	r2, #98
	bls	.L563
	sub	r2, r3, #151
	cmp	r2, #98
	bhi	.L489
	mov	r0, #1
	bl	spawnPortalsRight
	ldr	r3, [r5, #72]
.L489:
	sub	r2, r3, #251
	cmp	r2, #148
	bls	.L560
	cmp	r3, #400
	ble	.L561
	mov	r0, #0
	ldr	r3, .L570+4
	add	r1, r3, #264
.L493:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	strne	r0, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L493
	mov	r0, #0
	ldr	r3, .L570+28
	add	r1, r3, #128
.L495:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	strne	r0, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L495
	mov	r3, #4
	mov	r4, #1
	str	r3, [r5, #48]
	b	.L470
.L568:
	ldr	r3, .L570+4
	add	r1, r3, #264
.L469:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r4, [r3, #36]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L469
.L559:
	add	r4, r0, #1
	b	.L470
.L506:
	sub	r2, r3, #51
	cmp	r2, #98
	bls	.L569
	sub	r2, r3, #151
	cmp	r2, #98
	bhi	.L508
	mov	r0, #0
	bl	spawnPortalsRight
	ldr	r3, [r5, #72]
.L508:
	sub	r2, r3, #251
	cmp	r2, #148
	bls	.L560
	cmp	r3, #400
	add	r4, r3, #1
	ble	.L470
	mov	r0, #0
	ldr	r3, .L570+4
	add	r1, r3, #264
.L511:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r0, [r3, #36]
	strne	r0, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L511
	mov	r0, #0
	ldr	r3, .L570+28
	add	r1, r3, #128
.L513:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	strne	r0, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L513
	mov	r3, #4
	str	r3, [r5, #40]
	b	.L470
.L567:
	sub	r2, r3, #51
	cmp	r2, #98
	bls	.L563
	sub	r2, r3, #151
	cmp	r2, #98
	bhi	.L499
	mov	r0, #0
	bl	spawnPortalsRight
	ldr	r3, [r5, #72]
.L499:
	sub	r2, r3, #251
	cmp	r2, #148
	bhi	.L500
.L560:
	bl	firePortals
	ldr	r4, [r5, #72]
	add	r4, r4, #1
	b	.L470
.L500:
	cmp	r3, #400
	ble	.L561
	mov	r1, #0
	ldr	r3, .L570+4
	add	r0, r3, #264
.L503:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	strne	r1, [r3, #36]
	strne	r1, [r3, #20]
	add	r3, r3, #44
	cmp	r3, r0
	bne	.L503
	mov	r0, #0
	ldr	r3, .L570+28
	add	r1, r3, #128
.L505:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	strne	r0, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L505
	mov	r3, #5
	mov	r4, #1
	str	r3, [r5, #48]
	b	.L470
.L569:
	mov	r1, #1
	mov	r0, #0
	mov	lr, #16
	mov	ip, #64
	mov	r7, #24
	mov	r6, #88
	ldr	r2, .L570+28
	add	r4, r3, r1
	str	r1, [r2, #16]
	str	r1, [r2, #4]
	str	r1, [r2, #48]
	str	r1, [r2, #36]
	str	r1, [r2, #52]
	str	r7, [r2]
	str	r6, [r2, #32]
	str	lr, [r2, #8]
	str	lr, [r2, #40]
	str	ip, [r2, #12]
	str	ip, [r2, #44]
	str	r0, [r2, #28]
	str	r0, [r2, #20]
	str	r0, [r2, #60]
	b	.L470
.L571:
	.align	2
.L570:
	.word	boss
	.word	rays
	.word	rays+44
	.word	rays+88
	.word	rays+132
	.word	rays+176
	.word	rays+220
	.word	portals
	.size	phase3, .-phase3
	.align	2
	.global	spawnMine
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnMine, %function
spawnMine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L574
	ldr	r2, [r3, #16]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3, #16]
	bx	lr
.L575:
	.align	2
.L574:
	.word	mine
	.size	spawnMine, .-spawnMine
	.align	2
	.global	updateMine
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMine, %function
updateMine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L578
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bxeq	lr
	b	updateMine.part.0
.L579:
	.align	2
.L578:
	.word	mine
	.size	updateMine, .-updateMine
	.comm	portals,128,4
	.comm	rays,264,4
	.comm	waves,132,4
	.comm	bossBullets,1080,4
	.comm	mine,28,4
	.comm	player,84,4
	.comm	boss,80,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
