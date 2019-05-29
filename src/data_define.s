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
  mov $height, %edi
  mov $length, %eax
  mov $end, %ebx
  mov $factor, %ecx
  mov height, %edx
#mov factor, %ecx    # this will cause segment fault

  mov $1, %eax
  mov $0, %ebx
  int $0x80


