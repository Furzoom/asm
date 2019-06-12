# Copyright 2019 Furzoom.com. All Rights Reserved.
# Function definition
#

.section .data
# initialized data here
error:
  .ascii "Usage: ./main <width> <length>\n"
errlen:
  .int 31

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  cmpl $3, (%esp)
  jz cal

  movl $4, %eax
  movl $2, %ebx
  movl $error, %ecx
  movl errlen, %edx
  int $0x80

cal:
  pushl 8(%esp)   # 2nd command parameter
  call  toint
  addl  $4, %esp
  push  %eax

  pushl 16(%esp)  # 3rd command parameter
  call  toint
  addl  $4, %esp
  push  %eax

  call  perimeter
  addl  $8, %esp

  movl  %eax, %ebx
  movl  $1, %eax
  int   $0x80

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

