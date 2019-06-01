# Copyright 2019 Furzoom.com. All Rights Reserved.
# Unconditional branch
#
#   CALL
#     call <address>
#     ret
#

.section .data
# initialized data here
output:
  .asciz "This is section %d\n"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  pushl $1
  pushl $output
  call  printf
  addl  $8, %esp

  call overhere

  pushl $3
  pushl $output
  call  printf
  addl  $8, %esp

  pushl $0
  call  exit

overhere:
  pushl %ebp
  movl  %esp, %ebp
  pushl $2
  pushl $output
  call  printf
  addl  $8, %esp

  movl  %ebp, %esp
  popl  %ebp
  ret

