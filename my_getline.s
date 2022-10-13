.text
.globl	my_getline
.type	my_getline, %function

my_getline:
	// x0 holds the adress to store the line
	mov	x8, x0
	mov	x9, 0xffffffff
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	stp	x0, x8, [sp, -16]!
	stp	x9, xzr, [sp, -16]!
.L:
	stp	x8, xzr, [sp, -16]!
	bl	getchar
	ldp	x8, xzr, [sp], 16
	cmp	x0, '\n'
	beq	.ADD_LINE
	cmp	x0, x9 // EOF
	beq	.END
	str	x0, [x8], 1
	//add	x8, x8, 1
	b	.L
.ADD_LINE:
	str	x0, [x8], 1

.END:
	mov	x0, 0
	str	x0, [x8]
	ldp	x9, xzr, [sp], 16
	ldp	x0, x8, [sp], 16
	ldp	x29, x30, [sp], 16
	ret
