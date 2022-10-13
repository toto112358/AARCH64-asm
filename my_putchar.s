.text
.globl	my_putchar
.globl	my_write
.type	my_putchar, %function
.type	my_write, %function

my_putchar:
	strb	w0, [sp, -1]
	sub	x1, sp, 1
	mov	x0, 1
	mov	x2, x0
	mov	x8, 64
	svc	0
	ret
