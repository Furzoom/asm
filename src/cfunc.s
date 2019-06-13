# Copyright 2019 Furzoom.com. All Rights Reserved.
# C function example
#

.section .data
# initialized data here
timespec:
output:
  .asciz "This is a test\n"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  $10, %ecx
loop1:
  pushl %ecx
  pushl $output
  call  printf
  addl  $4, %esp

  pushl $5
  call  sleep
  addl  $4, %esp

  popl  %ecx
  loop  loop1

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

