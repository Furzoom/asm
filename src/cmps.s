# Copyright 2019 Furzoom.com. All Rights Reserved.
# CMPS
#
#   CMPS - compare string
#     CMPSB
#     CMPSW
#     CMPSL
#

.section .data
# initialized data here
value1:
  .ascii "This is a test of the CMPS instructions"
value2:
  .ascii "This is a test of the CMPS Instructions"
length:
  .int 39

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  leal  value1, %esi
  leal  value2, %edi
  movl  length, %ecx
  cld
  repe cmpsb
  je equal

  movl  $1, %eax
  movl  %ecx, %ebx
  int   $0x80

# exit normally
equal:
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

