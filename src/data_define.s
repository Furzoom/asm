# Copyright 2018 Furzoom.com. All Rights Reserved.
# Define data

.section .data
height:
  .int 1, 2, 3
length:
  .long 4, 5, 6
end:
.equ factor, 3        # factor is identifer
ended:

.section .text
.globl _start
_start:
  movl  $height, %edi
  movl  $length, %eax
  movl  $end, %ebx
  movl  $factor, %ecx
  movl  height, %edx
#movl  factor, %ecx    # this will cause segment fault

  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80


