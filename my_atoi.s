.text
.global my_atoi
.align	4


my_atoi:
// int my_atoi(char *x0)
// w9 = *s
// w10 = sign
// w13 = the converted number
	mov	w10, 1
	mov	w12, 10
	mov	x13, 0
// while *s == ' ' : ++s
.L1:
	ldr	x9, [x0]
	and	x9, x9, 255
	cmp	w9, ' '
	bne	.EL1
	add	x0, x0, 1
	b	.L1
.EL1:
// if *s == '-' || *s == '+'
	mov	w11, '+'
	cmp	w9, '-'
	ccmp	w9, w11, 4, ne
	bne	.L2
	cmp	w9, '-'
	cneg	x10, x10, eq
	add	x0, x0, 1
	ldr	x9, [x0]
	and	x9, x9, 255
.L2:
// while still a number
// 0 <= w9 <= 9 inside the loop
	sub	w9, w9, '0'
	cmp	x9, 9
	bgt	.EL2
	mul	w13, w13, w12
	add	w13, w13, w9
	add	x0, x0, 1
	ldr	x9, [x0]
	and	x9, x9, 255
	b	.L2
.EL2:
	mul	x0, x13, x10
	ret
