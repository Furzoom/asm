# Copyright 2019 Furzoom.com. All Rights Reserved.
# MUL
#
#   MUL - used for unsigned integer
#

.section .data
# initialized data here
data1:
  .int 315814266
data2:
  .int 615432877
result1:
  .quad 0
output:
  .asciz "The result is %qd\n"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  data1, %eax
  mull  data2
  movl  %eax, result1
  movl  %edx, result1+4

  pushl %edx
  pushl %eax
  pushl $output
  call  printf
  addl  $12, %esp

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

