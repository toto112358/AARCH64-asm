from ctypes import CDLL

syscall = CDLL("./syscall.so").syscall

syscall(93)
print("This should not print")
