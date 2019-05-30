# Copyright 2018 Furzoom.com. All Rights Reserved.
# View CPUID Vendor ID string using C libray calls.

.section .data
output:
  .asciz "The processor Vendor ID is '%s'\n"

.section .bss
  .lcomm buffer, 12

.section .text
.globl _start
_start:
  movl  $0, %eax
  cpuid

  movl $buffer, %edi
  movl %ebx, (%edi)
  movl %edx, 4(%edi)
  movl %ecx, 8(%edi)

  pushl %edi
  pushl $output

  call printf

  movl  $0, %edi
  call exit

