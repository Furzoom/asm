# Copyright 2019 Furzoom.com. All Rights Reserved.
# LODS and STOS
#
#   LODS
#   STOS
#

.section .data
# initialized data here
space:
  .ascii " "

.section .bss
#  uninitialized data here
  .lcomm buffer, 256

.section .text
.globl _start
_start:
# instruction code goes here
  leal space, %esi
  leal buffer, %edi
  movl $256, %ecx
  cld
  lodsb
  rep stosb

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

