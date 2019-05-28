# Copyright 2018 Furzoom.com. All Rights Reserved.

.section .data
output:
  .ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"
.section .bss

.section .text
.globl _start
_start:
  mov  $0, %eax
  cpuid
  mov  $output, %edi
  movl %ebx, 28(%edi)
  movl %edx, 32(%edi)
  movl %ecx, 36(%edi)

  mov  $4, %eax
  mov  $1, %ebx
  mov  $output, %ecx
  mov  $42, %edx
  int  $0x80

  mov  $1, %eax
  mov  $0, %ebx
  int  $0x80

