# Copyright 2018 Furzoom.com. All Rights Reserved.

.section .data
output:
  # The xxxxxxxxxxxx will be filled later
  .ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"

.section .bss

.section .text
.globl _start
_start:
  movl  $0, %eax        # cpuid 0 query the Vendor ID
  cpuid

  movl  $output, %edi
  movl  %ebx, 28(%edi)  # ebx byte 0~3
  movl  %edx, 32(%edi)  # edx byte 4~7
  movl  %ecx, 36(%edi)  # ecx byte 8~11

  movl  $4, %eax        # system call 4 for write
  movl  $1, %ebx        # ebx, write to STDOUT
  movl  $output, %ecx   # ecx, string address
  movl  $42, %edx       # edx, write length
  int   $0x80

  movl  $1, %eax        # system call 1 for exit
  movl  $0, %ebx        # ebx, exit status
  int   $0x80

