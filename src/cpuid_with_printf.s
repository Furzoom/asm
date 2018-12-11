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
  mov  $0, %rax
  cpuid

  movq $buffer, %rdi
  movl %ebx, (%rdi)
  movl %edx, 4(%rdi)
  movl %ecx, 8(%rdi)

  mov  %rdi, %rsi      # 2nd agrument
  mov  $output, %rdi   # 1st argument
  call printf

  mov  $0, %rdi
  call exit

