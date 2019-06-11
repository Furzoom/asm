# Copyright 2019 Furzoom.com. All Rights Reserved.
# strcmp
#

.section .data
# initialized data here
length1:
  .int 4
length2:
  .int 4
string1:
  .ascii "test"
string2:
  .ascii "test"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  leal  string1, %esi
  leal  string2, %edi
  movl  length1, %ecx
  movl  length2, %eax
  cmpl  %eax, %ecx
  jb longer
  xchgl %ecx, %eax

longer:
  cld
  repe cmpsb
  je equal
  jg greater

less:
  movl  $1, %eax
  movl  $255, %ebx
  int $0x80

greater:
  movl  $1, %eax
  movl  $1, %ebx
  int $0x80

equal:
  movl  length1, %ecx
  movl  length2, %eax
  cmpl  %ecx, %eax
  jl  greater
  jg  less

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

