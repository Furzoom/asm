# Copyright 2019 Furzoom.com. All Rights Reserved.
# SCAS
#
#   SCAS - scan string
#     SCASB
#     SCASW
#     SCASL
#

.section .data
# initialized data here
string1:
  .ascii "This is a test - a long text string to scan."
length:
  .int 44
string2:
  .ascii "-"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  leal string1, %edi
  leal string2, %esi
  movl length, %ecx
  lodsb
  cld
  repne scasb
  jne notfound
  subw length, %cx
  neg %cx
  movl $1, %eax
  movl %ecx, %ebx
  int $0x80

# exit normally
notfound:
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

