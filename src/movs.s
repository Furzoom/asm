# Copyright 2019 Furzoom.com. All Rights Reserved.
# MOVS
#
#   MOVS
#     MOVSB
#     MOVSW
#     MOVSL
#   LEA - load effective address
#     LEAL
#   CLD - clear the DF flag
#   STD - set the DF flag
#

.section .data
# initialized data here
value1:
  .ascii "This is a test string.\n"

.section .bss
#  uninitialized data here
  .lcomm output, 23

.section .text
.globl _start
_start:
# instruction code goes here
  leal value1, %esi
  leal output, %edi
  movsb
  movsw
  movsl

  std
  leal value1 + 22, %esi
  leal output + 22, %edi
  movsb
  movsw
  movsl

  leal value1, %esi
  leal output, %edi
  movl $23, %ecx
  cld
loop1:
  movsb
  loop loop1

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

