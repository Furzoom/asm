# Copyright 2018 Furzoom.com. All Rights Reserved.
# Define data

.section .data
height:
  .int 1, 2, 3
length:
  .long 4, 5, 6
end:
.equ factor, 3
ended:

.section .text
.globl _start
_start:
  mov $height, %rdi
  mov $length, %rax
  mov $end, %rbx
  mov $factor, %rcx

  mov $1, %rax
  mov $0, %rbx
  int $0x80


