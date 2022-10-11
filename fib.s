.text
.globl _start

_start:
	mov	x0, 0
	bl	fib
// EXIT
	mov	x8, 93
	svc	0

fib:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	cmp	x0, 1
	ble	.LEQ
	stp	x0, xzr, [sp, -16]!
	sub	x0, x0, 1
	bl	fib
	mov	x1, x0
	ldp	x0, xzr, [sp], 16
	sub	x0, x0, 2
	stp	xzr, x1, [sp, -16]!
	bl	fib
	ldp	xzr, x1, [sp], 16
	add	x0, x0, x1
	b	.EXIT

.LEQ:
	mov	x0, 1
.EXIT:
	ldp	x29, x30, [sp], 16
	ret
