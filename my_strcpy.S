#define DEST    x0
#define SRC     x1
#define LENGTH  x2
#define CHAR    w9

.text
.globl  my_strcpy
.type   my_strcpy, %function
.globl  _start

my_strcpy:
// char *
// strcpy(char *dest, const char *src, size_t n)
// size_t is 8 bit unsigned
.L1:
        ldrb     CHAR, [SRC], 1  // load post index
        cmp     LENGTH, 0
        ccmp    CHAR, wzr, 0b0100, gt
        ble     .EL1
        strb     CHAR, [DEST], 1  // store post index
        sub     LENGTH, LENGTH, 1
        b       .L1

.EL1:
        cmp     LENGTH, 0
        beq     .END
        strb    wzr, [DEST], 1
        sub     LENGTH, LENGTH, 1
        b       .EL1
.END:
        ret
