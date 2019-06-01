# Copyright 2019 Furzoom.com. All Rights Reserved.
# Extend integer
#
#   MOVZX
#   MOVSX

.section .data
# initialized data here

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  $0x1AA, %ecx
  movzx %cl, %ebx
  movsx %cl, %edx
  movsx %cl, %di

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

