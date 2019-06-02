# Copyright 2019 Furzoom.com. All Rights Reserved.
# mmx
#
#   MOVQ
#

.section .data
# initialized data here
values1:
  .int 1, -1
values2:
  .byte 0x10, 0x05, 0xff, 0x32, 0x47, 0xe4, 0x00, 0x01

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movq  values1, %mm0
  movq  values2, %mm1

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

