# Copyright 2019 Furzoom.com. All Rights Reserved.
# Another system call example, nanosleep
#

.section .data
# initialized data here
timespec:
  .int 5, 0
output:
  .ascii "This is a test\n"
output_end:
  .equ len, output_end - output

.section .bss
#  uninitialized data here
  .lcomm rem, 8

.section .text
.globl _start
_start:
# instruction code goes here
  movl  $10, %ecx
loop1:
  pushl %ecx
  movl  $4, %eax
  movl  $1, %ebx
  movl  $output, %ecx
  movl  $len, %edx
  int   $0x80

  movl  $162, %eax    # nonasleep system call number
  movl  $timespec, %ebx
  movl  $rem, %ecx
  int   $0x80

  popl  %ecx
  loop  loop1

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

