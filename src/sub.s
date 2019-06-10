# Copyright 2019 Furzoom.com. All Rights Reserved.
# SUB
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
  subb  $10, %al
  movsx %al, %eax

  movw  $100, %cx
  subw  %cx, %bx
  movsx %bx, %ebx

  movl  $100, %edx
  subl  %eax, %edx
  subl  data, %edx
  subl  %eax, data

  movl  $5, %eax
  movl  $2, %ebx
  subl  %eax, %ebx

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

