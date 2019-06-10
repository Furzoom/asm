# Copyright 2019 Furzoom.com. All Rights Reserved.
# IDIV
#   IDIV divisor
#

.section .data
# initialized data here
data1:
  .int -12

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movw  data1, %ax
  movw  data1+2, %dx
  movw  $5, %bx
  idivw %bx

  movw  data1, %ax
  movw  data1+2, %dx
  movw  $-5, %bx
  idivw %bx

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

