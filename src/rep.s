# Copyright 2019 Furzoom.com. All Rights Reserved.
# REP
#
#   REP
#     REP
#     REPE/REPZ
#     REPNE/REPNZ
#

.section .data
# initialized data here
value1:
  .ascii "This is a test string.\n"
value2:
  .ascii "Oops"
length:
  .int 23

.section .bss
#  uninitialized data here
  .lcomm output, 23
  .lcomm output2, 23
  .lcomm output3, 23

.section .text
.globl _start
_start:
# instruction code goes here
  leal value1, %esi
  leal output, %edi
  movl $23, %ecx
  cld
  rep movsb

  leal value1, %esi
  leal output2, %edi
  movl $6, %ecx
  rep movsl

  leal value1, %esi
  leal output3, %edi
  movl length, %ecx
  shrl $2, %ecx 

  cld
  rep movsl

  movl length, %ecx
  andl $3, %ecx
  rep movsb

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

