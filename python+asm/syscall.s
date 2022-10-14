.text
.globl	syscall
.type	syscall, %function

syscall:
// syscall(syscall number)
	mov	w8, w0
	svc	0
	ret
