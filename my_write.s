.text
.globl	my_write
.type	my_write, %function

my_write:
	mov	x8, 64
	svc	0
	ret
