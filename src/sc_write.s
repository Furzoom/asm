# Copyright 2019 Furzoom.com. All Rights Reserved.
# System call write
#

.section .data
# initialized data here
output:
  .ascii "Using the system call in assemble.\n"
output2:
  .equ len, output2 - output

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  $4, %eax
  movl  $1, %ebx
  movl  $output, %ecx
  movl  $len, %edx
  int   $0x80

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

