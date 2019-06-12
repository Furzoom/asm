# Copyright 2019 Furzoom.com. All Rights Reserved.
# Command parameters
#

.section .data
# initialized data here
output1:
  .asciz "There are %d parameters:\n"
output2:
  .asciz "%s\n"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl (%esp), %ecx
  pushl %ecx
  pushl $output1
  call printf
  addl $8, %esp

  movl (%esp), %ecx
  movl %esp, %ebp
  addl $4, %ebp

loop1:
  pushl %ecx
  pushl (%ebp)
  pushl $output2
  call printf
  addl $8, %esp
  popl %ecx
  addl $4, %ebp
  loop loop1

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

