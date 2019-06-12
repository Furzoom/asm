# Copyright 2019 Furzoom.com. All Rights Reserved.

.section .data
# initialized data here

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
.if 1
  movl  $1, %ebx
.else
  movl  $0, %ebx
.endif

  movl  $1, %eax
  int   $0x80

