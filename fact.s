.global	fact
.type	fact, %function

fact:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x0, [sp, 16]
	cmp	x0, 1
	beq	.END
	sub	x0, x0, 1
	bl	fact
	ldr	x9, [sp, 16]
	mul	x0, x9, x0
.END:
	ldp	x29, x30, [sp], 32
	ret
