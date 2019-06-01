# Copyright 2019 Furzoom.com. All Rights Reserved.
# Unconditional branch
#
#   JUMPS
#     jmp <location>
#     - short jump
#     - near jump
#     - far jump

.section .data
# initialized data here

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  $1, %eax
  movl  $1, %ebx
  jmp end
  movl  $2, %ebx
end:
  int   $0x80

