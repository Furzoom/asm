# Copyright 2019 Furzoom.com. All Rights Reserved.
# Function definition
#

.section .data
# initialized data here

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  pushl $1
  pushl $2
  call perimeter
  addl  $8, %esp

  pushl $5
  pushl $7
  call perimeter
  addl  $8, %esp

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

.type perimeter, @function
perimeter:
  pushl %ebp
  movl  %esp, %ebp
  subl  $0, %esp    # local parameter

  movl  8(%ebp), %eax
  addl  %eax, %eax
  addl  12(%ebp), %eax
  addl  12(%ebp), %eax

  movl  %ebp, %esp
  popl  %ebp
  ret

