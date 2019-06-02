# Copyright 2019 Furzoom.com. All Rights Reserved.
# BCD
#
#   FBLD  - converts a BCD value to its 80 bit extended precision equivalent
#           and push the result onto the stack.
#   FBSTP - pops the extended precision real value on tos, converts it to an
#           80 bit BCD value, and stores the converted result at the address
#           specified by the destination memory operand.

.section .data
# initialized data here
data1:
  .byte 0x34, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
data2:
  .int 2

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  fbld  data1
  fimul data2
  fbstp data1

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

