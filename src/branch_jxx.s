# Copyright 2019 Furzoom.com. All Rights Reserved.
# Conditional branch
#
#   JXX <address>
#     JA
#     JAE
#     JB
#     JBE
#     JC
#     JCXZ
#     JECXZ
#     JE
#     JG
#     JGE
#     JL
#     JLE
#     JNA
#     JNAE
#     JNB
#     JNBE
#     JNC
#     JNE
#     JNG
#     JNGE
#     JNL
#     JNLE
#     JNO
#     JNP
#     JNZ
#     JO
#     JP
#     JPE
#     JPO
#     JS
#     JZ
#
#   CLC - Clear the carry flag (set it to zero)
#   CMC - Complement the carry flag
#   STC - Set the carry flag

.section .data
# initialized data here
data:
  .int 10

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  cmp $20, %ebx
  cmp data, %ebx
  movl  $data, %edi
  cmp (%edi), %ebx

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

