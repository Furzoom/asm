# Copyright 2018 Furzoom.com. All Rights Reserved.
# Define data

.section .data
.align 16
i1:
  .int 1, 2, 3, 4
l1:
  .long 5, 6, 7, 8
o1:
  .octa   0x1234567890ABCDEFFEDCBA0987654321
q1:
  .quad   0x1122334455667788
d1:
  .double 3.1415926
f1:
  .float  2.71828
si1:
  .single 0.5
sh1:
  .short  0xABCD
s1:
  .ascii "This is a string"
s2:
  .asciz "This is a string with trailing null"
s3:
  .byte 'B', 'y', 't', 101
fill:
  .fill 10, 2, 4
end:
  .equ FACTOR, 3        # FACTOR is a static symbol
  .equ FACTOR, 4        # this will override previous FACTOR value
#.equiv FACTOR, 5      # this cause compiling error, FACTOR is already defined

.section .bss
  .lcomm lcomm, 4
  .comm  comm, 4

.section .text
.globl _start
_start:
  movl  $i1, %edi
  movl  $l1, %eax
  movl  $end, %ebx
  movl  $FACTOR, %ecx
  movl  i1, %edx
#movl  FACTOR, %ecx    # this will cause segment fault

  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

