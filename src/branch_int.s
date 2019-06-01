# Copyright 2019 Furzoom.com. All Rights Reserved.
# Unconditional branch
#
#   INT

.section .data
# initialized data here

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

