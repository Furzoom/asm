# Copyright 2019 Furzoom.com. All Rights Reserved.

.section .data
# initialized data here

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here

# exit normally
  mov  $1, %eax
  mov  $0, %ebx
  int  $0x80

