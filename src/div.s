# Copyright 2019 Furzoom.com. All Rights Reserved.
# DIV
#   DIV divisor
#

.section .data
# initialized data here
dividend:
  .quad 8355
divisor:
  .int 25
quotient:
  .int 0
remainder:
  .int 0
output:
  .asciz "The quotient is %d, and the remainder is %d\n"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  dividend, %eax
  movl  dividend + 4, %edx
  divl  divisor

  movl  %eax, quotient
  movl  %edx, remainder

  pushl remainder
  pushl quotient
  pushl $output
  call  printf
  addl  $0x12, %esp

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

