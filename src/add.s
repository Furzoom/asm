# Copyright 2019 Furzoom.com. All Rights Reserved.
# ADD
#

.section .data
# initialized data here
data:
 .int 40

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  xorl  %eax, %eax
  xorl  %ebx, %ebx
  xorl  %ecx, %ecx
  movb  $20, %al
  addb  $10, %al
  movsx %al, %eax

  movw  $100, %cx
  addw  %cx, %bx
  movsx %bx, %ebx

  movl  $100, %edx
  addl  %edx, %edx
  addl  data, %edx
  addl  %eax, data

  movl  $-100, %eax
  movl  $80, %ecx
  addl  %ecx, %eax

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

