# Copyright 2019 Furzoom.com. All Rights Reserved.
# FSTSW, SFTCW
#
#   FSTSW - Store Status Word
#   FSTCW - Store Control Word
#   FLDCW - Load Control Word
#

.section .data
# initialized data here
newvalue:
  .byte 0x7f, 0x00

.section .bss
#  uninitialized data here
  .lcomm status, 2
  .lcomm control, 2

.section .text
.globl _start
_start:
# instruction code goes here
  fstsw %ax
  fstsw status

  fstcw control
  fldcw newvalue
  fstcw control

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

