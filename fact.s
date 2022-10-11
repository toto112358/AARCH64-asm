.text
.globl _start

_start:
	mov	x0, 4
	bl	fact
// EXIT
	mov	x8, 93
	svc	0

fact:
	stp	x29, x30, [sp, -16]!
	stp	x0, xzr, [sp, -16]!
	mov	x29, sp
	cmp	x0, 1
	beq	.EQ
	str	x0, [sp]
	sub	x0, x0, 1
	bl	fact
	ldr	x1, [sp]
	mul	x0, x1, x0
	str	x0, [sp]
.EQ:
	ldp	x0, xzr, [sp], 16
	ldp	x29, x30, [sp], 16
	ret
