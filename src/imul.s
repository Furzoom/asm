# Copyright 2019 Furzoom.com. All Rights Reserved.
# IMUL
#   IMUL - used for signed integer
#     IMUL destination
#     IMUL source, destination
#     IMUL multiplier, source, destination
#

.section .data
# initialized data here
value1:
  .int 10
value2:
  .int -35
value3:
  .int 400

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  value1, %eax
  imull value2

  movl  value1, %ebx
  movl  value2, %ecx
  imull %ebx, %ecx

  movl  value3, %edx
  imull $2, %edx, %eax

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

