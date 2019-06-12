# Copyright 2019 Furzoom.com. All Rights Reserved.
# Environment parameters
#

.section .data
# initialized data here
output1:
  .asciz "\t%s\n"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl (%esp), %eax
  addl $2, %eax
  movl $4, %ecx
  mull %ecx
  movl %esp, %ebp
  addl %eax, %ebp

loop1:
  cmpl $0, (%ebp)
  je endit

  pushl (%ebp)
  pushl $output1
  call printf
  addl $8, %esp
  addl $4, %ebp
  jmp loop1

# exit normally
endit:
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

