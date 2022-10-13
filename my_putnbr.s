.text
.globl	my_putnbr
.globl	my_putchar
.globl _start

my_putnbr:
// x9-x15 are caller saved
// x9 always holds 10
// x1 holds the return value
// x0 and x9 must be stored before function call

	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	cmp	x0, 0
	mov	x9, 10
	bge	.POSITIVE

// NEGATIVE NUMBER
	neg	x0, x0
	//str	x0, [sp, -16]!
	stp	x0, x9, [sp, -16]!
	mov	x0, '-'
	bl	my_putchar
	ldp	x0, x9, [sp], 16
.POSITIVE:
	cmp	x0, 9
	ble	.END
	stp	x0, x9, [sp, -16]!
	sdiv	x0, x0, x9
	bl	my_putnbr
	ldp	x0, x9, [sp], 16
.END:
// x0 mod 10
	sdiv	x10, x0, x9
	mul	x10, x10, x9
	sub	x0, x0, x10
// turn x0 into ascii
	add	x0, x0, '0'
	bl my_putchar
	ldp	x29, x30, [sp], 16
	ret
