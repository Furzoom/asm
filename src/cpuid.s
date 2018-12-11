# Copyright 2018 Furzoom.com. All Rights Reserved.

.section .data
output:
  .ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"
.section .bss

.section .text
.globl _start
_start:
  mov  $0, %rax
  cpuid
  mov  $output, %rdi
  movl %ebx, 28(%rdi)
  movl %edx, 32(%rdi)
  movl %ecx, 36(%rdi)

  mov  $4, %rax
  mov  $1, %rbx
  mov  $output, %rcx
  mov  $42, %rdx
  int  $0x80

  mov  $1, %rax
  mov  $0, %rbx
  int  $0x80

