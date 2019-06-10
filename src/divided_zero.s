# Copyright 2019 Furzoom.com. All Rights Reserved.
# Divided zero
#

.section .data
# initialized data here

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  $12, %eax
  xorl  %ebx, %ebx

  # check the divisor
  cmpb  $0, %bl
  jz err

  divb  %bl

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

err:
  movl  $1, %eax
  movl  $1, %ebx
  int   $0x80

