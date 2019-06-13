# Copyright 2019 Furzoom.com. All Rights Reserved.
# Catch the return value of system call
#

.section .data
# initialized data here

.section .bss
#  uninitialized data here
  .lcomm pid, 4
  .lcomm uid, 4
  .lcomm gid, 4

.section .text
.globl _start
_start:
# instruction code goes here
  movl  $20, %eax
  int   $0x80
  movl  %eax, pid

  movl  $24, %eax
  int   $0x80
  movl  %eax, uid

  movl  $47, %eax
  int   $0x80
  movl  %eax, gid

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

