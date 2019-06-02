# Copyright 2019 Furzoom.com. All Rights Reserved.
# sse
#
#   MOVDQU
#   MOVDQA

.section .data
# initialized data here
.align 4
values1:
  .int 1, -1, 2, 3
values2:
  .byte 0xEF, 0xCD, 0xAB, 0x89, 0x67, 0x45, 0x23, 0x01
  .byte 0x10, 0x32, 0x54, 0x76, 0x98, 0xBA, 0xDC, 0xFE

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movdqu  values1, %xmm0
  movdqa  values2, %xmm1

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

