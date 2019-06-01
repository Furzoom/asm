# Copyright 2019 Furzoom.com. All Rights Reserved.
# Logical operations 
#
#   AND
#   OR
#   NOT
#   XOR

.section .data
# initialized data here
value1:
  .short 0xa5

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movb  $0x3, %al
  andb  $0x1, %al

  notw  value1

  movl  $0x0, %ebx
  orl   value1, %ebx

  xorl  %ebx, %ebx

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

