# Copyright 2019 Furzoom.com. All Rights Reserved.
# ADC
#

.section .data
# initialized data here
data1:
  .quad 7252051615
data2:
  .quad 5732348928
output:
  .asciz "The result is %qd\n"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  data1, %ebx
  movl  data1+4, %eax
  movl  data2, %edx
  movl  data2+4, %ecx
  addl  %ebx, %edx
  adcl  %eax, %ecx
  pushl %ecx
  pushl %edx
  pushl $output
  call printf
  addl  $12, %esp

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

